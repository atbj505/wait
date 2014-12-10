//
//  RYPageControl.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYPageControl.h"

@implementation RYPageControl
-(instancetype)initWithCount:(NSUInteger)count{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, SCREENHEIGHT - 44, SCREENWIDTH, 20);
        self.numberOfPages = count;
        self.currentPage = 0;
        self.userInteractionEnabled = NO;
    }
    return self;
}

@end
