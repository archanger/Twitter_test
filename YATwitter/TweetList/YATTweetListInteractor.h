//
//  YATTweetListInteractor.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTweetListInteractorType.h"
#import "YATTwitterService.h"
#import "YATAppState.h"
#import "YATTweetListDatasourceType.h"

@interface YATTweetListInteractor : NSObject<YATTweetListInteractorType>
@property (nonatomic, strong) id<YATTweetListDatasourceType> datasource;

- (instancetype)initWithService:(YATTwitterService*)service appState:(YATAppState*)state;
@end
