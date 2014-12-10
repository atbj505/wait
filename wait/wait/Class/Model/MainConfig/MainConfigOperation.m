//
//  MainConfigOperation.m
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MainConfigOperation.h"

@implementation MainConfigOperation
-(void)configOperation{
    self.url = @"http://192.168.10.216/pic/zp-core/interface/maiconfig.php?";
    self.responseDataTag = @"UrlConfig";
}
@end
