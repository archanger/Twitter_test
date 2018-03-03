//
//  LaunchViewController.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YATLaunchIntercatorType.h"
#import "YATLaunchIntercatorOutput.h"
#import "YATLaunchRouterType.h"

@interface YATLaunchViewController : UIViewController <YATLaunchIntercatorOutput>
@property (nonatomic, strong) id<YATLaunchIntercatorType> interactor;
@property (nonatomic, strong) id<YATLaunchRouterType> router;
@end
