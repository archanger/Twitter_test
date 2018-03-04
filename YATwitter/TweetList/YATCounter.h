//
//  YATCounter.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YATCounter;

@protocol YATCounterDelegate <NSObject>
- (void)counter:(YATCounter*)counter didChangeTimer:(NSInteger)count;
@end

@interface YATCounter : NSObject
@property (nonatomic, assign) NSInteger numOfSecondsToFire;
@property (nonatomic, weak) id<YATCounterDelegate> delegate;

- (void)setTarget:(id)target action:(SEL)action;
- (void)start;
- (void)stop;
- (void)reset;

@end
