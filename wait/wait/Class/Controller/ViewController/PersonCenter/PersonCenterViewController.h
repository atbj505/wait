//
//  PersonCenterViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"
#import "QBaseWaterDropRefreshTableView.h"
#import "MailViewController.h"
#import "PersonCenterSegmentedControl.h"
#import "PersonTableViewCell.h"
#import "PersonCountLabel.h"
#import "Messages.h"
#import "MyMessages.h"

@interface PersonCenterViewController : RYViewController<UITableViewDataSource,UITableViewDelegate,QBaseTableViewDelegate,UIScrollViewDelegate,MailViewControllerDelegate>

@end
