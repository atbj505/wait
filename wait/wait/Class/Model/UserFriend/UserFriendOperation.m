//
//  UserFriendOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "UserFriendOperation.h"

@implementation UserFriendOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"userfriend"];
    self.url = url;
    self.responseDataTag = @"UserFriendsList";
}
@end
