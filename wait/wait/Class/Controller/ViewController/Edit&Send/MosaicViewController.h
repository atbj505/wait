//
//  MosaicViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/14.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"
#import "MosaicView.h"
#import "MosaicViewDelegateProtocol.h"
#import "MosaicRequest.h"

@class MosaicViewController;
@protocol MosaicViewControllerDelegate <NSObject>

-(void)getSelectImageName:(MosaicViewController *)slideVC and:(NSString *)imageName and:(NSString *)templetID;

@end

@interface MosaicViewController : RYViewController<MosaicViewDelegateProtocol>
@property (nonatomic, strong)id<MosaicViewControllerDelegate>delegate;
//  模板ID
@property (nonatomic, strong)NSString *catalogID;
@end
