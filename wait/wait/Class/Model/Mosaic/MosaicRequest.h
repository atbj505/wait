//
//  MosaicRequest.h
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TempletModel.h"

@interface MosaicRequest : NSObject
/**
 *  Mosaic网络请求
 */
-(NSData*)urlRequestWith:(NSString*)catelogID;
/**
 *  JSON解析
 */
-(NSMutableArray*)jsonParserWith:(NSData*)data;
@end
