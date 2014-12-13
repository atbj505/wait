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
    [self.view addSubview:buttonView];
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(SCREENWIDTH);
        make.height.mas_equalTo(@50);
    }];
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
