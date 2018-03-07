//
//  YATSettingsViewController.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 07.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YATSettingsInteractorType.h"
#import "YATSettingInteractorOutputType.h"

@interface YATSettingsViewController : UIViewController<YATSettingInteractorOutputType>
@property (nonatomic, strong) id<YATSettingsInteractorType> interactor;
@end
