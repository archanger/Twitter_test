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

@interface YATTwitterService ()
@property (nonatomic, strong) NetworkProvider* provider;
@end

@implementation YATTwitterService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _provider = [[NetworkProvider alloc] init];
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
@end
