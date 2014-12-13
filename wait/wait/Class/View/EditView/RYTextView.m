//
//  RYTextView.m
//  wait
//
//  Created by 杨启晖 on 14/12/13.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYTextView.h"

@implementation RYTextView
+(RYTextView*)textViewWithFrame:(CGRect)frame delegate:(id<UITextViewDelegate>)vc{
    RYTextView *textView = [[RYTextView alloc]initWithFrame:frame];
    textView.delegate = vc;
    return textView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
        self.font = FONT(23);
        self.layer.cornerRadius = 20;
        self.placeholder = @"最多可以128字";
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = YES;
        self.returnKeyType = UIReturnKeyDefault;
        self.scrollEnabled = YES;
        self.keyboardAppearance = UIKeyboardAppearanceDark;
    }
    return self;
}
@end
