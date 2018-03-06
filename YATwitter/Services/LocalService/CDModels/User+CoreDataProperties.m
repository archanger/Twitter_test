//
//  User+CoreDataProperties.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 06.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic userID;
@dynamic username;
@dynamic avatar;
@dynamic tweets;

@end
