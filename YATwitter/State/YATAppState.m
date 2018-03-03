//
//  YATAppState.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATAppState.h"

@implementation YATAppState

+ (instancetype)sharedState {
    static dispatch_once_t onceToken;
    static YATAppState* shared = nil;
    dispatch_once(&onceToken, ^{
        shared = [[YATAppState alloc] init];
    });
    
    return shared;
}

@end
