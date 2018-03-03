//
//  YATLaunchFactory.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YATLaunchRouterType.h"

@interface YATLaunchFactory : NSObject
+ (UIViewController*)launchScreenInRouter:(id<YATLaunchRouterType>) router;
@end
