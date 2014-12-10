//
//  QBaseViewController+Photo.m
//  QBaseViewFramework
//
//  Created by andy on 10/18/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseViewController+Photo.h"
#import <objc/message.h>

#define SET_PICKER_SOURCE_TYPE(__picker, __sourceType) \
if ([UIImagePickerController isSourceTypeAvailable:__sourceType]) {\
    __picker.sourceType = __sourceType;\
}
#define CHOOSE_PHOTO_SHEET_TAG 20001
@implementation QBaseViewController (Photo)

- (void)photoChooseShowActionSheetInView:(UIView *)view
{
    UIActionSheet *_sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                        delegate:self
                                               cancelButtonTitle:@"取消"
                                          destructiveButtonTitle:nil
                                               otherButtonTitles:@"拍照",@"相册", nil];
    _sheet.tag = CHOOSE_PHOTO_SHEET_TAG;
    [_sheet showInView:view];
}
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    for (UIView *view in actionSheet.subviews) {
        UIButton *button = (UIButton *) view;
        //改变颜色
//        button.tintColor = [UIColor blackColor];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}
#pragma mark -
#pragma mark UIActionSheet Delegate Helper

- (void)photoChooseWithActionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag != CHOOSE_PHOTO_SHEET_TAG) {
        return;
    }
    
    if (buttonIndex == 2) {
        NSLog(@"取消选择");
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //picker.navigationBar.tintColor = [UIColor whiteColor];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    switch (buttonIndex) {
        case 0:
            SET_PICKER_SOURCE_TYPE(picker, UIImagePickerControllerSourceTypeCamera);
            break;
        case 1:
            SET_PICKER_SOURCE_TYPE(picker, UIImagePickerControllerSourceTypePhotoLibrary);
            break;
    }  
    
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 原图
    UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // 编辑图
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    ((void(*)(id,SEL,id,id,id))objc_msgSend)(self, @selector(photoChoose:originalImage:editedImage:), picker, originalImage, editedImage);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end


