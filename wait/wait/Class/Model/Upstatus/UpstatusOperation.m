//
//  UpstatusOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/11/17.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "UpstatusOperation.h"

@implementation UpstatusOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"upstatus"];
    self.url = url;
    self.responseDataTag = @"success";
}
@end
