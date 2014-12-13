//
//  ValidateViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"
#import "ValidateView.h"
#import "MessageValidate.h"
#import "UpVali.h"

@interface ValidateViewController : RYViewController<UITextFieldDelegate>
@property (nonatomic, strong)NSString *mobile;
@property (nonatomic, assign)BOOL isFromEdit;
@end
