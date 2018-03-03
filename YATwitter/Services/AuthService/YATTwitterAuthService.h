//
//  YATTwitterService.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTwitterAuthServiceType.h"
#import "YATNetworkProviderType.h"

@class YATAppState;

@interface YATTwitterAuthService : NSObject<YATTwitterAuthServiceType>
- (instancetype)initWithNetworkProvider:(id<YATNetworkProviderType>)provider;
- (instancetype)init NS_UNAVAILABLE;
@end
