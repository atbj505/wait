//
//  PersonEditViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "PersonEditViewController.h"

@interface PersonEditViewController()
@property (nonatomic, strong)UITableView *editTableView;
@property (nonatomic, strong)PersonInfoModel *model;
@end

@implementation PersonEditViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self updateUI];
}
- (void)updateUI{
    [self addNaviTitle];
    [self setPersonImage];
    [self addEditTableView];
}
- (void)addNaviTitle{
    [self naviTitle:@"个人信息"];
    UIBarButtonItem *reightButton = [[UIBarButtonItem alloc]initWithTitle:@"邀请" style:UIBarButtonItemStylePlain target:self action:@selector(tapRightBar)];
    self.navigationItem.rightBarButtonItem = reightButton;
}
- (void)tapRightBar{
    [self sendSMS:@"去appstore下个等候吧！我在里面给你寄送了惊喜~"recipientList:@[]];
}
- (void)setPersonImage{
    [self photoImage:CGRectMake(120, 89, 80, 80)];
    [self.photoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(89);
        make.width.mas_equalTo(@80);
        make.height.mas_equalTo(@80);
    }];
}
- (void)addEditTableView{
    self.editTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 240) style:UITableViewStylePlain];
    self.editTableView.delegate = self;
    self.editTableView.dataSource = self;
    self.editTableView.backgroundColor = [UIColor clearColor];
    self.editTableView.separatorColor = [UIColor lightGrayColor];
    [self.view addSubview:self.editTableView];
    [self.editTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.photoImage.mas_bottom).offset(25);
        make.width.mas_equalTo(SCREENWIDTH);
        make.height.mas_equalTo(@240);
    }];
}
- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    
    if([MFMessageComposeViewController canSendText])
        
    {
        
        controller.body = bodyOfMessage;
        
        controller.recipients = recipients;
        
        controller.messageComposeDelegate = self;
        
        [self presentViewController:controller animated:YES completion:nil];
        
    }
    
}
#pragma mark -
#pragma mark TabelViewDelegate,TableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
static NSString *identifier = @"cellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonEditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PersonEditTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell configCell:indexPath :self.model];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 3) {
        [self showAlertViewWith:indexPath];
    }
}
- (void)showAlertViewWith:(NSIndexPath*)indexPath{
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    switch (indexPath.row) {
        case 0:
        {
            AlertContentView *view = [[AlertContentView alloc]initWithNickView:CGRectMake(0, 0, 200, 30)];
            [PXAlertView showAlertWithTitle:@"昵称" message:nil cancelTitle:@"取消" otherTitle:@"确定" contentView:view completion:^(BOOL cancelled, NSInteger buttonIndex) {
                if (buttonIndex == 1) {
                    [self checkNickName:view.firstTextField.text];
                }
            }];
        }
            
            break;
        case 2:
        {
            [PXAlertView showAlertWithTitle:@"修改性别" message:nil cancelTitle:@"取消" otherTitles:@[@"男",@"女"] completion:^(BOOL cancelled, NSInteger buttonIndex) {
                if (buttonIndex == 1) {
                    self.model.sex = 0;
                    NSDictionary *params = @{
                                             @"key":@"sex",
                                             @"value":@(0),
                                             @"uid":uid
                                             };
                    [self receiveUpValiOperationWithParams:params];
                } else if (buttonIndex == 2){
                    self.model.sex = 1;
                    NSDictionary *params = @{
                                             @"key":@"sex",
                                             @"value":@(1),
                                             @"uid":uid
                                             };
                    [self receiveUpValiOperationWithParams:params];
                }
            }];
        }
            break;
        case 3:
        {
            AlertContentView *view = [[AlertContentView alloc]initWithNameView:CGRectMake(0, 0, 200, 30)];
            [PXAlertView showAlertWithTitle:@"姓名" message:nil cancelTitle:@"取消" otherTitle:@"确定" contentView:view completion:^(BOOL cancelled, NSInteger buttonIndex) {
                
            }];
        }
            
            break;
        default:
            break;
    }
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
- (void)checkName:(NSString *)string{
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    NSDictionary *params = @{
                             @"key":@"userName",
                             @"value":string,
                             @"uid":uid
                             };
    [self receiveUpValiOperationWithParams:params];
    
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
    if ([operation isKindOfClass:[UpValiOperation class]]) {
        NSString *result = [operation.responseData objectForKey:@"success"];
        if ([result isEqualToString:@"0"]){
            if ([[operation.params objectForKey:@"key"] isEqualToString:@"sex"]) {
                self.model.sex = [result integerValue];
                [PXAlertView showAlertWithTitle:@"修改成功"];
                [self.editTableView reloadData];
            }else{
                [PXAlertView showAlertWithTitle:@"修改失败"];
            }
        }else if ([[operation.params objectForKey:@"key"]  isEqualToString:@"nickName"]){
            self.model.nickName = result;
            [PXAlertView showAlertWithTitle:@"修改成功"];
            [self.editTableView reloadData];
        }else if ([[operation.params objectForKey:@"key"] isEqualToString:@"userName"]){
            self.model.userName = result;
            [PXAlertView showAlertWithTitle:@"修改成功"];
            [self.editTableView reloadData];
        }else if ([[operation.params objectForKey:@"key"] isEqualToString:@"sex"]){
            self.model.sex = [result integerValue];
            [PXAlertView showAlertWithTitle:@"修改成功"];
            [self.editTableView reloadData];
        }
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(QBaseNetOperation *)operation{
    NSLog(@"%@,%@,%@",operation.error,operation.responseData,operation.url);
    [SVProgressHUD dismiss];
    [PXAlertView showAlertWithTitle:@"网络错误 修改失败"];
}
@end
