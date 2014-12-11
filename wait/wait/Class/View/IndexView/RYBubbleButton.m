//
//  RYBubbleButton.m
//  wait
//
//  Created by 杨启晖 on 14/12/11.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYBubbleButton.h"

@implementation RYBubbleButton

-(id)initWithFrame:(CGRect)frame expansionDirection:(ExpansionDirection)direction{
    self = [super initWithFrame:frame expansionDirection:direction];
    if (self) {
        self.homeButtonView = [self createHomeView];
        [self addButtons:[self createDemoButtonArray]];
    }
    return self;
}
- (UILabel *)createHomeView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 57.f, 57.f)];
    
    label.layer.cornerRadius = label.frame.size.height / 2.f;
    label.backgroundColor =[UIColor clearColor];
    label.clipsToBounds = YES;
    return label;
}
- (NSArray *)createDemoButtonArray {
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (NSString *title in @[@"paizhao.fw.png", @"benji.fw.png", @"bianji.fw.png", @"xinxiang.fw.png"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
        button.frame = CGRectMake(0.f, 0.f, 38.f, 38.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [buttonsMutable addObject:button];
    }
    
    return [buttonsMutable copy];
}
@end
