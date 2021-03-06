//
//  YATTweetMapper.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetMapper.h"
#import "Tweet+CoreDataProperties.h"
#import "User+CoreDataProperties.h"

@implementation YATTweetMapper

- (NSArray<YATTweet*>*)tweetsFromJsonObject:(NSArray*)object; {
    
    if ([object isKindOfClass:[NSDictionary class]] && [(NSDictionary*)object objectForKey:@"statuses"]) {
        object = [(NSDictionary*)object objectForKey:@"statuses"];
    }
    
    NSMutableArray<YATTweet*>* result = [[NSMutableArray alloc] init];
    
    for (NSDictionary* tweet in object) {
        YATTweet* twt = [self tweetFromJSONDictionary:tweet];
        [result addObject:twt];
    }
    
    return [result copy];
}

- (YATTweet*)tweetFromJSONDictionary:(NSDictionary*)dict {
    
    YATTweet* tweet = [[YATTweet alloc] init];
    tweet.tweetID = [dict objectForKey:@"id_str"];
    tweet.text = [dict objectForKey:@"text"];
    tweet.userID = [dict valueForKeyPath:@"user.id_str"];
    tweet.username = [dict valueForKeyPath:@"user.screen_name"];
    tweet.avatarPath = [dict valueForKeyPath:@"user.profile_image_url_https"];
    
    return tweet;
    
}

- (NSArray<YATTweet*>*)tweetsFromCDTweets:(NSArray<Tweet*>*)CDTweets {
    NSMutableArray<YATTweet*>* result = [[NSMutableArray alloc] init];
    
    for (Tweet* twt in CDTweets) {
        YATTweet* tweet = [[YATTweet alloc] init];
        tweet.tweetID = twt.tweetID;
        tweet.text = twt.text;
        tweet.username = twt.user.username;
        tweet.userID = twt.user.userID;
        tweet.avatarPath = twt.user.avatarUrl;
        
        [result addObject:tweet];
    }
    
    return [result copy];
}

@end
