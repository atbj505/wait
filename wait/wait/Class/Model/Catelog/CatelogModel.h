//
//  CatelogModel.h
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "JSONModel.h"

@interface CatelogModel : QBaseModel
//  背景颜色
@property(nonatomic,copy)NSString *background;
//  分类ID
@property(nonatomic,copy)NSString *catalogID;
//  分类描述
@property(nonatomic,copy)NSString *catalogIntr;
//  分类名称
@property(nonatomic,copy)NSString *catalogName;
//  分类标识
@property(nonatomic,copy)NSString *flag;
//  分类Logo
@property(nonatomic,copy)NSString *logoUrl;
//  字体颜色
@property(nonatomic,copy)NSString *Codeblock;
//  默认模板
@property(nonatomic,strong)NSDictionary *recommendTemplet;
@end
