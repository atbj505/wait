//
//  PersonTableViewCell.h
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Messages.h"
#import "MyMessages.h"
#import "UIImageView+WebCache.h"
#import "UIColor+hexColor.h"

@interface PersonTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView *personImage;
@property (nonatomic, strong)UIView *backView;
@property (nonatomic, strong)UILabel *personNameLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIView *tagView;
@property (nonatomic, assign)BOOL isSend;
//  发件模型信息
@property (nonatomic, strong)MyMessagesModel *sendModel;
//  收件模型信息
@property (nonatomic, strong)MessagesModel *receiveModel;
@end
