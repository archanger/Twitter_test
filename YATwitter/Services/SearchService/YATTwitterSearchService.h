//
//  YATTwitterSearchService.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTwitterSearchServiceType.h"
#import "YATNetworkProviderType.h"

@class YATAppState;

@interface YATTwitterSearchService : NSObject<YATTwitterSearchServiceType>
- (instancetype)initWithNetworkProvider:(id<YATNetworkProviderType>)provider appState:(YATAppState*)state;
@end
