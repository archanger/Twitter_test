//
//  YATSettingsInteractor.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 07.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATSettingsInteractorType.h"
#import "YATSettingInteractorOutputType.h"

@class YATAppState;

@interface YATSettingsInteractor : NSObject <YATSettingsInteractorType>
@property (nonatomic, weak) id<YATSettingInteractorOutputType> output;

- (instancetype)initWithAppState:(YATAppState*)appState;
- (instancetype)init NS_UNAVAILABLE;
@end
