//
//  SendMessageOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/31.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "SendMessageOperation.h"

@implementation SendMessageOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"sendmessage"];
    self.url = url;
    self.method = @"POST";
    self.responseDataTag = @"";
}
@end
