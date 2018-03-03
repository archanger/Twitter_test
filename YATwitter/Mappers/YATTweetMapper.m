//
//  YATTweetMapper.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetMapper.h"

@implementation YATTweetMapper

- (NSArray<YATTweet*>*)tweetsFromJsonData:(NSData*)data {
    NSError* error;
    NSArray* json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
    
    if (error) {
        return nil;
    }
    
    if ([json isKindOfClass:[NSDictionary class]] && ([(NSDictionary*)json objectForKey:@"errors"] || [(NSDictionary*)json objectForKey:@"error"])) {
        return nil;
    }
    
    if ([json isKindOfClass:[NSDictionary class]] && [(NSDictionary*)json objectForKey:@"statuses"]) {
        json = [(NSDictionary*)json objectForKey:@"statuses"];
    }
    
    NSMutableArray<YATTweet*>* result = [[NSMutableArray alloc] init];
    
    for (NSDictionary* tweet in json) {
        YATTweet* twt = [self tweetFromJSONDictionary:tweet];
        [result addObject:twt];
    }
    
    return [result copy];
}

- (YATTweet*)tweetFromJSONDictionary:(NSDictionary*)dict {
    
    __auto_type tweet = [[YATTweet alloc] init];
    tweet.tweetID = [dict objectForKey:@"id_str"];
    tweet.text = [dict objectForKey:@"text"];
    tweet.userID = [dict valueForKeyPath:@"user.id_str"];
    tweet.username = [dict valueForKeyPath:@"user.screen_name"];
    tweet.avatarPath = [dict valueForKeyPath:@"user.profile_image_url_https"];
    
    return tweet;
    
}

@end
