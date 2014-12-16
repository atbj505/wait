//
//  AlertContentView.h
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertContentView : UIView
@property (nonatomic, strong)UITextField *firstTextField;
@property (nonatomic, strong)UITextField *secondTextField;
/**
 *  昵称视图
 */
-(instancetype)initWithNickView:(CGRect)frame;
/**
 *  姓名视图
 */
-(instancetype)initWithNameView:(CGRect)frame;
@end
