//
//  UIImageView+YATExtensions.m
//  YATwitter
//
//  Created by Кирилл Чуянов on 07.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import "UIImageView+YATExtensions.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation UIImageView (YATExtensions)
- (void)yat_setImageWithPath:(NSString*)imagePath {
    NSURL* url = [NSURL URLWithString:imagePath];
    [self sd_setImageWithURL:url];
}
@end
