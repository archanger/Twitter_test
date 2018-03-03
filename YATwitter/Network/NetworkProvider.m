//
//  NetworkProvider.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "NetworkProvider.h"

@interface NetworkProvider()
@property (nonatomic, strong) NSURLSession* session;
@end

@implementation NetworkProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        _session = [NSURLSession sharedSession];
    }
    return self;
}

- (void)makeRequest:(NSURLRequest*)requrst
  completionSuccess:(nonnull YATNetworkProviderSuccessCompletionHandler)success
  completionFailure:(nonnull YATNetworkProviderFailureCompletionHandler)failure
{
    
    [[_session dataTaskWithRequest:requrst
                 completionHandler:
      ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          
          if (error != nil) {
              dispatch_async(dispatch_get_main_queue(), ^{
                  failure(error);
              });
          }
          
          dispatch_async(dispatch_get_main_queue(), ^{
              success(data);
          });
          
      }] resume];
    
}

@end
