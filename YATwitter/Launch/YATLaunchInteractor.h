//
//  LaunchInteractor.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATLaunchIntercatorType.h"
#import "YATLaunchIntercatorOutput.h"

@class YATTwitterAuthService;
@class YATAppState;

@interface YATLaunchInteractor : NSObject <YATLaunchIntercatorType>
@property (nonatomic, weak) id<YATLaunchIntercatorOutput> output;


- (instancetype)initWithService:(YATTwitterAuthService*) service
                          state:(YATAppState*) state;
@end
