//
//  YATTweetListInteractor.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetListInteractor.h"
#import "YATCounter.h"

@interface YATTweetListInteractor () <YATCounterDelegate>
@property (nonatomic, strong) id<YATTwitterSearchServiceType> service;
@property (nonatomic, assign) BOOL byUsername;

@property (nonatomic, copy) NSString* lastSearchString;
@property (nonatomic, strong) YATCounter* countdown;
@end

@implementation YATTweetListInteractor

- (instancetype)initWithService:(id<YATTwitterSearchServiceType>)service {
    if (self = [super init]) {
        _service = service;
        _countdown = [[YATCounter alloc] init];
        _countdown.numOfSecondsToFire = 60;
        [_countdown setTarget:self action:@selector(countdownAction)];
        _countdown.delegate = self;
        [_countdown start];
        [self resetTimerForWord:nil];
    }
    
    return self;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self debounceSearch:searchText];
}

- (void)debounceSearch:(NSString*)text {
    __weak typeof(self) weakSalf = self;
    [NSObject cancelPreviousPerformRequestsWithTarget:weakSalf];
    [weakSalf performSelector:@selector(searchText:) withObject:text afterDelay:0.2];
}

- (void)searchText:(NSString*)text {
    
    [self resetTimerForWord:text];
    
    __weak typeof(self) weakSelf = self;
    if (self.byUsername) {
        [self.service getTweetsForUsername:text completion:^(NSArray<YATTweet *> * _Nullable tweets) {
            [weakSelf.datasource setTweets:tweets];
        }];
    } else {
        [self.service getTweetsByWord:text completion:^(NSArray<YATTweet *> * _Nullable tweets) {
            [weakSelf.datasource setTweets:tweets];
        }];
    }
}

- (void)resetTimerForWord:(NSString*)word {
    self.lastSearchString = word;
    
    [self.countdown reset];
    [self.output setCurrentCountdown:self.countdown.numOfSecondsToFire];
}

- (void)setBySearch {
    self.byUsername = NO;
}

- (void)setByUsername {
    self.byUsername = YES;
}



- (void)countdownAction {
    
    [self searchText:self.lastSearchString];
}

- (void)counter:(YATCounter *)counter didChangeTimer:(NSInteger)count {
    [self.output setCurrentCountdown:count];
}

@end
