//
//  LaunchViewController.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATLaunchViewController.h"
#import "YATAppState.h"

@interface YATLaunchViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@end

@implementation YATLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    [self auth];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self stopLoadingAnimation];
}

- (void)setupViews {
    [_loader setColor:[UIColor colorWithRed:0.31 green:0.71 blue:0.95 alpha:1.00]];
}

- (void)authDone {
    NSLog(@"token: %@", [YATAppState sharedState].token.value);
    [self.router openNext];
}

- (void)errorMessage:(NSString *)message {
    
    [self stopLoadingAnimation];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self auth];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)startLoadingAnimation {
    _loader.hidden = NO;
    [_loader startAnimating];
}

- (void)stopLoadingAnimation {
    [_loader stopAnimating];
    _loader.hidden = YES;
}

- (void)auth {
    [self.interactor authApp];
    [self startLoadingAnimation];
}
@end
