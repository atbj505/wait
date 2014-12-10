//
//  UpValiOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/30.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "UpValiOperation.h"

@implementation UpValiOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"upvalidata"];
    self.url = url;
    self.responseDataTag = @"success";
}
@end
