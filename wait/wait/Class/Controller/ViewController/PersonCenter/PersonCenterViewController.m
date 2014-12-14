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
                         @"rid":uid
                         };
    [operation start];
}
- (void)sendMessageOperation{
    MyMessagesOperation *operation = [MyMessagesOperation operationWithDelegate:self];
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    operation.params = @{
                         @"sid":uid
                         };
    [operation start];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    
    if ([operation isKindOfClass:[MessagesOperation class]]) {
        
    }else if([operation isKindOfClass:[MyMessagesOperation class]]){
        
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
    return 10;
}
static NSString *identifier = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PersonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"11";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)tableViewBegainRefresh:(QBaseTableView *)tableView{
}
@end
