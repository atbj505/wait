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
@property (nonatomic, strong)RYTableView *motionTable;
@property (nonatomic, strong)RYTableView *scheduleTable;
@property (nonatomic, strong)RYSegmentedControl *segmentedControl;
@property (nonatomic, strong)UILabel *nickName;
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
    [self.motionTable reloadData];
    [self.scheduleTable reloadData];
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
    self.title = @"首页";
    self.navigationItem.titleView = [TitleView TitleViewWithTitle:@"首页"];
    //  segment
    [self createSegment];
    //  头像默认图片
    [self photoImage:CGRectMake(20.f, 87.f, 57.f, 57.f)];
    //  昵称
    [self createNick];
}
- (void)createSegment{
    self.segmentedControl = [[RYSegmentedControl alloc] initWithSectionImages:@[[UIImage imageNamed:@"xinqing.png"],[UIImage imageNamed:@"tixing.png"]] sectionSelectedImages:@[[UIImage imageNamed:@"dianjixinqing.png"],[UIImage imageNamed:@"dianjitixing.png"]] titlesForSections:@[@" ", @" "]];
    self.segmentedControl.frame =CGRectMake(0, SCREENHEIGHT - 65, SCREENWIDTH, 65);
    self.segmentedControl.scrollView.delegate =self;
    self.segmentedControl.firstTableView.delegate = self;
    self.segmentedControl.firstTableView.dataSource = self;
    self.segmentedControl.secondTableView.delegate = self;
    self.segmentedControl.secondTableView.dataSource = self;
    [self.segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 0) {
        [self.models removeAllObjects];
        for (CatelogModel * model in self.tempModels) {
            if ([model.flag isEqualToString:@"1"]) {
                //  获得情感类模板对象数组
                [self.models addObject:model];
            }
        }
        [self.motionTable reloadData];
    }else{
        [self.models removeAllObjects];
        for (CatelogModel * model in self.tempModels) {
            if ([model.flag isEqualToString:@"2"]) {
                //  获得节日类模板对象数组
                [self.models addObject:model];
            }
        }
        [self.scheduleTable reloadData];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        CGPoint offset = scrollView.contentOffset;
        
        CGFloat alpha = offset.x/320;
        if (offset.x <= SCREENWIDTH) {
            self.motionTable.alpha = 1 - alpha;
            self.scheduleTable.alpha = alpha;
        }else{
            self.motionTable.alpha = alpha;
            self.scheduleTable.alpha = alpha;
        }
        if (offset.x >= SCREENWIDTH) {
            [self reloadTableView:@"2"];
        }
        if (offset.x < SCREENWIDTH) {
            [self reloadTableView:@"1"];
        }
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
        [self.motionTable reloadData];
    }else{
        [self.scheduleTable reloadData];
    }
}
- (void)createNick{
    UIImageView *nickImage = [[UIImageView alloc]initWithFrame:CGRectMake(88, self.photoImage.center.y - 7, 16, 15)];
    nickImage.image = [UIImage imageNamed:@"star.png"];
    [self.view insertSubview:nickImage belowSubview:self.photoImage];
    self.nickName = [[UILabel alloc]initWithFrame:CGRectMake(110, self.photoImage.center.y - 8, 150, 20)];
    self.nickName.textAlignment = NSTextAlignmentLeft;
    self.nickName.textColor = [UIColor hexColor:@"666666"];
    self.nickName.font = FONT(15);
    [self.view insertSubview:self.nickName belowSubview:self.photoImage];
}
- (void)createBubbleMenu{
    
}
- (void)startCatelogOperation{
    
}
- (void)startPersonInfoOperation{
    
}
@end
