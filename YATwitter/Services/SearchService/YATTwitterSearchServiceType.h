//
//  YATTwitterSearchServiceType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YATTweet.h"

typedef void(^YATTwitterServiceTweetsCompletion)(NSArray<YATTweet*>* _Nullable tweets);

@protocol YATTwitterSearchServiceType <NSObject>
- (void)getTweetsForUsername:(nonnull NSString*)username completion:(nonnull YATTwitterServiceTweetsCompletion)completion;
- (void)getTweetsByWord:(nonnull NSString*)word completion:(nonnull YATTwitterServiceTweetsCompletion)completion;
@end
