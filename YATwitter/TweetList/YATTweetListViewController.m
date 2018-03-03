//
//  YATTweetListViewController.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetListViewController.h"
#import "YATTweetCell.h"

@interface YATTweetListViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic, readwrite) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switchControl;
@end

@implementation YATTweetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES];
    self.title = @"Tweets";
    
    self.searchBar.delegate = self.interactor;
    [self.datasource setTableView:self.tableView];
    [self.interactor setByUsername];
    self.switchControl.selectedSegmentIndex = 0;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    
    [self.tableView registerNib:[YATTweetCell nib] forCellReuseIdentifier:[YATTweetCell reuseIdentifier]];
    
    [self.switchControl addTarget:self action:@selector(selectedOptionChanged:) forControlEvents:(UIControlEventValueChanged)];
}

- (void)selectedOptionChanged:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.interactor setByUsername];
            break;
        case 1:
            [self.interactor setBySearch];
            break;
        default:
            break;
    }
}

@end
