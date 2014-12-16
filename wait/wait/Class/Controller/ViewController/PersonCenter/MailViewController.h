//
//  MailViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"
#import "MyMessages.h"
#import "Messages.h"
#import "ANBackImageView.h"
#import "ScratchView.h"
#import "UIImageView+WebCache.h"
#import "Upstatus.h"
#import "SendInfoView.h"

@class MailViewController;
@protocol MailViewControllerDelegate <NSObject>

- (void)getCount:(NSUInteger)count;

@end

@interface MailViewController : RYViewController
//  发件模型信息
@property (nonatomic, strong)MyMessagesModel *sendModel;
//  收件模型信息
@property (nonatomic, strong)MessagesModel *receiveModel;
@property (nonatomic, assign)NSUInteger count;
@property (nonatomic, weak)id<MailViewControllerDelegate>delegate;
@end
