//
//  UserFriendModel.h
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "JSONModel.h"

@interface UserFriendModel : QBaseModel
//  用户UID
@property (nonatomic, copy)NSString *uid;
//  好友UID
@property (nonatomic, copy)NSString *friendId;
//  好友名称
@property (nonatomic, copy)NSString *friendName;
//  好友手机号
@property (nonatomic, copy)NSString *friendMobile;
//  好友头像
@property (nonatomic, copy)NSString *friendlogon;
//  好友token
@property (nonatomic, copy)NSString *tokens;
@end
