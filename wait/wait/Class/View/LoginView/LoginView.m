//
//  LoginView.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addButton];
        [self addTextLabel:@"首次登录请验证您的相关信息"];
        [self addLineView];
        [self addLoginText:@"手机号:"];
        [self addLoginTextField];
        [self addLoginButton:@"获取验证"];
    }
    return self;
}
@end
