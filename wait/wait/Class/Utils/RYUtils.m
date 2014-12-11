//
//  RYUtils.m
//  wait
//
//  Created by 杨启晖 on 14/12/11.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYUtils.h"

@implementation RYUtils
+ (RYUtils *)sharedRYUtils
{
    static RYUtils *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (UIImage *)setPhoto{
    NSData *imageData = [[NSUserDefaults standardUserDefaults]valueForKey:@"imageData"];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
@end
