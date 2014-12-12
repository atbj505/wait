//
//  LogBaseView.h
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogBaseView : UIView
@property (nonatomic, strong)UITextField *loginTextField;
@property (nonatomic, strong)UIButton *loginButton;

/**
 *  背景点击
 */
- (void)addButton;
/**
 *  添加提示语
 */
- (void)addTextLabel:(NSString *)string;
/**
 *  添加下滑线
 */
- (void)addLineView;
/**
 *  添加输入框提示
 */
- (void)addLoginText:(NSString *)string;
/**
 *  添加输入框
 */
- (void)addLoginTextField;
/**
 *  添加确认按钮
 */
- (void)addLoginButton:(NSString *)string;
@end
