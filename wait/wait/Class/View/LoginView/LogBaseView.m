//
//  LogBaseView.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "LogBaseView.h"

@implementation LogBaseView
/**
 *  背景点击
 */
- (void)addButton{
    UIButton *button = [[UIButton alloc]initWithFrame:self.frame];
    [self insertSubview:button atIndex:0];
    [button addTarget:self action:@selector(tapScreen) forControlEvents:UIControlEventTouchUpInside];
}
/**
 *  添加提示语
 */
- (void)addTextLabel:(NSString *)string{
    //  提示语
    UILabel *label = [[UILabel alloc]init];
    label.text = string;
    label.font = FONT(18);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    // 提示语背景
    UIImageView *backImage = [[UIImageView alloc]init];
    backImage.image = [UIImage imageNamed:@"kuang.png"];
    [self insertSubview:backImage belowSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(74);
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.width.mas_equalTo(@300);
        make.height.mas_equalTo(@100);
    }];
    
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(label);
    }];
}
/**
 *  添加下滑线
 */
- (void)addLineView{
    //  下划线
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor hexColor:@"302628"];
    [self addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(237);
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(@1);
    }];
}
/**
 *  添加输入框提示
 */
- (void)addLoginText:(NSString *)string{
    UILabel *label = [[UILabel alloc]init];
    label.text = string;
    label.font = FONT(17);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_top).offset(215);
        make.width.mas_equalTo(@83);
        make.height.mas_equalTo(@18);
    }];
}
/**
 *  添加输入框
 */
- (void)addLoginTextField{
    self.loginTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 209, 30)];
    self.loginTextField.backgroundColor = [UIColor clearColor];
    self.loginTextField.textColor = [UIColor whiteColor];
    self.loginTextField.font = FONT(16);
    self.loginTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.loginTextField.keyboardAppearance = UIKeyboardAppearanceDark;
    self.loginTextField.borderStyle = UITextBorderStyleNone;
    [self addSubview:self.loginTextField];
    
    [self.loginTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(101);
        make.top.mas_equalTo(self.mas_top).offset(209);
        make.width.mas_equalTo(@209);
        make.height.mas_equalTo(@30);
    }];
}
/**
 *  添加确认按钮
 */
- (void)addLoginButton:(NSString *)string{
    self.loginButton = [[UIButton alloc]init];
    [self.loginButton setTitle:string forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = FONT(15);
    self.loginButton.backgroundColor = [UIColor hexColor:@"02E2A3"];
    self.loginButton.layer.cornerRadius = 15;
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.enabled = NO;
    [self addSubview:self.loginButton];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(120);
        make.top.mas_equalTo(self.mas_top).offset(268);
        make.width.mas_equalTo(@80);
        make.height.mas_equalTo(@30);
    }];
}
- (void)tapScreen{
    [self.loginTextField resignFirstResponder];
}
@end
