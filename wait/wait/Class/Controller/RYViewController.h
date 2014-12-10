//
//  RYViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "QBaseViewController.h"

@interface RYViewController : QBaseViewController
@property (nonatomic, strong)UIImageView *photoImage;
/**
 *  背景图片
 */
- (void)backImage:(NSString *)string;
/**
 *  头像图片
 */
- (void)photoImage:(CGRect)frame;
@end
