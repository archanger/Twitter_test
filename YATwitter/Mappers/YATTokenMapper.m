//
//  YATTokenMapper.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTokenMapper.h"

@implementation YATTokenMapper

- (YATAuthToken*)tokenFromJsonData:(NSData*)data {
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    
    if (error) {
        return nil;
    }
    
    YATAuthToken* token = [[YATAuthToken alloc] init];
    token.value = [json objectForKey:@"access_token"];
    
    return token;
}

@end
