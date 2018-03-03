//
//  NetworkProvider.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATNetworkProvider.h"

@interface YATNetworkProvider()
@property (nonatomic, strong) NSURLSession* session;
@end

@implementation YATNetworkProvider

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
          
          NSError* jsonError;
          id json = [NSJSONSerialization JSONObjectWithData:data
                                                          options:kNilOptions
                                                            error:&jsonError];
          
          if (jsonError) {
              dispatch_async(dispatch_get_main_queue(), ^{
                  failure(error);
              });
          }
          
          if ([json isKindOfClass:[NSDictionary class]] && [(NSDictionary*)json objectForKey:@"error"]) {
              dispatch_async(dispatch_get_main_queue(), ^{
                  failure([NSError errorWithDomain:@"Response Error"
                                              code:10001
                                          userInfo:@{ NSLocalizedDescriptionKey: [(NSDictionary*)json objectForKey:@"error"]}]);
              });
          }
          
          if ([json isKindOfClass:[NSDictionary class]] && [(NSDictionary*)json objectForKey:@"errors"]) {
              
              NSMutableArray* errors = [[NSMutableArray alloc] init];
              
              for (NSDictionary* error in [(NSDictionary*)json objectForKey:@"errors"]) {
                  [errors addObject:[error objectForKey:@"message"]];
              }
              
              dispatch_async(dispatch_get_main_queue(), ^{
                  failure([NSError errorWithDomain:@"Response Error"
                                              code:10002
                                          userInfo:@{ NSLocalizedDescriptionKey: [errors componentsJoinedByString:@", "] }]);
              });
          }
          
          dispatch_async(dispatch_get_main_queue(), ^{
              success(json);
          });
          
      }] resume];
    
}

@end
