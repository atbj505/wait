//
//  CatelogOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "CatelogOperation.h"

@implementation CatelogOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"catalogs"];
    self.url = url;
    self.responseDataTag = @"catalogList";
}
@end
