//
//  RYImageView.h
//  wait
//
//  Created by 杨启晖 on 14/12/13.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface RYImageView : UIImageView
- (void)withImageName:(NSString *)string;
- (void)withImageName:(NSString *)string andPlaceHolder:(NSString *)holder;
@end
