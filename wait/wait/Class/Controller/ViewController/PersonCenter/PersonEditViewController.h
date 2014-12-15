//
//  PersonEditViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"
#import <MessageUI/MFMessageComposeViewController.h>
#import "PersonInfo.h"
#import "UpVali.h"
#import "PersonEditTableViewCell.h"

@interface PersonEditViewController : RYViewController< UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,MFMessageComposeViewControllerDelegate>

@end
