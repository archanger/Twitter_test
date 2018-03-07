//
//  YATAppState.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATAppState.h"

#define YAT_KEY_FOR_AVATAR @"YAT_KEY_FOR_AVATAR"

//@interface YATAppState ()
//
//@end

@implementation YATAppState

@synthesize isNeedToShowAvatar = _isNeedToShowAvatar;

+ (instancetype)sharedState {
    static dispatch_once_t onceToken;
    static YATAppState* shared = nil;
    dispatch_once(&onceToken, ^{
        shared = [[YATAppState alloc] init];
    });
    
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        _isNeedToShowAvatar = [[NSUserDefaults standardUserDefaults] boolForKey:YAT_KEY_FOR_AVATAR];
    }
    
    return self;
}

- (void)setNeedToShowAvatar:(BOOL)isNeedToShowAvatar {
    @synchronized(self) {
        BOOL oldValue = _isNeedToShowAvatar;
        _isNeedToShowAvatar = isNeedToShowAvatar;
        if (oldValue != isNeedToShowAvatar) {
            [[NSNotificationCenter defaultCenter] postNotificationName:YAT_STATE_CHANGED_NOTIFICATION object:@{YAT_AVATAR_STATE_KEY: @(_isNeedToShowAvatar)}];
        }
        [self saveState];
    }
}

- (BOOL)isNeedToShowAvatar {
    return _isNeedToShowAvatar;
}

- (void)saveState {
    [[NSUserDefaults standardUserDefaults] setBool:_isNeedToShowAvatar forKey:YAT_KEY_FOR_AVATAR];
}

- (void)dealloc {
    [self saveState];
}

@end
