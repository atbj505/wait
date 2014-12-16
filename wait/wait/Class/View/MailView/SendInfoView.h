//
//  SendInfoView.h
//  wait
//
//  Created by 杨启晖 on 14/12/16.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Messages.h"
#import "MyMessages.h"

@interface SendInfoView : UIView
-(instancetype)initWithFrame:(CGRect)frame andreceiveModel:(MessagesModel*)receiveModel;
-(instancetype)initWithFrame:(CGRect)frame andsendModel:(MyMessagesModel*)sendModel;
@end
