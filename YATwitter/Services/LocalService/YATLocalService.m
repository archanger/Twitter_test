//
//  YATLocalService.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 04.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATLocalService.h"
#import "User+CoreDataProperties.h"
#import "Tweet+CoreDataProperties.h"
#import "User+CoreDataProperties.h"
#import "Avatar+CoreDataProperties.h"
#import "YATTweetMapper.h"

@interface YATLocalService ()
@property (nonatomic, strong) NSPersistentContainer* container;
@end

@implementation YATLocalService

- (instancetype)initWithPersostentContainer:(NSPersistentContainer*)container {
    if (self = [super init]) {
        _container = container;
    }
    return self;
}

- (void)getTweetsByWord:(NSString *)word completion:(YATTwitterServiceTweetsCompletion)completion {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        __auto_type context = [self.container newBackgroundContext];
        __auto_type request = [Tweet fetchRequest];
        request.predicate = [NSPredicate predicateWithFormat:@"text CONTAINS[cd] %@", word];
        request.fetchLimit = 100;
        NSError* error;
        NSArray<Tweet*>* CDTweets = [context executeFetchRequest:request error:&error];
        __auto_type tweets = [[[YATTweetMapper alloc] init] tweetsFromCDTweets:CDTweets];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(tweets);
        });
    });
}

- (void)getTweetsForUsername:(NSString *)username completion:(YATTwitterServiceTweetsCompletion)completion {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        __auto_type context = [self.container newBackgroundContext];
        __auto_type request = [Tweet fetchRequest];
        request.predicate = [NSPredicate predicateWithFormat:@"SUBQUERY(user, $u, $u.username CONTAINS[cd] %@).@count > 0", username];
        request.fetchLimit = 100;
        NSError* error;
        NSArray<Tweet*>* CDTweets = [context executeFetchRequest:request error:&error];
        __auto_type tweets = [[[YATTweetMapper alloc] init] tweetsFromCDTweets:CDTweets];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(tweets);
        });
    });
}

- (void)putTweets:(NSArray<YATTweet *> *)tweets completion:(YATTwitterReadwriteSearchServiceTypeCompletion)completion {
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        __auto_type context = [self.container newBackgroundContext];
        
        for (YATTweet* tweet in tweets) {
            
            __auto_type request = [Tweet fetchRequest];
            request.predicate = [NSPredicate predicateWithFormat:@"tweetID == %@", tweet.tweetID];
            NSError* error;
            Tweet* twt = [[context executeFetchRequest:request error:&error] firstObject];
            
            if (twt) {
                [self updateCDTweet:twt withTweet:tweet];
            } else {
                //create
            }
            
            
        }
    });
    
}

- (void)updateCDTweet:(Tweet*)CDTweet withTweet:(YATTweet*)tweet {
    CDTweet.text = tweet.text;
    CDTweet.user.username = tweet.username;
    CDTweet.user.avatar.url = tweet.avatarPath;
}

- (void)createNewCDTweetFromTweet:(YATTweet*)tweet inContext:(NSManagedObjectContext*)context {
    
    Tweet* cdTweet = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:context];
    cdTweet.tweetID = tweet.tweetID;
    cdTweet.text = tweet.text;
    
    __auto_type request = [User fetchRequest];
    request.predicate = [NSPredicate predicateWithFormat:@"userID == %@", tweet.userID];
    NSError* error;
    User* user = [[context executeFetchRequest:request error:&error] firstObject];
    if (user) {
        [self updateUser:user fromTweet:tweet];
    } else {
        cdTweet.user = [self createUserFromTweet:tweet inContext:context];
    }
}

- (void)updateUser:(User*)user fromTweet:(YATTweet*)tweet {
    user.username = tweet.username;
    user.avatar.url = tweet.avatarPath;
}

- (User*)createUserFromTweet:(YATTweet*)tweet inContext:(NSManagedObjectContext*)context {
    User* user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user.userID = tweet.userID;
    user.username = tweet.username;
    
    Avatar* ava = [NSEntityDescription insertNewObjectForEntityForName:@"Avatar" inManagedObjectContext:context];
    ava.url = tweet.avatarPath;
    
    ava.user = user;
    
    return user;
}

@end
