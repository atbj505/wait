//
//  SendInfoView.m
//  wait
//
//  Created by 杨启晖 on 14/12/16.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "SendInfoView.h"

@implementation SendInfoView
-(instancetype)initWithFrame:(CGRect)frame andreceiveModel:(MessagesModel*)receiveModel{
    self = [super initWithFrame:frame];
    if (self) {
        //添加发件人头像
        UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        photoImage.layer.cornerRadius = photoImage.frame.size.height/2;
        photoImage.layer.masksToBounds = YES;
        
        //时间标签
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 0, 200, 15)];
        timeLabel.textColor = [UIColor whiteColor];
        
        //位置标签
        UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 200, 90)];
        addressLabel.numberOfLines = 4;
        addressLabel.textColor = [UIColor whiteColor];
        
        [photoImage sd_setImageWithURL:[NSURL URLWithString:receiveModel.userPic] placeholderImage:[UIImage imageNamed:@"touxiang.fw.png"]];
        timeLabel.text = receiveModel.senderTime;
        timeLabel.textColor = [UIColor hexColor:receiveModel.color];
        addressLabel.text = receiveModel.address;
        addressLabel.textColor = [UIColor hexColor:receiveModel.color];
        [self addSubview:photoImage];
        [self addSubview:timeLabel];
        [self addSubview:addressLabel];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame andsendModel:(MyMessagesModel*)sendModel{
    self = [super initWithFrame:frame];
    if (self) {
        //添加发件人头像
        UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        photoImage.layer.cornerRadius = photoImage.frame.size.height/2;
        photoImage.layer.masksToBounds = YES;
        
        //时间标签
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 0, 200, 15)];
        timeLabel.textColor = [UIColor whiteColor];
        
        //位置标签
        UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 200, 90)];
        addressLabel.numberOfLines = 4;
        addressLabel.textColor = [UIColor whiteColor];
        
        [photoImage sd_setImageWithURL:[NSURL URLWithString:sendModel.receiveUserPicUrl] placeholderImage:[UIImage imageNamed:@"touxiang.fw.png"]];
        timeLabel.text = sendModel.senderTime;
        timeLabel.textColor = [UIColor hexColor:sendModel.color];
        addressLabel.text = sendModel.address;
        addressLabel.textColor = [UIColor hexColor:sendModel.color];
        
        [self addSubview:photoImage];
        [self addSubview:timeLabel];
        [self addSubview:addressLabel];
    }
    return self;
}
@end
