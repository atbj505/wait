//
//  AlertContentView.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "AlertContentView.h"

@implementation AlertContentView

-(instancetype)initWithNickView:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [self addLabel:@"昵称"];
        [self addSubview:label];
        
        self.firstTextField = [self addTextField:@"最多可输入15个字"];
        [self addSubview:self.firstTextField];
    }
    return self;
}
-(instancetype)initWithNameView:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [self addLabel:@"姓名"];
        [self addSubview:label];
        
        self.firstTextField = [self addTextField:@"请输入姓名"];
        [self addSubview:self.firstTextField];
    }
    return self;
}
- (UILabel*)addLabel:(NSString *)string{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    label.font = FONT(15);
    label.textColor = [UIColor whiteColor];
    label.text = string;
    return label;
}
- (UITextField*)addTextField:(NSString *)string{
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 0, 150, 30)];
    textField.placeholder = string;
    textField.textColor = [UIColor whiteColor];
    [textField becomeFirstResponder];
    textField.font = FONT(13);
    textField.borderStyle = UITextBorderStyleNone;
    return textField;
}
@end
