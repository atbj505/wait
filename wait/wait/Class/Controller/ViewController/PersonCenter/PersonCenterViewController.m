//
//  PersonCenterViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "PersonCenterViewController.h"

@interface PersonCenterViewController ()
@property (nonatomic, strong)PersonCenterSegmentedControl *segmentedControl;
@property (nonatomic, strong)PersonCountLabel *countLabel;
@property (nonatomic, strong)NSArray *sendMails;
@property (nonatomic, strong)NSArray *receiveMails;
@property (nonatomic, strong)NSArray *mails;
@end


@implementation PersonCenterViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self naviTitle:@"收件箱"];
    [self updateUI];
    [self receiveMessageOperation];
    [self sendMessageOperation];
}
- (void)updateUI{
    [self addSegment];
    [self addCountLabel];
}
- (void)addSegment{
    self.segmentedControl = [[PersonCenterSegmentedControl alloc]initWithSectionImages:@[[UIImage imageNamed:@"shoujianhuo.png"],[UIImage imageNamed:@"fajianqian.png"]] sectionSelectedImages:@[[UIImage imageNamed:@"shoujianqian.png"],[UIImage imageNamed:@"fajianhuo.png"]] titlesForSections:@[@" ", @" "] frame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64) delegate:self];
    [self.view addSubview:self.segmentedControl];
}
- (void)addCountLabel{
    self.countLabel = [[PersonCountLabel alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    [self.view addSubview:self.countLabel];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.segmentedControl.segmented.mas_left).offset(88);
        make.bottom.mas_equalTo(self.segmentedControl.segmented.mas_bottom).offset(-25);
        make.width.mas_equalTo(@15);
        make.height.mas_equalTo(@15);
    }];
}
#pragma mark -
#pragma mark 网络请求
- (void)receiveMessageOperation{
    [SVProgressHUD showInView:self.view];
    MessagesOperation *operation = [MessagesOperation operationWithDelegate:self];
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    operation.params = @{
                         @"rid":@"40"
                         };
    [operation start];
}
- (void)sendMessageOperation{
    MyMessagesOperation *operation = [MyMessagesOperation operationWithDelegate:self];
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    operation.params = @{
                         @"sid":@"40"
                         };
    [operation start];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    if ([operation isKindOfClass:[MessagesOperation class]]) {
        MessagesModel *model = [[MessagesModel alloc]init];
        self.receiveMails = [model JsonParserWithReceive:operation.responseData];
        self.mails = self.receiveMails;
        [self.segmentedControl.firstDropTableView reloadData];
    }else if([operation isKindOfClass:[MyMessagesOperation class]]){
        MyMessagesModel *model = [[MyMessagesModel alloc]init];
        self.sendMails = [model JsonParserWithSend:operation.responseData];
        self.mails = self.receiveMails;
        [self.segmentedControl.secondDropTableView reloadData];
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    [PXAlertView showAlertWithTitle:@"网络错误"];
    NSLog(@"%@,%@,%@",operation.error,operation.responseData,operation.url);
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        
        [self.segmentedControl.segmented setSelectedSegmentIndex:page animated:YES];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        CGPoint offset = scrollView.contentOffset;
        
        CGFloat alpha = offset.x/SCREENWIDTH;
        if (offset.x <= SCREENWIDTH) {
            self.segmentedControl.firstDropTableView.alpha = 1 - alpha;
            self.segmentedControl.secondDropTableView.alpha = alpha;
        }else{
            self.segmentedControl.firstDropTableView.alpha = alpha;
            self.segmentedControl.secondDropTableView.alpha = 1 - alpha;
        }

        if (offset.x >= SCREENWIDTH) {
            [self naviTitle:@"发件箱"];
        }
        if (offset.x < SCREENWIDTH) {
            [self naviTitle:@"收件箱"];
        }
    }
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 0) {
        [self.segmentedControl.firstDropTableView reloadData];
        self.title = @"收件箱";
        self.navigationItem.titleView = [TitleView TitleViewWithTitle:@"收件箱"];
    }else{
        [self.segmentedControl.secondDropTableView reloadData];
        self.title = @"发件箱";
        self.navigationItem.titleView = [TitleView TitleViewWithTitle:@"发件箱"];
    }
}
#pragma mark -
#pragma mark TabelViewDelegate,TableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 92;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mails.count;
}
static NSString *identifier = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PersonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (tableView.tag == 1) {
        cell.isSend = YES;
        cell.receiveModel = self.receiveMails[indexPath.row];
    }else{
        cell.isSend = NO;
        cell.sendModel = self.sendMails[indexPath.row];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MailViewController *mailVC = [[MailViewController alloc]initWithNibName:nil bundle:nil];
    if (tableView.tag == 1) {
        MessagesModel *model = self.receiveMails[indexPath.row];
        mailVC.receiveModel = model;
    }else{
        MyMessagesModel *model = self.sendMails[indexPath.row];
        mailVC.sendModel = model;
        //_index = indexPath.row;
    }
}
- (void)tableViewBegainRefresh:(QBaseTableView *)tableView{
    //  接受信息请求
    [self receiveMessageOperation];
    //  发送信息请求
    [self sendMessageOperation];
}
@end
