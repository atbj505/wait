//
//  RYViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"

@interface RYViewController ()
@property (nonatomic, strong)UIImageView *backImageView;
@end

@implementation RYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  背景图
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.backImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self backImage:nil];
    [self.view addSubview:self.backImageView];
}
- (void)backImage:(NSString *)string{
    if (string != nil) {
        self.backImageView.image = [UIImage imageNamed:string];
    }else{
        self.backImageView.image = [UIImage imageNamed:BACKIMAGE];
    }
}
- (void)photoImage:(CGRect)frame{
    //  头像默认图片
    self.photoImage = [[UIImageView alloc]initWithFrame:frame];
    self.photoImage.layer.cornerRadius = self.photoImage.frame.size.height/2;
    self.photoImage.layer.masksToBounds = YES;
    [self.view addSubview:self.photoImage];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}
@end
