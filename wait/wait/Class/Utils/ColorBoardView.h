//
//  ColorBoardView.h
//  indexDemo
//
//  Created by 杨启晖 on 14/10/22.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorBoardView;

@protocol ColorBoardViewDelegate <NSObject>
- (void)getSelectedColor:(ColorBoardView*)colorBoard andColor:(UIColor*)color andColorString:(NSString *)colorString;

@end

@interface ColorBoardView : UIView
@property (nonatomic,weak)id<ColorBoardViewDelegate>delegate;

@end
