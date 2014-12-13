//
//  RYTextView.h
//  wait
//
//  Created by 杨启晖 on 14/12/13.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "GCPlaceholderTextView.h"

@interface RYTextView : GCPlaceholderTextView
+(RYTextView*)textViewWithFrame:(CGRect)frame delegate:(id<UITextViewDelegate>)vc;
@end
