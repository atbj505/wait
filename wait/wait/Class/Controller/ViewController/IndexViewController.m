//
//  IndexViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()
@property (nonatomic, strong)NSMutableArray *models;
@property (nonatomic, strong)NSArray *tempModels;
@property (nonatomic, strong)RYSegmentedControl *segmentedControl;
@property (nonatomic, strong)NickView *nickView;
@property (nonatomic, strong)RYBubbleButton *downMenuButton;
@property (nonatomic, strong)IndexBlurView *blurView;
@property (nonatomic, strong)IndexBlurView *smallBlurView;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  UI
    [self updateUI];
    //  创建弹出按钮
    [self createBubbleMenu];
    //  开启网络状态监听
    [[QBaseNetworkObserver sharedQBaseNetworkObserver] startNotifier];
    //  分类信息请求
    [self startCatelogOperation];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.segmentedControl.firstTableView reloadData];
    [self.segmentedControl.secondTableView reloadData];
    if ([[QBaseUserInfo sharedQBaseUserInfo]userInfo] != nil) {
        //  个人信息请求
        [self startPersonInfoOperation];
    }else{
        self.photoImage.image = [UIImage imageNamed:@"touxiang.fw.png"];
    }
}
- (void)updateUI{
    NSLog(@"%@",NSHomeDirectory());
    self.models = [NSMutableArray array];
    [self naviTitle:@"首页"];
    //  segment
    [self createSegment];
    //  头像默认图片
    [self photoImage:CGRectMake(20.f, 87.f, 57.f, 57.f)];
    //  昵称
    [self createNick];
}
- (void)createSegment{
    self.segmentedControl = [[RYSegmentedControl alloc] initWithSectionImages:@[[UIImage imageNamed:@"xinqing.png"],[UIImage imageNamed:@"tixing.png"]] sectionSelectedImages:@[[UIImage imageNamed:@"dianjixinqing.png"],[UIImage imageNamed:@"dianjitixing.png"]] titlesForSections:@[@" ", @" "] frame:CGRectMake(0, 164, SCREENWIDTH, SCREENHEIGHT - 164) delegate:self];
    [self.view addSubview:self.segmentedControl];
    [self.segmentedControl.segmented addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 0) {
        [self reloadTableView:@"1"];
    }else{
        [self reloadTableView:@"2"];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        CGPoint offset = scrollView.contentOffset;
        
        CGFloat alpha = offset.x/320;
        if (offset.x <= SCREENWIDTH) {
            self.segmentedControl.firstTableView.alpha = 1 - alpha;
            self.segmentedControl.secondTableView.alpha = alpha;
        }else{
            self.segmentedControl.firstTableView.alpha = alpha;
            self.segmentedControl.secondTableView.alpha = alpha;
        }
        if (offset.x >= SCREENWIDTH) {
            [self reloadTableView:@"2"];
        }
        if (offset.x < SCREENWIDTH) {
            [self reloadTableView:@"1"];
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        
        [self.segmentedControl.segmented setSelectedSegmentIndex:page animated:YES];
    }
}
- (void)reloadTableView:(NSString*)flag{
    [self.models removeAllObjects];
    for (CatelogModel * model in self.tempModels) {
        if ([model.flag isEqualToString:flag]) {
            //  获得节日类模板对象数组
            [self.models addObject:model];
        }
    }
    if ([flag isEqualToString:@"1"]) {
        [self.segmentedControl.firstTableView reloadData];
    }else{
        [self.segmentedControl.secondTableView reloadData];
    }
}
- (void)createNick{
    self.nickView = [[NickView alloc]init];
    [self.view insertSubview:self.nickView belowSubview:self.photoImage];
    [self.nickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.photoImage.mas_centerY);
        make.left.mas_equalTo(self.photoImage.mas_right).offset(5);
        make.width.mas_equalTo(@180);
        make.height.mas_equalTo(@20);
    }];
}
- (void)createBubbleMenu{
    self.downMenuButton = [[RYBubbleButton alloc] initWithFrame:CGRectMake(20.f,87.f,57.0f,57.0f)expansionDirection:DirectionRight delegate:self];
    for (UIButton *button in self.downMenuButton.buttons) {
        [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:self.downMenuButton];
}
- (void)tapButton:(UIButton *)sender{
    [self.blurView removeFromSuperview];
    [self.smallBlurView removeFromSuperview];
    if ([[QBaseUserInfo sharedQBaseUserInfo]userInfo] == nil) {
        [self pushToLogInView];
    }else
    {
        switch (sender.tag) {
            case 0:{
                UIImagePickerController* imagePicker = [[UIImagePickerController alloc]init];
                imagePicker.delegate = self;
                [imagePicker setSourceType:1];
                [MobClick event:@"camera"];
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
                break;
            case 1:{
                UIImagePickerController* imagePicker = [[UIImagePickerController alloc]init];
                imagePicker.delegate = self;
                [imagePicker setSourceType:0];
                [MobClick event:@"photoAlbum"];
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
                break;
            case 2:{
                PersonEditViewController *personEditVC = [[PersonEditViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:personEditVC animated:YES];
            }
                break;
            case 3:{
                PersonCenterViewController *personCenterVC = [[PersonCenterViewController alloc]initWithNibName:nil bundle:nil];
                [self.navigationController pushViewController:personCenterVC animated:YES];
            }
                break;
            default:
                break;
        }
    }
}
- (void)tapbubbleMenuWith:(DWBubbleMenuButton *)button andState:(BOOL)dismiss{
    if (!dismiss) {
        self.blurView = [[IndexBlurView alloc]initWithFrame:self.view.frame];
        self.smallBlurView = [[IndexBlurView alloc]initWithFrame:CGRectMake(0, -20, SCREENWIDTH, 64)];
        [self.navigationController.navigationBar addSubview:self.smallBlurView];
        [self.view insertSubview:self.blurView belowSubview:self.photoImage];
    }else{
        [self.blurView removeFromSuperview];
        [self.smallBlurView removeFromSuperview];
    }
}
- (void)startCatelogOperation{
    [SVProgressHUD showInView:self.view];
    CatelogOperation *operation = [CatelogOperation operationWithDelegate:self];
    if (operation.url) {
        [operation start];
    }else{
        [PXAlertView showAlertWithTitle:@"网络错误"];
    }
}
- (void)startPersonInfoOperation{
    PersonInfoOperation *operation = [PersonInfoOperation operationWithDelegate:self];
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    operation.params = @{
                         @"uid":uid
                         };
    [operation start];
}
- (void)startUserFaceOperationWith:(NSData *)imageData{
    UserFaceOperation *operation = [UserFaceOperation operationWithDelegate:self];
    NSDictionary *dic =[[QBaseUserInfo sharedQBaseUserInfo]userInfo];
    NSString *uid = [dic objectForKey:@"UID"];
    operation.params = @{
                         @"uid":uid
                         };
    [operation setBodyBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:@"upfile" fileName:@"upfile.jpg" mimeType:@"image/jpeg"];
    }];
    [operation start];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(QBaseNetOperation *)operation{
    [SVProgressHUD dismiss];
    if ([operation isKindOfClass:[CatelogOperation class]]){
        //  获取临时分类对象
        self.tempModels = operation.dataArray;
        [self reloadTableView:@"1"];
    }else if ([operation isKindOfClass:[PersonInfoOperation class]]){
        id result = [operation.responseData objectForKey:@"userInfo"];
        
        if ([result isKindOfClass:[NSNumber class]]) {
            return;
        }
        
        self.nickView.nickName.text = [result objectForKey:@"nickName"];
        [[NSUserDefaults standardUserDefaults]setValue:result forKey:@"PersonInfo"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        NSString *photoUrl = [result objectForKey:@"userPic"];
        
        NSData *imageData = [[NSUserDefaults standardUserDefaults]valueForKey:@"imageData"];
        
        if(imageData){
            self.photoImage.image = [UIImage imageWithData:imageData];
        }else{
            [self.photoImage withImageName:photoUrl andPlaceHolder:@"touxiang.fw.png"];
        }
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(QBaseNetOperation *)operation{
    NSLog(@"%@,%@",operation.error,operation.url);
    [PXAlertView showAlertWithTitle:@"网络错误"];
}
#pragma mark -
#pragma mark TabelViewDelegate,TableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}
static NSString *identifier = @"cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CatelogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CatelogTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.model = self.models[indexPath.row];
    cell.isClick = NO;
    UIView *bgColorView = [[UIView alloc] initWithFrame:cell.frame];
    bgColorView.backgroundColor = [UIColor hexColor:cell.model.Codeblock];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CatelogTableViewCell *cell = (CatelogTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CatelogModel *model = self.models[indexPath.row];
    cell.isClick = YES;
    //[self uMengCountWith:tableView.tag and:indexPath.row];
    EditViewController *editVC = [[EditViewController alloc]initWithNibName:nil bundle:nil];
    editVC.catelogModel = model;
    [self.navigationController pushViewController:editVC animated:YES];
}
- (void)pushToLogInView{
    LogInViewController *logVC = [[LogInViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:logVC animated:YES];
}
@end
