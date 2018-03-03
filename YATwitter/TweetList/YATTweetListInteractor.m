//
//  YATTweetListInteractor.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetListInteractor.h"

@interface YATTweetListInteractor ()
@property (nonatomic, strong) id<YATTwitterSearchServiceType> service;
@property (nonatomic, assign) BOOL byUsername;

@property (nonatomic, copy) NSString* lastSearchString;
@property (nonatomic, assign) NSInteger secondsToUpdate;
@property (nonatomic, strong) NSTimer* timer;
@end

@implementation YATTweetListInteractor

- (instancetype)initWithService:(id<YATTwitterSearchServiceType>)service {
    if (self = [super init]) {
        _service = service;
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

- (void)setBySearch {
    self.byUsername = NO;
}

- (void)setByUsername {
    self.byUsername = YES;
}

- (void)resetTimerForWord:(NSString*)word {
    self.lastSearchString = word;
    
    [self.timer invalidate];
    self.secondsToUpdate = 60;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
    [self.output setCurrentCountdown:self.secondsToUpdate];
}

- (void)countdown {
    
    if (self.secondsToUpdate == 0) {
        [self searchText:self.lastSearchString];
        return;
    }
    
    self.secondsToUpdate -= 1;
    [self.output setCurrentCountdown:self.secondsToUpdate];
}

@end
