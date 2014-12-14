//
//  EditButtonsView.h
//  wait
//
//  Created by 杨启晖 on 14/12/13.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditButtonsView : UIView
@property (nonatomic, strong)UIButton *templet;
@property (nonatomic, strong)UIButton *localTemplet;
@property (nonatomic, strong)UIButton *font;

-(instancetype)initWithFrame:(CGRect)frame names:(NSArray *)names;
@end
