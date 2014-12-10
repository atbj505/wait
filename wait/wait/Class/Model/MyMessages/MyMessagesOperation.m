//
//  MyMessagesOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MyMessagesOperation.h"

@implementation MyMessagesOperation
-(void)configOperation{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]dictionaryForKey:@"MainConfigModel"];
    NSString *url = [dic objectForKey:@"myMessages"];
    self.url = url;
    self.responseDataTag = @"sendMessages";
}
@end
