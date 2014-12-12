//
//  ValidateView.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "ValidateView.h"

@implementation ValidateView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addButton];
        [self addTextLabel:@"验证码已发送,请查收"];
        [self addLineView];
        [self addLoginText:@"验证码:"];
        [self addLoginTextField];
        [self addLoginButton:@"完成"];
    }
    return self;
}
@end
