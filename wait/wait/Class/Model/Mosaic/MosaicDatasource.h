//
//  MosaicDatasource.h
//  MosaicUI
//
//  Created by 杨启晖 on 14-10-10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MosaicViewDatasourceProtocol.h"
@interface MosaicDatasource : NSObject<MosaicViewDatasourceProtocol>

@property (nonatomic, strong)NSMutableArray *elements;

+(MosaicDatasource*)sharedInstanceWithTemplates:(NSArray*)array;
-(instancetype)initWithTemplates:(NSArray *)array;
@end
