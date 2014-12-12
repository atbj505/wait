//
//  LogInViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()
@property (nonatomic, strong)LoginView *logView;
@end

@implementation LogInViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证页";
    self.navigationItem.titleView = [TitleView TitleViewWithTitle:@"验证页"];
    [self backImage:@"yanzhengye.png"];
    [self updateUI];
}
- (void)updateUI{
    self.logView = [[LoginView alloc]initWithFrame:self.view.frame];
    self.logView.loginTextField.delegate = self;
    [self.view addSubview:self.logView];
    
    [self.logView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length == 10) {
        self.logView.loginButton.enabled = YES;
        [self.logView.loginButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    }
    return YES;
}
- (void)next{
    //[self startLoginOperation];
    ValidateViewController *validateVC = [[ValidateViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:validateVC animated:YES];
}
#pragma mark -
#pragma mark 注册网络请求
- (void)startLoginOperation{
    LoginOperation *operation = [LoginOperation operationWithDelegate:self];
    operation.params = @{
                         @"mobile":self.logView.loginTextField.text
                         };
    [operation start];
    [SVProgressHUD showInView:self.view];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    if ([operation isKindOfClass:[LoginOperation class]]) {
        if ([[operation.responseData objectForKey:@"success"] isEqualToString:@"1"]) {
            [self.logView.loginTextField resignFirstResponder];
            ValidateViewController *validateVC = [[ValidateViewController alloc]initWithNibName:nil bundle:nil];
            validateVC.mobile = [operation.params objectForKey:@"mobile"];
            [self.navigationController pushViewController:validateVC animated:YES];
        }else{
            [PXAlertView showAlertWithTitle:@"验证码发送失败,请稍后再试"];
        }
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    [PXAlertView showAlertWithTitle:@"网络错误"];
}
@end
