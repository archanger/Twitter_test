//
//  YATTwitterHelper.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTwitterHelper.h"

@implementation YATTwitterHelper
+ (nullable NSString*)getTokenFromConfig:(nonnull YATTwitterConfig*)config {
    NSString *URLEncodedKey = [config.key stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *URLEncodedSecret = [config.secret stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    NSString* preparedForEncoding = [[URLEncodedKey stringByAppendingString:@":"]
                                     stringByAppendingString:URLEncodedSecret];
    
    return  [[preparedForEncoding dataUsingEncoding:NSUTF8StringEncoding]
             base64EncodedStringWithOptions:kNilOptions];
}
@end
