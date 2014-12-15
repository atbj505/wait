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
    
}
@end
