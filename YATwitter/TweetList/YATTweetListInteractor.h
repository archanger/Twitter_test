//
//  YATTweetListInteractor.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTweetListInteractorType.h"
#import "YATTwitterSearchServiceType.h"
#import "YATAppState.h"
#import "YATTweetListDatasourceType.h"
#import "YATTweetListInteractorOutput.h"

@interface YATTweetListInteractor : NSObject<YATTweetListInteractorType>
@property (nonatomic, weak) id<YATTweetListInteractorOutput> output;
@property (nonatomic, strong) id<YATTweetListDatasourceType> datasource;

- (instancetype)initWithService:(id<YATTwitterSearchServiceType>)service;
@end
