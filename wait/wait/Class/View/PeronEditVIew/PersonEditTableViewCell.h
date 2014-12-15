//
//  PersonEditTableViewCell.h
//  wait
//
//  Created by 杨启晖 on 14/12/15.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonInfo.h"
#import "UIImage+RTTint.h"

@interface PersonEditTableViewCell : UITableViewCell
- (void)configCell:(NSIndexPath*)indexpath :(PersonInfoModel*)model;
@end
