//
//  RYImageView.m
//  wait
//
//  Created by 杨启晖 on 14/12/13.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYImageView.h"

@implementation RYImageView
- (void)withImageName:(NSString *)string{
    [self sd_setImageWithURL:[NSURL URLWithString:string]];
}
- (void)withImageName:(NSString *)string andPlaceHolder:(NSString *)holder{
    [self sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:[UIImage imageNamed:holder]];
}
@end
