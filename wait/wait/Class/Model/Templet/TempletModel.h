//
//  TempletModel.h
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "JSONModel.h"

@interface TempletModel : QBaseModel
//  模板标识
@property (nonatomic, strong)NSString *templetID;
//  模板名称
@property (nonatomic, strong)NSString *templetName;
//  模板描述
@property (nonatomic, strong)NSString *templetIntr;
//  模板地址
@property (nonatomic, strong)NSString *templetUrl;
//  模板缩略图
@property (nonatomic, strong)NSString *templetThumbnailUrl;
//  缩略图大小
@property (nonatomic, assign)NSString *size;
//  模板背景音乐
@property (nonatomic, strong)NSString *templetAudioUrl;
//  模板标识
@property (nonatomic, strong)NSString *flag;
@end
