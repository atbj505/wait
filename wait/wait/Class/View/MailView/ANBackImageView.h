//
//  ANBackImageView.h
//  ANBlurredImageViewDemo
//
//  Created by 杨启晖 on 14-9-27.
//  Copyright (c) 2014年 Delve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessagesModel.h"
#import "MyMessagesModel.h"

@interface ANBackImageView : UIImageView <UITextViewDelegate>

-(instancetype)initBackImageViewWithReceiveMail:(MessagesModel*)mail :(CGRect)frame :(NSString *)image;

-(instancetype)initBackImageViewWithSendMail:(MyMessagesModel*)mail :(CGRect)frame :(NSString *)image;
@end
