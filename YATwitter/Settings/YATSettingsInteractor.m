//
//  YATSettingsInteractor.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 07.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATSettingsInteractor.h"
#import "YATAppState.h"

@interface YATSettingsInteractor ()
@property (nonatomic, strong) YATAppState* appState;
@end

@implementation YATSettingsInteractor

- (instancetype)initWithAppState:(YATAppState*)appState {
    if (self = [super init]) {
        _appState = appState;
    }
    
    return self;
}

- (void)setShowAvatar:(BOOL)showOrNot {
    [self.appState setNeedToShowAvatar:showOrNot];
}

- (void)setUpOutput {
    [self.output setAvatarSettings:self.appState.isNeedToShowAvatar];
}
@end
