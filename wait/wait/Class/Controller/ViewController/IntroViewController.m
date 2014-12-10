//
//  IntroViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "IntroViewController.h"
#import "RYNavigationController.h"
#import "IndexViewController.h"
#import "RYScrollView.h"
#import "RYPageControl.h"

@interface IntroViewController (){
    NSArray *_imageNames;
    RYPageControl *_pageControl;
}
@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageNames = @[@"yindao1.png", @"yindao2.png", @"yindao3.png",@"yindao4.png"];
    //  添加scrollview
    [self addScrollView];
    //  添加pagecontrol
    [self addPageControl];
    
}
- (void)addScrollView{
    RYScrollView *scrollView = [[RYScrollView alloc]initWithItems:_imageNames];
    
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    [scrollView.nextButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
- (void)addPageControl{
    _pageControl = [[RYPageControl alloc]initWithCount:_imageNames.count];
    
    [self.view addSubview:_pageControl];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    NSUInteger index = round(offset.x / scrollView.frame.size.width);
    _pageControl.currentPage = index;
}
- (void)next{
    IndexViewController *index = [[IndexViewController alloc]initWithNibName:nil bundle:nil];
    RYNavigationController *navi = [[RYNavigationController alloc]initWithRootViewController:index];
    [self presentViewController:navi animated:YES completion:nil];
}
@end
