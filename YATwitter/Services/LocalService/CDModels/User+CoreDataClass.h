//
//  User+CoreDataClass.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 06.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Avatar, Tweet;

NS_ASSUME_NONNULL_BEGIN

@interface User : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "User+CoreDataProperties.h"
