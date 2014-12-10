//
//  TokenOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/11/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "TokenOperation.h"

@implementation TokenOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"token"];
    self.url = url;
    self.responseDataTag = @"";
}
@end
