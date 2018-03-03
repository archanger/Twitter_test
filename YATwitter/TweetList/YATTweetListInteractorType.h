//
//  YATTweetListInteractorType.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YATTweetListInteractorType <UISearchBarDelegate>
- (void)setByUsername;
- (void)setBySearch;
@end
