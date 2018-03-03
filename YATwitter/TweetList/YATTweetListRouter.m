//
//  YATTweetListRouter.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetListRouter.h"
#import "YATTweetListViewController.h"
#import "YATTweetListInteractor.h"
#import "YATTwitterService.h"
#import "YATTweetListDatasource.h"

@implementation YATTweetListRouter

+ (UIViewController*)tweetList {
    __auto_type list = [[YATTweetListViewController alloc] initWithNibName:NSStringFromClass([YATTweetListViewController class])
                                                                    bundle:[NSBundle mainBundle]];
    __auto_type interactor = [[YATTweetListInteractor alloc] initWithService:[[YATTwitterService alloc] init]
                                                                    appState:[YATAppState sharedState]];
    __auto_type datasource = [[YATTweetListDatasource alloc] init];
    
    list.interactor = interactor;
    list.datasource = datasource;
    interactor.datasource = datasource;
    
    return list;
}
@end
