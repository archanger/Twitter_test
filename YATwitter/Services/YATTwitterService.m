//
//  YATTwitterService.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTwitterService.h"
#import "YATTwitterHelper.h"
#import "NetworkProvider.h"
#import "YATTokenMapper.h"
#import "YATAppState.h"
#import "YATTweetMapper.h"

@interface YATTwitterService ()
@property (nonatomic, strong) NetworkProvider* provider;
@property (nonatomic, strong) YATAppState* state;
@end

@implementation YATTwitterService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _provider = [[NetworkProvider alloc] init];
        _state = [YATAppState sharedState];
    }
    return self;
}

- (void)authenticateAppWithConfig:(nonnull YATTwitterConfig*) config
                          success:(nonnull YATTwitterServiceSuccessCompletion)success
                          failure:(nonnull YATTwitterServiceFailureCompletion) failure {
    
    NSString* authToken = [YATTwitterHelper getTokenFromConfig:config];
    NSURL* url = [NSURL URLWithString:@"https://api.twitter.com/oauth2/token?grant_type=client_credentials"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request addValue:[@"Basic " stringByAppendingString:authToken] forHTTPHeaderField:@"Authorization"];
    
    [_provider makeRequest:request
         completionSuccess:^(NSData * _Nonnull responseData) {
             success([[[YATTokenMapper alloc] init] tokenFromJsonData:responseData]);
         } completionFailure:^(NSError * _Nonnull error) {
             failure(error);
         }
     ];
    
}

- (void)getTweetsForUsername:(nonnull NSString*)username completion:(nonnull YATTwitterServiceTweetsCompletion)completion {
    NSString* authorization = [@"Bearer " stringByAppendingString:self.state.token.value];
    NSString* format = [NSString stringWithFormat:@"https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=%@", username];
    NSURL* url = [NSURL URLWithString:format];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    [request addValue:authorization forHTTPHeaderField:@"Authorization"];
    
    [_provider makeRequest:request
         completionSuccess:^(NSData * _Nonnull responseData) {
             completion([[[YATTweetMapper alloc] init] tweetsFromJsonData:responseData]);
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
         completionSuccess:^(NSData * _Nonnull responseData) {
             completion([[[YATTweetMapper alloc] init] tweetsFromJsonData:responseData]);
         } completionFailure:^(NSError * _Nonnull error) {
             completion(nil);
         }
     ];
    
}

@end
