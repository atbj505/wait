//
//  EditViewController.m
//  wait
//
//  Created by 杨启晖 on 14/12/12.
//  Copyright (c) 2014年 telcolor. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
//  模板背景图片
@property (nonatomic, strong)RYImageView *templetImage;
//  模板内容
@property (nonatomic, strong)RYTextView *templetContent;
//  调色版
@property (nonatomic, strong)ColorBoardView *colorBoard;
//  选择模板ID
@property (nonatomic ,strong)NSString *templetID;
//  定位Manager
@property (nonatomic, strong)CLLocationManager *manager;
//  位置信息
@property (nonatomic, strong)NSString *locationInfo;
//  省市信息
@property (nonatomic, strong)NSString *locationCity;
//  文本位置
@property (nonatomic, assign)CGPoint contentPoint;
//  本地模板/标准模板判断条件
@property (nonatomic, assign)BOOL isSysteml;
//  颜色
@property (nonatomic, strong)NSString *colorString;
//  调色板弹出判断条件
@property (nonatomic ,assign)BOOL changeFontIsTap;
@end

@implementation EditViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self updateUI];
}
- (void)updateUI{
    [self addNaviTitle];
    [self addTemplateView];
    [self addContentTextView];
    [self addButtons];
    //  取消iOS7的边缘延伸效果
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
}
- (void)addNaviTitle{
    [self naviTitle:@"编辑页"];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)addTemplateView{
    self.templetImage = [[RYImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.templetImage];
    
    [self getDefaultTemplet];
}
- (void)getDefaultTemplet{
    TempletModel *defaultTemplet = [[TempletModel alloc]initWithDictionary:self.catelogModel.recommendTemplet error:nil];
    [self.templetImage withImageName:defaultTemplet.templetUrl andPlaceHolder:@"bianjiye.png"];
    self.templetID = defaultTemplet.templetUrl;
    self.templetContent.text = defaultTemplet.templetIntr;
}
- (void)addContentTextView{
    self.templetContent = [RYTextView textViewWithFrame:CGRectMake(SCREENWIDTH / 2 - 120, 150, 240, 40) delegate:self];
    [self.view addSubview:self.templetContent];
    self.contentPoint = self.templetContent.frame.origin;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panTextView:)];
    [self.templetContent addGestureRecognizer:pan];
}
- (void)panTextView:(UIPanGestureRecognizer*)panGR{
    CGPoint location = [panGR locationInView:self.templetImage];
    self.templetContent.center = location;
    self.contentPoint = self.templetContent.frame.origin;
}
- (void)addButtons{
    EditButtonsView *buttonView = [[EditButtonsView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50) names:@[@"muban.png",@"xiangce.png",@"ziti.png"]];
    [buttonView.templet addTarget:self action:@selector(changeTemplet) forControlEvents:UIControlEventTouchUpInside];
    [buttonView.localTemplet addTarget:self action:@selector(changelocalTemplet) forControlEvents:UIControlEventTouchUpInside];
    [buttonView.font addTarget:self action:@selector(changeFont) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonView];
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-10);
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(@50);
    }];
}
- (void)changeTemplet{
    self.isSysteml = YES;
    MosaicViewController *mosiacVC = [[MosaicViewController alloc]initWithNibName:nil bundle:nil];;
    mosiacVC.delegate = self;
    mosiacVC.catalogID = self.catelogModel.catalogID;
    [MobClick event:@"changeTemp"];
    [self.navigationController pushViewController:mosiacVC animated:YES];
}
- (void)changelocalTemplet{
    [self photoChooseShowActionSheetInView:self.view];
}
- (void)changeFont{
    if (self.changeFontIsTap) {
        [self.colorBoard removeFromSuperview];
        self.changeFontIsTap = NO;
    }else{
        self.colorBoard = [[ColorBoardView alloc]initWithFrame:CGRectMake(SCREENWIDTH - 265, SCREENHEIGHT, 260, 50)];
        self.colorBoard.delegate = self;
        [MobClick event:@"changeText"];
        [self.view addSubview:self.colorBoard];
        self.changeFontIsTap = YES;
    }
}
#pragma mark -
#pragma mark MosaicViewController 代理方法
-(void)getSelectImageName:(MosaicViewController *)slideVC and:(NSString *)imageName and:(NSString *)templetID{
    [slideVC.navigationController popViewControllerAnimated:YES];
    [self.templetImage withImageName:imageName andPlaceHolder:@"bianjiye.png"];
    self.templetID = imageName;
}
#pragma mark -
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self photoChooseWithActionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
}
#pragma mark -
#pragma mark UIImagePickerController 代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = nil;
    if ([info objectForKey:UIImagePickerControllerEditedImage]) {
        image = [info objectForKey:UIImagePickerControllerEditedImage];
        image = [image imageToFitSize:self.templetImage.bounds.size method:MGImageResizeCrop];
    }else{
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    self.templetImage.image = image;
    //  设置为非系统提供模板
    _isSysteml = NO;
    NSData *imageData = UIImageJPEGRepresentation(image, 0.4);;
    [[NSUserDefaults standardUserDefaults]setValue:imageData forKey:@"templetImage"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    self.templetID = @"";
}
#pragma mark -
#pragma mark ColorBoardViewDelegate
-(void)getSelectedColor:(ColorBoardView *)colorBoard andColor:(UIColor *)color andColorString:(NSString *)colorString{
    self.templetContent.textColor = color;
    self.colorString = colorString;
}
#pragma mark -
#pragma mark UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text; {
    NSUInteger number = [textView.text length];
    if (number == 128) {
        [PXAlertView showAlertWithTitle:@"文本字数不能大于128个字"];
        [self.templetContent deleteBackward];
        return NO;
    }
    return YES;
}
NSUInteger tempLine = 1;
- (void)textViewDidChange:(UITextView *)textView {
    NSUInteger line = round( (textView.contentSize.height - textView.textContainerInset.top - textView.textContainerInset.bottom) / textView.font.lineHeight );
    
    NSUInteger minus = 0;
    if (line != tempLine) {
        minus = textView.font.lineHeight;
    }
    tempLine = line;
    
    self.templetContent.frame = CGRectMake ( self.templetContent.frame.origin.x, self.templetContent.frame.origin.y, self.templetContent.frame.size.width , self.templetContent. contentSize . height );
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    CGPoint center = self.templetContent.center;
    center.y = 170;
    center.x = SCREENWIDTH / 2;
    self.templetContent.center = center;
}
- (void)textViewDidEndEditing:(UITextView *)textView;{
    CGRect frame = textView.frame;
    frame.origin = self.contentPoint;
    textView.frame = frame;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.templetContent resignFirstResponder];
    if (self.changeFontIsTap) {
        [self.colorBoard removeFromSuperview];
    }
}
- (void)done{
    if ([[QBaseUserInfo sharedQBaseUserInfo]userInfo]) {
        AddressBookViewController *addressVC = [[AddressBookViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:addressVC animated:YES];
    }else{
        LogInViewController *logVC = [[LogInViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:logVC animated:YES];
    }
}
@end
