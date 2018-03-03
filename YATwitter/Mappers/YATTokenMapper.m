//
//  YATTokenMapper.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTokenMapper.h"

@implementation YATTokenMapper

- (YATAuthToken*)tokenFromJsonObject:(NSDictionary*)object {
    
    YATAuthToken* token = [[YATAuthToken alloc] init];
    token.value = [object objectForKey:@"access_token"];
    
    return token;
}

@end
