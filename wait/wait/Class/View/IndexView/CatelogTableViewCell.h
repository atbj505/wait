//
//  CatelogTableViewCell.h
//  Wait
//
//  Created by 杨启晖 on 14/10/25.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatelogModel.h"
#import "UIImageView+WebCache.h"
#import "UIImage+RTTint.h"
#import "UIColor+hexColor.h"

@interface CatelogTableViewCell : UITableViewCell
@property (nonatomic, strong)CatelogModel *model;
@property (strong, nonatomic) RYImageView *photoImage;
@property (strong, nonatomic) UILabel *catelogIntro;
@property (nonatomic, assign) BOOL isClick;
@end
