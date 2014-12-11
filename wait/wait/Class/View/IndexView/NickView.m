//
//  NickView.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "NickView.h"

@implementation NickView

-(instancetype)init{
    self = [super init];
    if (self) {
        UIImageView *nickImage = [[UIImageView alloc]init];
        nickImage.image = [UIImage imageNamed:@"star.png"];
        [self addSubview:nickImage];
        
        self.nickName = [[UILabel alloc]init];
        self.nickName.textAlignment = NSTextAlignmentLeft;
        self.nickName.textColor = [UIColor hexColor:@"666666"];
        self.nickName.font = FONT(15);
        [self addSubview:self.nickName];
        
        [nickImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(5);
            make.left.mas_equalTo(self.mas_left).offset(5);
            make.width.mas_equalTo(@15);
            make.height.mas_equalTo(@15);
        }];
        
        [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(30);
            make.width.mas_equalTo(@150);
            make.height.mas_equalTo(@20);
        }];
    }
    return self;
}

@end
