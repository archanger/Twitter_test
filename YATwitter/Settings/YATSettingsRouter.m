//
//  YATSettingsRouter.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 07.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATSettingsRouter.h"
#import "YATSettingsViewController.h"
#import "YATSettingsInteractor.h"
#import "YATAppState.h"

@interface YATSettingsRouter ()
@property (nonatomic, weak) UIViewController* rootVC;
@end

@implementation YATSettingsRouter
+ (UIViewController*)settingsScreen {
    __auto_type vc = [[YATSettingsViewController alloc]
                      initWithNibName:NSStringFromClass([YATSettingsViewController class])
                      bundle:[NSBundle mainBundle]];
    
    __auto_type interactor = [[YATSettingsInteractor alloc] initWithAppState:[YATAppState sharedState]];
//    __auto_type router = [[YATSettingsRouter alloc] initWithRootVC:vc];
    
    vc.interactor = interactor;
    interactor.output = vc;
    
    return vc;
}

- (instancetype)initWithRootVC:(UIViewController*)vc {
    if (self = [super init]) {
        _rootVC = vc;
    }
    
    return self;
}
@end
