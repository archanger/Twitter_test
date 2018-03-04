//
//  Avatar+CoreDataProperties.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 04.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//
//

#import "Avatar+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Avatar (CoreDataProperties)

+ (NSFetchRequest<Avatar *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *identifier;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
