//
//  CatelogTableViewCell.m
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "CatelogTableViewCell.h"


@interface CatelogTableViewCell()


@end

@implementation CatelogTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(18, 22, 30, 30)];
        self.catelogIntro = [[UILabel alloc]initWithFrame:CGRectMake(81, 27, 80, 20)];
        self.catelogIntro.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.photoImage];
        [self addSubview:self.catelogIntro];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.superview.clipsToBounds = NO;
    self.catelogIntro.text = self.model.catalogName;
    if (self.isClick) {
        self.catelogIntro.textColor = [UIColor whiteColor];
        UIImage *image = self.photoImage.image;
        image = [image rt_tintedImageWithColor:[UIColor whiteColor]];
        self.photoImage.image = image;
    }else{
        self.catelogIntro.textColor = [UIColor hexColor:self.model.Codeblock];
        [self.photoImage sd_setImageWithURL:[NSURL URLWithString:self.model.logoUrl]];
    }
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    //上分割线
    CGContextSetStrokeColorWithColor(context, [UIColor hexColor:@"2E2E2E"].CGColor);
    CGContextStrokeRect(context, CGRectMake(0, -4, rect.size.width, 4));
    //下分割线
//    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
//    CGContextStrokeRect(context, CGRectMake(0, -4, rect.size.width, 4));
}
@end
