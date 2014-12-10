//
//  TempletOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "TempletOperation.h"

@implementation TempletOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"templet"];
    self.url = url;
    self.responseDataTag = @"templetsList";
}
@end
