//
//  YATCounter.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATCounter.h"

@interface YATCounter ()
@property (nonatomic, strong) NSTimer* timer;
@property (nonatomic, assign) NSInteger currentCounter;

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;
@end

@implementation YATCounter

- (void)setNumOfSecondsToFire:(NSInteger)numOfSecondsToFire {
    _numOfSecondsToFire = numOfSecondsToFire;
    _currentCounter = numOfSecondsToFire;
}

- (void)start {
    _currentCounter = self.numOfSecondsToFire;
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(repeat) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:(NSRunLoopCommonModes)];
}

- (void)repeat {
    if (self.currentCounter == 0) {
        if (self.target != nil) {
            [self.target performSelectorOnMainThread:self.action withObject:nil waitUntilDone:NO];
        }
        [self reset];
        return;
    }
    
    self.currentCounter -= 1;
    [self.delegate counter:self didChangeTimer:self.currentCounter];
}

- (void)reset {
    self.currentCounter = self.numOfSecondsToFire;
}

- (void)stop {
    [self.timer invalidate];
}

- (void)setTarget:(id)target action:(SEL)action {
    self.target = target;
    self.action = action;
}

- (void)dealloc {
    [self.timer invalidate];
}
@end
