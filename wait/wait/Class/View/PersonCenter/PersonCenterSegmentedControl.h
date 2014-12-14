//
//  PersonCenterSegmentedControl.h
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYSegmentedControl.h"
#import "QBaseWaterDropRefreshTableView.h"

@interface PersonCenterSegmentedControl : RYSegmentedControl

@property (nonatomic, strong)QBaseWaterDropRefreshTableView *firstDropTableView;

@property (nonatomic, strong)QBaseWaterDropRefreshTableView *secondDropTableView;

@end
