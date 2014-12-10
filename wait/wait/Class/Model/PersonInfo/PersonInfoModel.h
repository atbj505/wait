//
//  PersonInfoModel.h
//  Wait
//
//  Created by 杨启晖 on 14/10/28.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "JSONModel.h"

@interface PersonInfoModel : QBaseModel
//  创建时间
@property (nonatomic ,strong)NSString *createTime;
//  E-mail
@property (nonatomic, strong)NSString *email;
//  flag
@property (nonatomic, assign)NSUInteger flag;
//  uid
@property (nonatomic, assign)NSUInteger uid;
//  手机号
@property (nonatomic, strong)NSString *mobile;
//  昵称
@property (nonatomic, strong)NSString *nickName;
//  openid
@property (nonatomic, strong)NSString *openid;
//  密码
@property (nonatomic, strong)NSString *password;
//  QQ号
@property (nonatomic, strong)NSString *qq;
//  性别
@property (nonatomic, assign)NSUInteger sex;
//  状态
@property (nonatomic, assign)NSUInteger status;
//  用户名
@property (nonatomic, strong)NSString *userName;
//  用户头像
@property (nonatomic, strong)NSString *userPic;
@end
