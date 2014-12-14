//
//  MosaicViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MosaicViewController.h"
#import "MosaicData.h"
#import "MosaicDataView.h"
#import "MosaicDatasource.h"
#import "TempletModel.h"

@interface MosaicViewController ()
@property (nonatomic, strong)NSMutableArray *templateArr;
@property (nonatomic, strong)MosaicView *mosaicView;
@end

@implementation MosaicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //  UI
    [self updateUI];
    //  网络请求
    [self urlRequest];
}
-(void)updateUI{
    [SVProgressHUD showInView:self.view];
    self.view.backgroundColor = [UIColor blackColor];
    self.templateArr = [NSMutableArray array];
    [self naviTitle:@"模版"];
    //  MosaicView
    CGRect mosaicViewRect = CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64);
    self.mosaicView = [[MosaicView alloc]initWithFrame:mosaicViewRect];
    [self.view addSubview:self.mosaicView];
    
    [self.mosaicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}
- (void)urlRequest{
    MosaicRequest *request = [[MosaicRequest alloc]init];
    NSData *data = [request urlRequestWith:self.catalogID];
    if (data) {
        self.templateArr =[request jsonParserWith:data];
    }else{
        [PXAlertView showAlertWithTitle:@"网络错误" message:@"网络未连接" cancelTitle:@"确定" completion:^(BOOL cancelled, NSInteger buttonIndex) {
            [self goBackEdit];
        }];
    }
    
    self.mosaicView.datasource = [[MosaicDatasource alloc]initWithTemplates:self.templateArr];
    self.mosaicView.delegate = self;
}
-(void)mosaicViewDidTap:(MosaicDataView *)aModule{
    [self.delegate getSelectImageName:self and:aModule.module.bigImageUrl and:aModule.module.templetID];
}
- (void)goBackEdit{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
