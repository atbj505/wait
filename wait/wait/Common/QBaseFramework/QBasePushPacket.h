//
//  QBasePushPacket.h
//  QBaseFrameworkDemo
//
//  Created by andy on 11/8/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBasePushPacket : NSObject
{
    NSMutableDictionary *_params;
}

/**
 *  推送目标的设备DeviceToken
 */
@property (nonatomic, copy) NSString *token;

/**
 *  推送内容
 */
@property (nonatomic, copy) NSString *alert;

/**
 *  推送圆角个数
 */
@property (nonatomic, copy) NSString *badge;

/**
 *  推送自定义内容
 */
@property (nonatomic, strong) NSDictionary *payload;

/**
 *  定时发送时间
 */
@property (nonatomic, copy) NSString *time;

/**
 *  未知
 */
@property (nonatomic, copy) NSString *desc;

/**
 *  未知参数
 */
@property (nonatomic, copy) NSString *callback_url;

/**
 *  数据内容
 */
@property (nonatomic, copy) NSString *data;

- (NSDictionary *)dictionarySendNow;
- (NSDictionary *)dictionarySendFuture;

@end
