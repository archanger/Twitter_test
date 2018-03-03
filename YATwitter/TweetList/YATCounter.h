//
//  YATCounter.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YATCounter : NSObject
@property (nonatomic, assign) NSInteger numOfSecondsToFire;

- (void)start;

@end
