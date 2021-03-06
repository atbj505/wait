//
//  SVProgressHUD.h
//
//  Created by Guo Mingliang on 4/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface SVProgressHUD : UIView 

/* 
showInView:(UIView*)	-> the view you're adding the HUD to. By default, it's added to the keyWindow rootViewController, or the keyWindow if the rootViewController is nil
status:(NSString*)		-> a loading status for the HUD (different from the success and error messages)
networkIndicator:(BOOL)	-> whether or not the HUD also triggers the UIApplication's network activity indicator (default is YES)
posY:(CGFloat)			-> the vertical position of the HUD (default is (viewHeight/2)-50)
*/
 
+ (void)show;
+ (void)showInView:(UIView*)view;
+ (void)showInView:(UIView*)view status:(NSString*)string;
+ (void)showInView:(UIView*)view status:(NSString*)string networkIndicator:(BOOL)show;
+ (void)showInView:(UIView*)view status:(NSString*)string networkIndicator:(BOOL)show posY:(CGFloat)posY;

+ (void)setStatus:(NSString*)string; // change the HUD loading status while it's showing

+ (void)dismiss; // simply dismiss the HUD with a fade+scale out animation
+ (void)dismissWithSuccess:(NSString*)successString; // also displays the success icon image
+ (void)dismissWithError:(NSString*)errorString; // also displays the error icon image

@end
