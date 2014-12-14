//
//  PersonCountLabel.m
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "PersonCountLabel.h"

@implementation PersonCountLabel

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = frame.size.height / 2;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.text= @"0";
        self.textAlignment = NSTextAlignmentCenter;
        self.font = FONT(10);
        self.textColor = [UIColor blackColor];
    }
    return self;
}

@end
