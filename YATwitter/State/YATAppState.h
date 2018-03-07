//
//  YATAppState.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATAuthToken.h"

@interface YATAppState : NSObject
@property (atomic, strong) YATAuthToken* token;
@property (atomic, assign, setter=setNeedToShowAvatar:) BOOL isNeedToShowAvatar;

+ (instancetype)sharedState;
@end
