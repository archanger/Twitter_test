//
//  YATLaunchFactory.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATLaunchFactory.h"
#import "YATLaunchViewController.h"
#import "YATLaunchInteractor.h"
#import "YATTwitterAuthService.h"
#import "YATAppState.h"
#import "YATLaunchRouter.h"
#import "YATNetworkProvider.h"

@implementation YATLaunchFactory
+ (UIViewController*)launchScreenInRouter:(id<YATLaunchRouterType>) router {
    
    __auto_type vc = [[YATLaunchViewController alloc] initWithNibName:NSStringFromClass([YATLaunchViewController class])
                                                               bundle:[NSBundle mainBundle]];
    __auto_type intercator = [[YATLaunchInteractor alloc] initWithService:[[YATTwitterAuthService alloc]
                                                                           initWithNetworkProvider:[YATNetworkProvider new]]
                                                                    state:[YATAppState sharedState]];
    
    vc.interactor = intercator;
    vc.router = router;
    intercator.output = vc;
    
    return vc;
}
@end
