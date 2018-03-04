//
//  YATTwitterReadwriteSearchServiceType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 04.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTwitterSearchServiceType.h"

typedef void(^YATTwitterReadwriteSearchServiceTypeCompletion)();

@protocol YATTwitterReadwriteSearchServiceType <YATTwitterSearchServiceType>
- (void)putTweets:(NSArray<YATTweet*>*)tweets completion:(YATTwitterReadwriteSearchServiceTypeCompletion)completion;
@end
