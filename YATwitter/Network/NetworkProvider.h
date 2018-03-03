//
//  NetworkProvider.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^YATNetworkProviderSuccessCompletionHandler)(NSData* _Nonnull responseData);
typedef void(^YATNetworkProviderFailureCompletionHandler)(NSError* _Nonnull  error);

@interface NetworkProvider : NSObject
- (void)makeRequest:(nonnull NSURLRequest*)requrst
  completionSuccess:(nonnull YATNetworkProviderSuccessCompletionHandler)success
  completionFailure:(nonnull YATNetworkProviderFailureCompletionHandler)failure;
@end
