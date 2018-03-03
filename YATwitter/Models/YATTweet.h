//
//  YATTweet.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YATTweet : NSObject
@property (nonatomic, copy) NSString* tweetID;
@property (nonatomic, copy) NSString* text;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString* userID;
@property (nonatomic, copy) NSString* avatarPath;
@end
