//
//  Tweet+CoreDataProperties.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 04.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//
//

#import "Tweet+CoreDataProperties.h"

@implementation Tweet (CoreDataProperties)

+ (NSFetchRequest<Tweet *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Tweet"];
}

@dynamic tweetID;
@dynamic text;
@dynamic user;

@end
