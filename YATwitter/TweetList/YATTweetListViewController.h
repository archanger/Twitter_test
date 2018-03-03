//
//  YATTweetListViewController.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YATTweetListInteractorType.h"
#import "YATTweetListDatasourceType.h"
#import "YATTweetListInteractorOutput.h"

@interface YATTweetListViewController : UIViewController <YATTweetListInteractorOutput>
@property (nonatomic, strong) id<YATTweetListInteractorType> interactor;
@property (weak, nonatomic) id<YATTweetListDatasourceType> datasource;
@end
