//
//  RYSegmentedControl.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYSegmentedControl.h"

@interface RYSegmentedControl()

@end

@implementation RYSegmentedControl
- (instancetype)initWithSectionImages:(NSArray *)sectionImages sectionSelectedImages:(NSArray *)sectionSelectedImages titlesForSections:(NSArray *)sectiontitles{
    self = [super initWithSectionImages:sectionImages sectionSelectedImages:sectionSelectedImages titlesForSections:sectiontitles];
    if (self) {
        self.selectionIndicatorColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
        self.selectedSegmentIndex = 0;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        self.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        __weak typeof(self) weakSelf = self;
        [self setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(320 * index, 0, 320, 200) animated:YES];
        }];
        [self addScrollView];
        [self addTableView];
    }
    return self;
}
- (void)addScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 164, SCREENWIDTH, SCREENHEIGHT - 164 - 45)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.tag = 1;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH * 2, SCREENHEIGHT - 164 - 45);
    self.scrollView.bounces = NO;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, 320, SCREENHEIGHT - 164 - 45) animated:NO];
    [self addSubview:self.scrollView];
}
- (void)addTableView{
    self.firstTableView = [[RYTableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.scrollView.frame.size.height)];
    self.firstTableView.tag = 1;
    [self.scrollView addSubview:self.firstTableView];
    
    self.secondTableView = [[RYTableView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.scrollView.frame.size.height)];
    self.secondTableView.tag = 2;
    [self.scrollView addSubview:self.secondTableView];
}
@end
