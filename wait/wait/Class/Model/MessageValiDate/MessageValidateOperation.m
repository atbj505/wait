//
//  MessageValidateOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/11/13.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MessageValidateOperation.h"

@implementation MessageValidateOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"regMobile"];
    self.url = url;
    self.responseDataTag = @"";
}
@end
