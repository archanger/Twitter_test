//
//  YATTwitterConfig.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 02/03/2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTwitterConfig.h"

@implementation YATTwitterConfig
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString* path = [self pathToConfig];
        NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:path];
        _key = [dict objectForKey:@"key"];
        _secret = [dict objectForKey:@"secret"];
    }
    return self;
}

- (NSString*)pathToConfig {
    return [[NSBundle mainBundle] pathForResource:NSStringFromClass([self class])
                                           ofType:@"plist"];
}
@end
