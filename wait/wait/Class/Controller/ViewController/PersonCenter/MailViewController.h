//
//  MailViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"

@class MailViewController;
@protocol MailViewControllerDelegate <NSObject>

- (void)getCount:(NSUInteger)count;

@end

@interface MailViewController : RYViewController

@end
