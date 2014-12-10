//
//  RYScrollView.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYScrollView.h"

@interface RYScrollView ()
@property (nonatomic, strong)NSArray *items;
@end

@implementation RYScrollView

- (instancetype)initWithItems:(NSArray*)items
{
    self = [super init];
    if (self) {
        self.items = items;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = NO;
        self.frame = [UIScreen mainScreen].bounds;
        [self addContainer];
    }
    return self;
}
- (void)addContainer{
    for (int i = 0 ; i < self.items.count; i++) {
        UIImage * image = [UIImage imageNamed:self.items[i]];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        CGRect frame = self.frame;
        frame.origin.x = i * frame.size.width;
        frame.origin.y = 0;
        imageView.frame = frame;
        [self addSubview:imageView];
        if (i == self.items.count - 1) {
            [self startButtoninView:imageView];
        }
    }
    CGSize size = self.bounds.size;
    size.width *= self.items.count;
    self.contentSize = size;
}
- (void)startButtoninView:(UIImageView*)imageView{
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.frame = self.frame;
    self.nextButton.backgroundColor = [UIColor clearColor];
    imageView.userInteractionEnabled = YES;
    [imageView addSubview:self.nextButton];
}
@end
