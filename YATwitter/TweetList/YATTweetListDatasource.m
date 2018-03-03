//
//  YATTweetListDatasource.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetListDatasource.h"
#import "YATTweet.h"
#import "YATTweetCell.h"

@interface YATTweetListDatasource ()
@property (nonatomic, strong) NSArray<YATTweet*>* tweets;
@property (nonatomic, weak) UITableView* tableView;
@end

@implementation YATTweetListDatasource

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.dataSource = self;
}

- (void)setTweets:(NSArray<YATTweet *> *)tweets {
    _tweets = tweets;
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YATTweetCell* cell = [tableView dequeueReusableCellWithIdentifier:[YATTweetCell reuseIdentifier]];
    
    __auto_type tweet = self.tweets[indexPath.row];
    
    [cell updateWithTweet:tweet];
    
    return cell;
}
@end
