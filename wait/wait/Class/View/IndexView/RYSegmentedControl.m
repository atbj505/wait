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
- (instancetype)initWithSectionImages:(NSArray *)sectionImages sectionSelectedImages:(NSArray *)sectionSelectedImages titlesForSections:(NSArray *)sectiontitles delegate:(id)vc{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 164, SCREENWIDTH, SCREENHEIGHT - 164);
        self.segmented = [[HMSegmentedControl alloc]initWithSectionImages:sectionImages sectionSelectedImages:sectionSelectedImages titlesForSections:sectiontitles];
        self.segmented.selectionIndicatorColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
        self.segmented.selectedSegmentIndex = 0;
        self.segmented.backgroundColor = [UIColor clearColor];
        self.segmented.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        self.segmented.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        
        [self addSubview:self.segmented];
        
        [self.segmented mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.mas_bottom);
            make.width.mas_equalTo(self.mas_width);
            make.height.mas_equalTo(@65);
        }];
        
        __weak typeof(self) weakSelf = self;
        [self.segmented setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(320 * index, 0, 320, 200) animated:YES];
        }];
        [self addScrollView:vc];
        [self addTableView:vc];
    }
    return self;
}
- (void)addScrollView:(id)vc{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.frame.size.height - 45)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.tag = 1;
    self.scrollView.delegate = vc;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH * 2, self.scrollView.bounds.size.height);
    self.scrollView.bounces = NO;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCREENWIDTH, self.scrollView.bounds.size.height) animated:NO];
    [self addSubview:self.scrollView];
}
- (void)addTableView:(id)vc{
    self.firstTableView = [[RYTableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, self.scrollView.frame.size.height)];
    self.firstTableView.tag = 1;
    self.firstTableView.delegate = vc;
    self.firstTableView.dataSource = vc;
    self.firstTableView.backgroundColor = [UIColor clearColor];
    [self.firstTableView registerClass:[CatelogTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.scrollView addSubview:self.firstTableView];
    
    self.secondTableView = [[RYTableView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.scrollView.frame.size.height)];
    self.secondTableView.tag = 2;
    self.secondTableView.delegate = vc;
    self.secondTableView.dataSource = vc;
    self.secondTableView.backgroundColor = [UIColor clearColor];
    [self.secondTableView registerClass:[CatelogTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.scrollView addSubview:self.secondTableView];
}
@end
