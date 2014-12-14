//
//  PersonCenterSegmentedControl.m
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "PersonCenterSegmentedControl.h"

@implementation PersonCenterSegmentedControl

-(void)addTableView:(CGRect)frame :(id)vc{
    self.firstDropTableView = [[QBaseWaterDropRefreshTableView alloc]initWithFrame:frame];
    self.firstDropTableView.tag = 1;
    self.firstDropTableView.delegate = vc;
    self.firstDropTableView.dataSource = vc;
    self.firstDropTableView.qbase_delegate = vc;
    self.firstDropTableView.backgroundColor = [UIColor clearColor];
    [self.firstDropTableView registerClass:[CatelogTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.scrollView addSubview:self.firstDropTableView];
    
    self.secondDropTableView = [[QBaseWaterDropRefreshTableView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, self.scrollView.frame.size.height)];
    self.secondDropTableView.tag = 2;
    self.secondDropTableView.delegate = vc;
    self.secondDropTableView.dataSource = vc;
    self.secondDropTableView.qbase_delegate = vc;
    self.secondDropTableView.backgroundColor = [UIColor clearColor];
    [self.secondDropTableView registerClass:[CatelogTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.scrollView addSubview:self.secondDropTableView];
}

@end
