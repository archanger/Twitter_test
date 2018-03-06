//
//  YATCoreDataProviderType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 06.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSPersistentContainer;

@protocol YATCoreDataProviderType <NSObject>
- (NSPersistentContainer*)persistentContainer;
@end
