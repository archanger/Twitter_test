//
//  YATLaunchRouter.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATLaunchRouter.h"
#import "YATLaunchFactory.h"
#import "YATTweetListRouter.h"

@interface YATLaunchRouter ()
@property (nonatomic, weak) UINavigationController* rootVC;
@end

@implementation YATLaunchRouter

+ (UIViewController*)launchScreen {
    
    __auto_type router = [[YATLaunchRouter alloc] init];
    __auto_type vc = [YATLaunchFactory launchScreenInRouter:router];
    __auto_type navigation = [[UINavigationController alloc] initWithRootViewController:vc];
    [navigation setNavigationBarHidden:YES];
    router.rootVC = navigation;
    
    return navigation;
}

- (void)openNext {
    __auto_type listVC = [YATTweetListRouter tweetList];
    [self.rootVC setNavigationBarHidden:NO animated:YES];
    [self.rootVC.navigationBar setTranslucent:NO];
    [self.rootVC pushViewController:listVC animated:YES];
}
@end
