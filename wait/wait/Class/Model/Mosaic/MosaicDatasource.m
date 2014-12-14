//
//  MosaicDatasource.m
//  MosaicUI
//
//  Created by 杨启晖 on 14-10-10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "MosaicDatasource.h"
#import "MosaicData.h"
#import "TempletModel.h"

@interface MosaicDatasource ()
@property (nonatomic, strong)NSArray *templates;
@end
@implementation MosaicDatasource
-(instancetype)initWithTemplates:(NSArray *)array{
    self = [super init];
    if (self) {
        self.elements = [NSMutableArray array];
        self.templates = array;
        [self loadData];
    }
    return self;
}

-(void)loadData{
    for (TempletModel *myTemplate in self.templates) {
        NSDictionary *dic = @{@"imageUrl":myTemplate.templetThumbnailUrl,
                              @"name":myTemplate.templetIntr,
                              @"size":@(myTemplate.size.integerValue),
                              @"templetID":myTemplate.templetID,
                              @"bigImageUrl":myTemplate.templetUrl};
        MosaicData *modelData = [[MosaicData alloc]initWithDictionary:dic];
        [self.elements addObject:modelData];
    }
}
+(MosaicDatasource*)sharedInstanceWithTemplates:(NSArray*)array{
    MosaicDatasource *sharedInstance = [[MosaicDatasource alloc]initWithTemplates:array];
    return sharedInstance;
}
-(NSArray *)mosaicElements{
    NSArray *retVal = self.elements;
    return retVal;
}
@end
