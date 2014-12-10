//
//  MainConfigModel.h
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "JSONModel.h"

@interface MainConfigModel : QBaseModel
//  分类信息接口URL
@property (nonatomic, copy)NSString *catalogs;
//  消息发送接口URL
@property (nonatomic, copy)NSString *messages;
//  我的信息接口URL
@property (nonatomic, copy)NSString *myMessages;
//  模板列表接口URL
@property (nonatomic, copy)NSString *templet;
//  用户关系接口URL
@property (nonatomic, copy)NSString *userfriend;
//  注册/登录接口URL
@property (nonatomic, copy)NSString *validate1;
//  注册/登录接口URL
@property (nonatomic, copy)NSString *validate2;


@end
