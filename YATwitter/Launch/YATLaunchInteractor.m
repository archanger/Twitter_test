//
//  LaunchInteractor.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATLaunchInteractor.h"
#import "YATTwitterAuthService.h"
#import "YATAppState.h"

@interface YATLaunchInteractor ()
@property (nonatomic, strong) YATTwitterAuthService* service;
@property (nonatomic, strong) YATAppState* appState;
@end

@implementation YATLaunchInteractor

- (instancetype)initWithService:(YATTwitterAuthService*) service
                          state:(YATAppState*) state{
    if (self = [super init]) {
        _service = service;
        _appState = state;
    }
    
    return self;
}

- (void)authApp {
    
    __weak typeof(self) weakSelf = self;
    
    [_service authenticateAppWithConfig:[[YATTwitterConfig alloc] init]
        success:^(YATAuthToken * _Nonnull token) {
            [weakSelf onSuccess:token];
        } failure:^(NSError * _Nonnull error) {
            [weakSelf onFailure:error];
        }
     ];
}

- (void)onSuccess:(YATAuthToken*) token {
    self.appState.token = token;
    [self.output authDone];
}

- (void)onFailure:(NSError*) error {
    [self.output errorMessage:error.localizedDescription];
}
@end
