//
//  TitleView.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView

+(TitleView*)TitleViewWithTitle:(NSString *)title{
    TitleView *titleView = [[TitleView alloc]initWithTile:title];
    return titleView;
}
-(instancetype)initWithTile:(NSString *)title{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, 0, 100, 30);
        UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        customLab.backgroundColor = [UIColor clearColor];
        [customLab setTextColor:[UIColor whiteColor]];
        [customLab setText:title];
        customLab.textAlignment = NSTextAlignmentCenter;
        customLab.font = FONT(20);
        [self addSubview:customLab];
    }
    return self;
}

@end
