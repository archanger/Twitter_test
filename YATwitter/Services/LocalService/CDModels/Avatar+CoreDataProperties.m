//
//  Avatar+CoreDataProperties.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 04.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//
//

#import "Avatar+CoreDataProperties.h"

@implementation Avatar (CoreDataProperties)

+ (NSFetchRequest<Avatar *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Avatar"];
}

@dynamic identifier;
@dynamic url;
@dynamic user;

@end
