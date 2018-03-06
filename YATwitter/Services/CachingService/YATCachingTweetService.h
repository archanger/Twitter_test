//
//  YATCachingTweetService.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 06.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTwitterSearchServiceType.h"
#import "YATTwitterReadwriteSearchServiceType.h"

@interface YATCachingTweetService : NSObject<YATTwitterSearchServiceType>
- (instancetype)initWithCache:(id<YATTwitterReadwriteSearchServiceType>)cache realService:(id<YATTwitterSearchServiceType>)service;
- (instancetype)init NS_UNAVAILABLE;
@end
