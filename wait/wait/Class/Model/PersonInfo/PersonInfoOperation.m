//
//  PersonInfoOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/27.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "PersonInfoOperation.h"

@implementation PersonInfoOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"validate3"];
    self.url = url;
    self.responseDataTag = @"userInfo";
}
@end
