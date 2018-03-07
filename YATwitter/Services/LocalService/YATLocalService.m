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
#import "YATTweetMapper.h"

@import CoreData;

@interface YATLocalService ()
@property (nonatomic, strong) id<YATCoreDataProviderType> provider;
@end

@implementation YATLocalService

- (instancetype)initWithCDProvider: (id<YATCoreDataProviderType>)provider {
    if (self = [super init]) {
        _provider = provider;
    }
    return self;
}

- (void)getTweetsByWord:(NSString *)word completion:(YATTwitterServiceTweetsCompletion)completion {
    
    if(word.length == 0) {
        completion(nil);
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        __auto_type context = [self.provider.persistentContainer newBackgroundContext];
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
    if(username.length == 0) {
        completion(nil);
        return;
    }
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        __auto_type context = [self.provider.persistentContainer newBackgroundContext];
        __auto_type request = [Tweet fetchRequest];
        request.predicate = [NSPredicate predicateWithFormat:@"SUBQUERY(user, $u, $u.username ==[cd] %@).@count > 0", username];
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
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        __auto_type context = [self.provider.persistentContainer newBackgroundContext];
        
        for (YATTweet* tweet in tweets) {
            
            __auto_type request = [Tweet fetchRequest];
            request.predicate = [NSPredicate predicateWithFormat:@"tweetID == %@", tweet.tweetID];
            NSError* error;
            Tweet* twt = [[context executeFetchRequest:request error:&error] firstObject];
            
            if (twt) {
                [self updateCDTweet:twt withTweet:tweet];
            } else {
                [self createNewCDTweetFromTweet:tweet inContext:context];
            }
        }
        
        NSError* error;
        [context save:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion();
        });
    });
    
}

- (void)updateCDTweet:(Tweet*)CDTweet withTweet:(YATTweet*)tweet {
    CDTweet.text = tweet.text;
    CDTweet.user.username = tweet.username;
    CDTweet.user.avatarUrl = tweet.avatarPath;
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
        cdTweet.user = user;
    } else {
        cdTweet.user = [self createUserFromTweet:tweet inContext:context];
    }
}

- (void)updateUser:(User*)user fromTweet:(YATTweet*)tweet {
    user.username = tweet.username;
    user.avatarUrl = tweet.avatarPath;
}

- (User*)createUserFromTweet:(YATTweet*)tweet inContext:(NSManagedObjectContext*)context {
    User* user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user.userID = tweet.userID;
    [self updateUser:user fromTweet:tweet];
    
    return user;
}

@end
