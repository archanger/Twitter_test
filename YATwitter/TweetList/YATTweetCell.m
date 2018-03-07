//
//  YATTweetCell.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "YATTweetCell.h"
#import "UIImageView+YATExtensions.h"
#import "YATAppState.h"

#define DEFAULT_WIDTH_OF_AVATAR 44

@interface YATTweetCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthOfAvatarConstraint;
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applyStateChange:) name:YAT_STATE_CHANGED_NOTIFICATION object:nil];
    
    self.widthOfAvatarConstraint.constant = [[YATAppState sharedState] isNeedToShowAvatar] ? DEFAULT_WIDTH_OF_AVATAR : 0;
}

- (void)updateWithTweet:(YATTweet *)tweet {
    self.text.text = tweet.text;
    self.username.text = tweet.username;
    [self.avatarView yat_setImageWithPath:tweet.avatarPath];
    
}

- (void)applyStateChange:(NSNotification*)notification {
    NSDictionary* newState = notification.object;
    BOOL value = [[newState objectForKey:YAT_AVATAR_STATE_KEY] boolValue];
    
    if (value) {
        self.widthOfAvatarConstraint.constant = DEFAULT_WIDTH_OF_AVATAR;
    } else {
        self.widthOfAvatarConstraint.constant = 0;
    }
}

- (void)dealloc {
    
}
@end
