//
//  YATTweetCell.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetCell.h"

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
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        UIImage* image = [UIImage imageWithData:
                          [NSData dataWithContentsOfURL:
                           [NSURL URLWithString:tweet.avatarPath]]
                                          scale:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.avatarView.image = image;
        });
    });
    
}

@end
