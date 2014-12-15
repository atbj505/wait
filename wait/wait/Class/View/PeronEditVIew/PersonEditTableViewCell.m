//
//  PersonEditTableViewCell.m
//  wait
//
//  Created by 杨启晖 on 14/12/15.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "PersonEditTableViewCell.h"

@implementation PersonEditTableViewCell

- (void)configCell:(NSIndexPath*)indexpath :(PersonInfoModel*)model{
    UIColor *grayColor = [UIColor hexColor:@"706894"];
    switch (indexpath.row) {
        case 0:
        {
            self.textLabel.text = @"昵称:";
            self.detailTextLabel.text = model.nickName;
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UIImage *image = [UIImage imageNamed:@"nicheng.png"];
            self.imageView.image = [image rt_tintedImageWithColor:grayColor];
        }
            break;
        case 1:
        {
            self.textLabel.text = @"性别:";
            UIImage *image = [UIImage imageNamed:@"xingbie.png"];
            self.imageView.image = [image rt_tintedImageWithColor:grayColor];
            if (model.sex == 0) {
                self.detailTextLabel.text = @"男";
            }else if (model.sex == 1){
                self.detailTextLabel.text = @"女";
            }
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case 2:
        {
            self.textLabel.text = @"姓名:";
            self.detailTextLabel.text = model.userName;
            UIImage *image = [UIImage imageNamed:@"xingming.png"];
            self.imageView.image = [image rt_tintedImageWithColor:grayColor];
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case 3:
        {
            self.textLabel.text = @"手机号:";
            self.textLabel.textColor = [UIColor hexColor:@"02E2A3"];
            UIImage *image = [UIImage imageNamed:@"shoujihao.png"];
            self.imageView.image = [image rt_tintedImageWithColor:[UIColor hexColor:@"02E2A3"]];
            self.detailTextLabel.text = model.mobile;
            self.detailTextLabel.textColor = [UIColor hexColor:@"02E2A3"];
        }
            break;
        default:
            break;
    }
}
@end
