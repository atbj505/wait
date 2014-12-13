//
//  ValidateViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "ValidateViewController.h"

@interface ValidateViewController ()
@property (nonatomic, strong)ValidateView *validateView;
@end

@implementation ValidateViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self naviTitle:@"认证页"];
    [self backImage:@"yanzhengye.png"];
    [self updateUI];
    [self nickNameAlert];
}
- (void)updateUI{
    self.validateView = [[ValidateView alloc]initWithFrame:self.view.frame];
    self.validateView.loginTextField.delegate = self;
    [self.view addSubview:self.validateView];
    
    [self.validateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length == 3) {
        self.validateView.loginButton.enabled = YES;
        [self.validateView.loginButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    }
    return YES;
}
- (void)next{
    [self startValidateOperation];
}
#pragma mark -
#pragma mark 短信验证请求
- (void)startValidateOperation{
    MessageValidateOperation *operation = [MessageValidateOperation operationWithDelegate:self];
    NSString *token = [[NSUserDefaults standardUserDefaults]stringForKey:@"Token"];
    operation.params = @{
                         @"mobile":self.mobile,
                         @"code":self.validateView.loginTextField.text,
                         @"token":token
                         };
    if(token == nil){
        [PXAlertView showAlertWithTitle:@"Token获取失败,请在设置->通知中开启推送"];
    }else{
        [operation start];
        [SVProgressHUD showInView:self.view];
    }
}
#pragma mark -
#pragma mark 个人信息修改网络请求
- (void)receiveUpValiOperationWithParams:(NSDictionary *)params{
    UpValiOperation *operation = [UpValiOperation operationWithDelegate:self];
    operation.params = params;
    [operation start];
    [SVProgressHUD showInView:self.view];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    if ([operation isKindOfClass:[MessageValidateOperation class]]) {
        // 成功返回：uid   用户id    失败返回 0
        if (![[operation.responseData objectForKey:@"uid"] isEqualToString:@"0"]) {
            NSString *uid = [operation.responseData objectForKey:@"uid"];
            NSDictionary *dic = @{@"UID":uid};
            [[QBaseUserInfo sharedQBaseUserInfo]registUserInfo:dic];
            [self nickNameAlert];
        }else{
            [PXAlertView showAlertWithTitle:@"验证码输入错误"];
        }
    }else if ([operation isKindOfClass:[UpValiOperation class]]){
        [PXAlertView showAlertWithTitle:@"昵称添加成功" message:nil cancelTitle:@"确定" completion:^(BOOL cancelled, NSInteger buttonIndex) {
            [self goBackToRoot];
        }];
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    [PXAlertView showAlertWithTitle:@"网络错误"];
}
- (void)nickNameAlert{
    AlertContentView *view = [[AlertContentView alloc]initWithNickView:CGRectMake(0, 0, 200, 30)];
    [PXAlertView showAlertWithTitle:@"昵称" message:nil cancelTitle:@"以后再说" otherTitle:@"确定" contentView:view completion:^(BOOL cancelled, NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            [self checkNickName:view.firstTextField.text];
        }
    }];
}
- (void)checkNickName:(NSString *)string{
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    if (string.length > 15) {
        [PXAlertView showAlertWithTitle:@"昵称不能大于15字"];
    }else if ([string isEqualToString:@""]){
        [PXAlertView showAlertWithTitle:@"昵称不能为空"];
    }else{
        NSDictionary *params = @{
                                 @"key":@"nickName",
                                 @"value":string,
                                 @"uid":uid
                                 };
        [self receiveUpValiOperationWithParams:params];
    }
}
- (void)goBackToRoot{
    [self.validateView.loginTextField resignFirstResponder];
    if (self.isFromEdit) {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
@end
