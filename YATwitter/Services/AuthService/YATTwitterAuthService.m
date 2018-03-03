//
//  YATTwitterService.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTwitterAuthService.h"
#import "YATTwitterHelper.h"
#import "YATTokenMapper.h"
#import "YATAppState.h"

@interface YATTwitterAuthService ()
@property (nonatomic, strong) id<YATNetworkProviderType> provider;
@end

@implementation YATTwitterAuthService

- (instancetype)initWithNetworkProvider:(id<YATNetworkProviderType>)provider {
    if (self = [super init]) {
        _provider = provider;
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
         completionSuccess:^(id _Nonnull responseData) {
             success([[[YATTokenMapper alloc] init] tokenFromJsonObject:responseData]);
         } completionFailure:^(NSError * _Nonnull error) {
             failure(error);
         }
     ];
    
}

@end
