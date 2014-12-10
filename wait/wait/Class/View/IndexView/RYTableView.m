//
//  RYTableView.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYTableView.h"

@implementation RYTableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.rowHeight = 72;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
