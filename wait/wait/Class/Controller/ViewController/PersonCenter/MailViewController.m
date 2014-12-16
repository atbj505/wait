//
//  MailViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MailViewController.h"

@interface MailViewController ()
@property (nonatomic ,strong)ANBackImageView* backImageView;
@property (nonatomic ,strong)ScratchView* scratchView;
@property (nonatomic, assign)NSUInteger brushSize;
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation MailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
}
- (void)updateUI{
    [self naviTitle:@"邮件"];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.brushSize = 100;
    //  初始化背景图片
    [self createBackImage];
    //  初始化遮挡图片
    self.imageView = [self createCratchView];
    //  添加发件人信息
    [self createSenderInfo];
    //  设置遮挡图层
    [self.scratchView setHideView:self.imageView];
    [self.view addSubview:self.scratchView];
    //  更新未读信件网络请求
    if (self.receiveModel) {
        if (self.receiveModel.status == 0) {
            [self upstatusOperation];
        }
    }
}
- (void)createBackImage{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(goBackToPersonCenter)];
    if (self.sendModel) {
        self.backImageView = [[ANBackImageView alloc] initBackImageViewWithSendMail:self.sendModel :self.view.frame :self.sendModel.templetUrl];
        [self.backImageView addGestureRecognizer:swipe];
        [self.view addSubview:self.backImageView];
    }else if (self.receiveModel){
        self.backImageView = [[ANBackImageView alloc] initBackImageViewWithReceiveMail:self.receiveModel :self.view.frame :self.receiveModel.templetUrl];
        [self.backImageView addGestureRecognizer:swipe];
        [self.view addSubview:self.backImageView];
    }
}
- (UIImageView *)createCratchView{
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.scratchView = [[ScratchView alloc]initScratchViewWithSizeBrush:self.brushSize];
    self.scratchView.frame = self.view.frame;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    if (self.sendModel) {
        request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:self.sendModel.coverPicUrl]];
    }else if(self.receiveModel){
        request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:self.receiveModel.coverPicUrl]];
    }
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    imageView.image = [UIImage imageWithData:data];
    return imageView;
}
- (void)goBackToPersonCenter{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)createSenderInfo{
    SendInfoView *infoView = nil;
    if (self.receiveModel) {
        infoView = [[SendInfoView alloc]initWithFrame:CGRectMake(0, 0, 280, 120) andreceiveModel:self.receiveModel];
    }else if (self.sendModel){
        infoView = [[SendInfoView alloc]initWithFrame:CGRectMake(0, 0, 280, 120) andsendModel:self.sendModel];
    }
    [self.view addSubview:infoView];
}
#pragma mark -
#pragma mark 网络请求
- (void)upstatusOperation{
    UpstatusOperation *operation = [UpstatusOperation operationWithDelegate:self];
    operation.params = @{
                         @"mid":self.receiveModel.messageeID
                         };
    [operation start];
}
#pragma mark -
#pragma mark 网络请求成功回调
- (void)netOperationDidFinish:(QBaseNetOperation *)operation{
    if ([operation isKindOfClass:[UpstatusOperation class]]) {
        if ([[operation.responseData objectForKey:@"success"]isEqualToString:@"1"]) {
            if (self.count > 0) {
                [self.delegate getCount:--self.count];
            }
        }
    }
}
#pragma mark -
#pragma mark 网络请求失败回调
- (void)netOperationDidFailed:(QBaseNetOperation *)operation{
    NSLog(@"%@,%@,%@",operation.error,operation.responseData,operation.url);
}
@end
