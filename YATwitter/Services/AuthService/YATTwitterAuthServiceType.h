//
//  YATTwitterAuthServiceType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATAuthToken.h"
#import "YATTwitterConfig.h"

typedef void(^YATTwitterServiceSuccessCompletion)(YATAuthToken* _Nonnull token);
typedef void(^YATTwitterServiceFailureCompletion)(NSError* _Nonnull error);

@protocol YATTwitterAuthServiceType <NSObject>
- (void)authenticateAppWithConfig:(nonnull YATTwitterConfig*)config
                          success:(nonnull YATTwitterServiceSuccessCompletion)success
                          failure:(nonnull YATTwitterServiceFailureCompletion)failure;
@end
