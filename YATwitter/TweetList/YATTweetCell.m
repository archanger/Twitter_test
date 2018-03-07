//
//  YATTweetCell.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetCell.h"
#import "UIImageView+YATExtensions.h"

@interface YATTweetCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *text;
@end

@implementation YATTweetCell

+ (UINib*)nib {
    return [UINib nibWithNibName:NSStringFromClass(self) bundle:[NSBundle mainBundle]];
}

+ (NSString*)reuseIdentifier {
    return NSStringFromClass(self);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)updateWithTweet:(YATTweet *)tweet {
    self.text.text = tweet.text;
    self.username.text = tweet.username;
    [self.avatarView yat_setImageWithPath:tweet.avatarPath];
    
}

@end
