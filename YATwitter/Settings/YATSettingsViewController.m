//
//  YATSettingsViewController.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 07.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATSettingsViewController.h"

@interface YATSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switcherView;
@end

@implementation YATSettingsViewController

- (IBAction)onSwitchValueChanged:(UISwitch *)sender {
    [self.interactor setShowAvatar:sender.isOn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Settings";
    [self.interactor setUpOutput];
}

- (void)setAvatarSettings:(BOOL)showOrNot {
    [self.switcherView setOn:showOrNot];
}
@end
