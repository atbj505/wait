//
//  UMengHandler.m
//  Wait
//
//  Created by andy on 11/29/14.
//  Copyright (c) 2014 telcolor. All rights reserved.
//

#import "UMengHandler.h"
#define UMENG_KEY @"54793e4cfd98c536b700043c"
#define UMENG_HANDLER_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@implementation UMengHandler
+ (void)launch
{
    // 开启统计
    [self feedback];
    
    // 开启事件捕获
    [self mobClick];
}

/**
 *  开启统计
 */
+ (void)feedback
{
    [UMFeedback setAppkey:UMENG_KEY];
}

/**
 *  开启时间捕获
 */
+ (void)mobClick
{
    [MobClick startWithAppkey:UMENG_KEY
                 reportPolicy:REALTIME
                    channelId:nil];
    [MobClick setAppVersion:UMENG_HANDLER_APP_VERSION];
}

@end
