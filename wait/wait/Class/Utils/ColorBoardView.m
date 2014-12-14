//
//  ColorBoardView.m
//  indexDemo
//
//  Created by 杨启晖 on 14/10/22.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "ColorBoardView.h"
#import "UIColor+hexColor.h"

@interface ColorBoardView()

@property (nonatomic, strong)NSArray *colorArr;
@property (nonatomic, strong)NSMutableArray *colorButtons;
@end

@implementation ColorBoardView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.colorButtons = [NSMutableArray array];
        UIColor *redColor = [UIColor hexColor:@"F55447"];
        UIColor *orangeColor = [UIColor hexColor:@"FFA64D"];
        UIColor *yellowColor = [UIColor hexColor:@"EEDD62"];
        UIColor *greenColor = [UIColor hexColor:@"6BB627"];
        UIColor *blueColor = [UIColor hexColor:@"4DA6FF"];
        UIColor *deepBlueColor = [UIColor hexColor:@"4D74FF"];
        UIColor *purpleColor = [UIColor hexColor:@"8D56DB"];
        UIColor *whiteColor = [UIColor hexColor:@"EEEEEE"];
        UIColor *blackColor = [UIColor hexColor:@"000000"];
        UIColor *grayColor = [UIColor hexColor:@"777777"];
        self.colorArr = @[redColor,orangeColor,yellowColor,greenColor,blueColor,deepBlueColor,purpleColor,whiteColor,blackColor,grayColor];
        [self colorBoardAnimation];
    }
    return self;
}

- (void)colorBoardAnimation{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = CGRectMake(SCREENWIDTH - 260, SCREENHEIGHT - 245, 260, 110);
    } completion:^(BOOL finished) {
        for (int i = 0; i < 10; i++) {
            UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(i%5*52, i/5*55, 50, 50)];
            btn.layer.cornerRadius = btn.bounds.size.height/4;
            btn.layer.masksToBounds = YES;
            btn.tag = i;
            btn.backgroundColor = self.colorArr[i];
            [btn addTarget:self action:@selector(colorSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self.colorButtons addObject:btn];
            [self addSubview:btn];
        }
    }];
}
- (void)colorSelected:(UIButton*)button{
    NSString *buttonColorStr = [self creatButtenColorWith:button];
    [self.delegate getSelectedColor:self andColor:self.colorArr[button.tag] andColorString:buttonColorStr];
}
- (NSString *)creatButtenColorWith:(UIButton *)button{
    switch (button.tag) {
        case 0:
            return @"F55447";
            break;
        case 1:
            return @"FFA64D";
            break;
        case 2:
            return @"EEDD62";
            break;
        case 3:
            return @"6BB627";
            break;
        case 4:
            return @"4DA6FF";
            break;
        case 5:
            return @"4D74FF";
            break;
        case 6:
            return @"8D56DB";
            break;
        case 7:
            return @"EEEEEE";
            break;
        case 8:
            return @"000000";
            break;
        case 9:
            return @"777777";
            break;
        default:
            return 0;
            break;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
