//
//  MyMessagesModel.h
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "QBaseNetOperation.h"

@interface MyMessagesModel : QBaseModel
//  消息ID
@property (nonatomic, copy)NSString *messageeID;
//  消息内容
@property (nonatomic, copy)NSString *content;
//  模板Url
@property (nonatomic, copy)NSString *templetUrl;
//  模板背景音乐
@property (nonatomic, copy)NSString *templetAudioUrl;
//  发送地理信息
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *city;
@property (nonatomic, copy)NSString *province;
//  接受者UID
@property (nonatomic, copy)NSString *receiveId;
//  发送者UID
@property (nonatomic, copy)NSString *senderId;
//  接受时间
@property (nonatomic, copy)NSString *receiveTime;
//  发送时间
@property (nonatomic, copy)NSString *senderTime;
//  发送者头像
@property (nonatomic, copy)NSString *receiveUserPicUrl;
//  发送者姓名
@property (nonatomic, copy)NSString *receiveUserName;
//  发送者昵称
@property (nonatomic, copy)NSString *receiveUserNick;
//  信封Url
@property (nonatomic, copy)NSString *coverPicUrl;
//  字体颜色
@property (nonatomic, copy)NSString *color;
//  x
@property (nonatomic, copy)NSString *wordx;
//  y
@property (nonatomic, copy)NSString *wordy;
//  width
@property (nonatomic, copy)NSString *width;
//  height
@property (nonatomic, copy)NSString *height;

- (NSMutableArray *)JsonParserWithSend:(NSDictionary*)responseData;
@end
