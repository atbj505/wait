//
//  MailObject.h
//  Wait
//
//  Created by 杨启晖 on 14/10/26.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "JSONModel.h"

@interface MailObject : JSONModel
{
    @public
    //  是否是系统模板
    BOOL isSystem;
}

//  分类ID
@property (nonatomic, copy)NSString *catelogName;
//  模板ID
@property (nonatomic, copy)NSString *templetID;
//  信件文字内容
@property (nonatomic, copy)NSString *templetContent;
//  字体颜色
@property (nonatomic, strong)NSString *textColor;
//  字体位置
@property (nonatomic, assign)CGRect cgrect;
//  地理信息-市
@property (nonatomic, strong)NSString *city;
//  地理信息-详情
@property (nonatomic, strong)NSString *locationDetail;
//  收件人
@property (nonatomic, strong)NSArray *receivers;
//  收信时间
@property (nonatomic, strong)NSString *time;
@end
