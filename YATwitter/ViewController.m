//
//  ViewController.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "ViewController.h"
#import "YATTwitterService.h"

@interface ViewController ()
@property (nonatomic, strong) YATTwitterService* service;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _service = [[YATTwitterService alloc] init];
    [_service authenticateAppWithConfig:[[YATTwitterConfig alloc] init]
     success:^(YATAuthToken * _Nonnull token) {
         NSLog(@"%@", token.value);
     } failure:^(NSError * _Nonnull error) {
         NSLog(@"%@", error);
     }
    ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
