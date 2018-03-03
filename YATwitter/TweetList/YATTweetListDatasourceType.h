//
//  YATTweetListDatasourceType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YATTweet.h"

@protocol YATTweetListDatasourceType <UITableViewDataSource>
- (void)setTableView:(UITableView*)tableView;
- (void)setTweets:(NSArray<YATTweet*>*)tweets;
@end
