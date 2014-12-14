//
//  EditViewController.h
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYViewController.h"
#import "AddressBookViewController.h"
#import "LogInViewController.h"
#import "Catelog.h"
#import "GCPlaceholderTextView.h"
#import "ColorBoardView.h"
#import "Templet.h"
#import "UIImageView+WebCache.h"
#import "RYTextView.h"
#import "MailObject.h"
#import "EditButtonsView.h"
#import "MosaicViewController.h"
#import "UIImage+ProportionalFill.h"

@interface EditViewController : RYViewController<UITextViewDelegate,UIActionSheetDelegate,MosaicViewControllerDelegate,ColorBoardViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>

@property(nonatomic, strong)CatelogModel *catelogModel;

@end
