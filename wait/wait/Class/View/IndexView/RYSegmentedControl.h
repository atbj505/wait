//
//  RYSegmentedControl.h
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "HMSegmentedControl.h"
#import "RYTableView.h"
#import "CatelogTableViewCell.h"

@interface RYSegmentedControl : UIView

@property (nonatomic, strong)HMSegmentedControl *segmented;

@property (nonatomic, strong)UIScrollView *scrollView;

@property (nonatomic, strong)RYTableView *firstTableView;

@property (nonatomic, strong)RYTableView *secondTableView;

- (instancetype)initWithSectionImages:(NSArray *)sectionImages sectionSelectedImages:(NSArray *)sectionSelectedImages titlesForSections:(NSArray *)sectiontitles frame:(CGRect)frame delegate:(id)vc;

- (void)addScrollView:(CGRect)frame :(id)vc;

- (void)addTableView:(CGRect)frame :(id)vc;
@end
