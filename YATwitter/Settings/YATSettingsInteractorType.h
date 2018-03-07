//
//  YATSettingsInteractorType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 07.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YATSettingsInteractorType <NSObject>
- (void)setUpOutput;
- (void)setShowAvatar:(BOOL)showOrNot;
@end
