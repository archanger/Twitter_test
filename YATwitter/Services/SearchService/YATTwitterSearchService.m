//
//  YATTwitterSearchService.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTwitterSearchService.h"
#import "YATAppState.h"
#import "YATTweetMapper.h"

@interface YATTwitterSearchService ()
@property (nonatomic, strong) id<YATNetworkProviderType> provider;
@property (nonatomic, strong) YATAppState* state;
@end

@implementation YATTwitterSearchService

- (instancetype)initWithNetworkProvider:(id<YATNetworkProviderType>)provider appState:(YATAppState*)state {
    if (self = [super init]) {
        _provider = provider;
        _state = state;
    }
    
    return self;
}

- (void)getTweetsForUsername:(nonnull NSString*)username completion:(nonnull YATTwitterServiceTweetsCompletion)completion {
    NSString* authorization = [@"Bearer " stringByAppendingString:self.state.token.value];
    NSString* format = [NSString stringWithFormat:@"https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=%@", username];
    NSURL* url = [NSURL URLWithString:format];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    [request addValue:authorization forHTTPHeaderField:@"Authorization"];

    [_provider makeRequest:request
         completionSuccess:^(id _Nonnull responseData) {
             completion([[[YATTweetMapper alloc] init] tweetsFromJsonObject:responseData]);
         } completionFailure:^(NSError * _Nonnull error) {
             completion(nil);
         }
     ];
    
}

- (void)getTweetsByWord:(nonnull NSString*)word completion:(nonnull YATTwitterServiceTweetsCompletion)completion {
    NSString* authorization = [@"Bearer " stringByAppendingString:self.state.token.value];
    NSString* format = [NSString stringWithFormat:@"https://api.twitter.com/1.1/search/tweets.json?q=%@", word];
    NSURL* url = [NSURL URLWithString:format];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    [request addValue:authorization forHTTPHeaderField:@"Authorization"];
    
    [_provider makeRequest:request
         completionSuccess:^(id _Nonnull responseData) {
             completion([[[YATTweetMapper alloc] init] tweetsFromJsonObject:responseData]);
         } completionFailure:^(NSError * _Nonnull error) {
             completion(nil);
         }
     ];
    
}

@end
