//
//  YATCachingTweetService.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 06.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATCachingTweetService.h"

@interface YATCachingTweetService ()
@property (nonatomic, strong) id<YATTwitterReadwriteSearchServiceType> cache;
@property (nonatomic, strong) id<YATTwitterSearchServiceType> service;
@end

@implementation YATCachingTweetService

- (instancetype)initWithCache:(id<YATTwitterReadwriteSearchServiceType>)cache realService:(id<YATTwitterSearchServiceType>)service {
    if (self = [super init]) {
        _cache = cache;
        _service = service;
    }
    
    return self;
}

- (void)getTweetsByWord:(NSString *)word completion:(YATTwitterServiceTweetsCompletion)completion {
    
    [self.cache getTweetsByWord:word completion:completion];
    
    __weak typeof(self) weakSelf = self;
    
    [self.service getTweetsByWord:word completion:^(NSArray<YATTweet *> * _Nullable tweets) {
        if (tweets == nil)
            return ;
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.cache putTweets:tweets completion:^{
            completion(tweets);
        }];
    }];
    
}

- (void)getTweetsForUsername:(NSString *)username completion:(YATTwitterServiceTweetsCompletion)completion {
    
    [self.cache getTweetsForUsername:username completion:completion];
    
    __weak typeof(self) weakSelf = self;
    
    [self.service getTweetsForUsername:username completion:^(NSArray<YATTweet *> * _Nullable tweets) {
        if (tweets == nil)
            return ;
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.cache putTweets:tweets completion:^{
            completion(tweets);
        }];
    }];
}

@end
