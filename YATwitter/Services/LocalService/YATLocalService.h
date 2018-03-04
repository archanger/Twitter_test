//
//  YATLocalService.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 04.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTwitterReadwriteSearchServiceType.h"
@import CoreData;


@interface YATLocalService : NSObject <YATTwitterReadwriteSearchServiceType>
- (instancetype)initWithPersostentContainer:(NSPersistentContainer*)container;
@end
