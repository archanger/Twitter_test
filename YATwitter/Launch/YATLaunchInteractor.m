//
//  LaunchInteractor.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATLaunchInteractor.h"
#import "YATTwitterService.h"
#import "YATAppState.h"

@interface YATLaunchInteractor ()
@property (nonatomic, strong) YATTwitterService* service;
@property (nonatomic, strong) YATAppState* appState;
@end

@implementation YATLaunchInteractor

- (instancetype)initWithService:(YATTwitterService*) service
                          state:(YATAppState*) state{
    if (self = [super init]) {
        _service = service;
    }
    
    return self;
}

- (void)authApp {
    
    __weak typeof(self) wekSelf = self;
    
    [_service authenticateAppWithConfig:[[YATTwitterConfig alloc] init]
        success:^(YATAuthToken * _Nonnull token) {
            wekSelf.appState.token = token;
        } failure:^(NSError * _Nonnull error) {
            
        }
     ];
}
@end
