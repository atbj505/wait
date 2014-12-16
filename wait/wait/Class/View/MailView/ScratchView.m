//
//  ScratchView.m
//  T-MessageDemo
//
//  Created by 杨启晖 on 14-9-27.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "ScratchView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


@implementation ScratchView

-(id)initScratchViewWithSizeBrush:(NSUInteger)size{
    self = [super init];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        [self setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setOpaque:NO];
        [self setSizeBrush:size];
        
        [self setValue:@(0) forKey:@"touchCount"];
        [self addObserver:self forKeyPath:@"touchCount" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    STScratchView* view = object;
    if (view.touchCount >= 80) {
        //[self removeObserver:self forKeyPath:@"touchCount"];
        [UIView animateWithDuration:1.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"clear" object:nil];
        }];
    }
}
- (void)dealloc{
    [self removeObserver:self forKeyPath:@"touchCount"];
}
@end
