//
//  YATTweetMapper.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTweet.h"

@class Tweet;

@interface YATTweetMapper : NSObject
- (NSArray<YATTweet*>*)tweetsFromJsonObject:(NSArray*)object;
- (NSArray<YATTweet*>*)tweetsFromCDTweets:(NSArray<Tweet*>*)CDTweets;
@end
