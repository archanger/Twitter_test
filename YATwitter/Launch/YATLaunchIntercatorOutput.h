//
//  YATLaunchIntercatorOutput.h
//  YATwitter
//
//  Created by Кирилл Чуянов on 03.03.2018.
//  Copyright © 2018 Кирилл Чуянов. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YATLaunchIntercatorOutput <NSObject>
- (void)authDone;
- (void)errorMessage:(NSString*) message;
@end
