//
//  YATTwitterService.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTwitterConfig.h"
#import "YATAuthToken.h"

typedef void(^YATTwitterServiceSuccessCompletion)(YATAuthToken* _Nonnull token);
typedef void(^YATTwitterServiceFailureCompletion)(NSError* _Nonnull error);

@interface YATTwitterService : NSObject
- (void)authenticateAppWithConfig:(nonnull YATTwitterConfig*)config
                          success:(nonnull YATTwitterServiceSuccessCompletion)success
                          failure:(nonnull YATTwitterServiceFailureCompletion) failure;
@end
