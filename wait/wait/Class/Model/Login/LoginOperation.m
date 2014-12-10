//
//  LoginOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/28.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "LoginOperation.h"

@implementation LoginOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"setmobilecode"];
    self.url = url;
    self.responseDataTag = @"";
}
@end
