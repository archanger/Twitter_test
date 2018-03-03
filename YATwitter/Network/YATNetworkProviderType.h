//
//  YATNetworkProviderType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^YATNetworkProviderSuccessCompletionHandler)(id _Nonnull responseJSON);
typedef void(^YATNetworkProviderFailureCompletionHandler)(NSError* _Nonnull  error);

@protocol YATNetworkProviderType <NSObject>
- (void)makeRequest:(nonnull NSURLRequest*)requrst
  completionSuccess:(nonnull YATNetworkProviderSuccessCompletionHandler)success
  completionFailure:(nonnull YATNetworkProviderFailureCompletionHandler)failure;
@end
