//
//  YATTweetListInteractor.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetListInteractor.h"

@interface YATTweetListInteractor ()
@property (nonatomic, strong) YATTwitterService* service;
@property (nonatomic, strong) YATAppState* state;
@end

@implementation YATTweetListInteractor

- (instancetype)initWithService:(YATTwitterService*)service appState:(YATAppState*)state {
    if (self = [super init]) {
        _service = service;
        _state = state;
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
    __weak typeof(self) weakSelf = self;
    [self.service getTweetsForUsername:text completion:^(NSArray<YATTweet *> * _Nullable tweets) {
        NSLog(@"%lu", tweets.count);
        [weakSelf.datasource setTweets:tweets];
    }];
}

@end
