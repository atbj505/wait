//
//  PersonTableViewCell.m
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundColor = [UIColor clearColor];
        UIView *bgColorView = [[UIView alloc] initWithFrame:self.frame];
        bgColorView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
        [self setSelectedBackgroundView:bgColorView];
        self.backView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, 2, 92)];
        self.backView.backgroundColor = [UIColor hexColor:@"706894"];
        [self addSubview:self.backView];
        
        self.personImage = [[UIImageView alloc]initWithFrame:CGRectMake(25, 23, 45, 45)];
        self.personImage.layer.cornerRadius = self.personImage.frame.size.height / 2;
        self.personImage.layer.masksToBounds = YES;
        [self addSubview:self.personImage];
        
        self.tagView = [[UIView alloc]initWithFrame:CGRectMake(83, 40, 10, 10)];
        self.tagView.layer.cornerRadius = self.tagView.bounds.size.height / 2;
        self.tagView.layer.masksToBounds = YES;
        [self addSubview:self.tagView];
        
        self.personNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 25, 226, 20)];
        self.personNameLabel.font = [UIFont fontWithName:@"Heiti SC" size:13];
        self.personNameLabel.textColor = [UIColor hexColor:@"87839D"];
        [self addSubview:self.personNameLabel];
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 48, 226, 20)];
        self.timeLabel.font = [UIFont fontWithName:@"Heiti SC" size:13];
        self.timeLabel.textColor = [UIColor hexColor:@"87839D"];
        [self addSubview:self.timeLabel];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //  发送邮件
    if (self.isSend) {
        if (![self.sendModel.receiveUserPicUrl isEqualToString:@" "]) {
            [self.personImage sd_setImageWithURL:[NSURL URLWithString:self.sendModel.receiveUserPicUrl]];
        }else{
            self.personImage.image = [UIImage imageNamed:@"touxiang.fw.png"];
        }
        if (![self.sendModel.receiveUserNick isKindOfClass:[NSNull class]]) {
            self.personNameLabel.text = self.sendModel.receiveUserNick;
        }else{
            self.personNameLabel.text = self.sendModel.receiveUserName;
        }
        
        self.timeLabel.text = self.sendModel.senderTime;
    }else{
        //  接收邮件
        if (![self.receiveModel.userPic isEqualToString:@" "]) {
            [self.personImage sd_setImageWithURL:[NSURL URLWithString:self.receiveModel.userPic]];
        }else{
            self.personImage.image = [UIImage imageNamed:@"touxiang.fw.png"];
        }
        if (self.receiveModel.status == 0) {
            self.tagView.backgroundColor = [UIColor hexColor:@"02E2A3"];
        }else{
            self.tagView.backgroundColor = [UIColor clearColor];
        }
        self.personNameLabel.text = self.receiveModel.nickName;
        self.timeLabel.text = self.receiveModel.receiveTime;
    }
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    //上分割线
    CGContextSetStrokeColorWithColor(context, [UIColor hexColor:@"706894"].CGColor);
    CGContextStrokeRect(context, CGRectMake(16, -4, rect.size.width, 4));
}

@end
