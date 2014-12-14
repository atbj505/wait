//
//  EditButtonsView.m
//  wait
//
//  Created by 杨启晖 on 14/12/13.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "EditButtonsView.h"
@implementation EditButtonsView
-(instancetype)initWithFrame:(CGRect)frame names:(NSArray *)names{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addButtonsWith:names];
    }
    return self;
}
- (void)addButtonsWith:(NSArray *)names{
    self.templet = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 28, 47)];
    [self.templet setImage:[UIImage imageNamed:names[0]] forState:UIControlStateNormal];
    [self addSubview:self.templet];
    
    self.localTemplet = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 47)];
    [self.localTemplet setImage:[UIImage imageNamed:names[1]] forState:UIControlStateNormal];
    [self addSubview:self.localTemplet];
    
    self.font = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 57, 47)];
    [self.font setImage:[UIImage imageNamed:names[2]] forState:UIControlStateNormal];
    [self addSubview:self.font];
    
    [self.templet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(@28);
        make.height.mas_equalTo(@47);
    }];
    
    [self.localTemplet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(@30);
        make.height.mas_equalTo(@47);
    }];
    
    [self.font mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(@57);
        make.height.mas_equalTo(@47);
    }];
}
@end
