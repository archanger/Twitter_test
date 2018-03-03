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
}

- (void)repeat {
    if (self.currentCounter == 0) {
        
        return;
    }
    
    self.currentCounter -= 0;
}
@end
