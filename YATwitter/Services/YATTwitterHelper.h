//
//  YATTwitterHelper.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTwitterConfig.h"

@interface YATTwitterHelper : NSObject
+ (nullable NSString*)getTokenFromConfig:(nonnull YATTwitterConfig*)config;
@end
