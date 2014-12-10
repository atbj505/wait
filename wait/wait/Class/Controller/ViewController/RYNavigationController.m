//
//  RYNavigationController.m
//  wait
//
//  Created by 杨启晖 on 14/12/10.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "RYNavigationController.h"

@interface RYNavigationController ()

@end

@implementation RYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - Gesture Recognizer -
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //FIXME:添加手势判断
//    if ([touch.view isKindOfClass:[STScratchView class]]){
//        
//        return NO;
//        
//    }
    
    return YES;
    
}

@end
