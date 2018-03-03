//
//  LaunchInteractor.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATLaunchIntercatorType.h"

@class YATTwitterService;
@class YATAppState;

@interface YATLaunchInteractor : NSObject <YATLaunchIntercatorType>
- (instancetype)initWithService:(YATTwitterService*) service
                          state:(YATAppState*) state;
@end
