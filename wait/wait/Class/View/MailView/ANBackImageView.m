//
//  ANBackImageView.m
//  ANBlurredImageViewDemo
//
//  Created by 杨启晖 on 14-9-27.
//  Copyright (c) 2014年 Delve. All rights reserved.
//

#import "ANBackImageView.h"
#import "UIImageView+WebCache.h"
#import "RQShineLabel.h"
@interface ANBackImageView ()
@property (nonatomic, strong)RQShineLabel *shineLabel;
@end
@implementation ANBackImageView

-(instancetype)initBackImageViewWithReceiveMail:(MessagesModel*)mail :(CGRect)frame :(NSString *)image{
    self = [ super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shineBegin)   name:@"clear" object:nil];
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.userInteractionEnabled = YES;
        [self sd_setImageWithURL:[NSURL URLWithString:image]];

        CGRect labelRect = CGRectMake([mail.wordx integerValue], [mail.wordy integerValue], [mail.width integerValue], [mail.height integerValue]);
        self.shineLabel = [[RQShineLabel alloc] initWithFrame:labelRect];
        self.shineLabel.numberOfLines = 0;
        self.shineLabel.textAlignment = NSTextAlignmentCenter;
        self.shineLabel.textColor = [UIColor hexColor:mail.color];
        self.shineLabel.text = mail.content;
        self.shineLabel.font = FONT(23);
        self.shineLabel.backgroundColor = [UIColor clearColor];
        //[self.shineLabel sizeToFit];
        [self addSubview:self.shineLabel];
    }
    return self;
}

-(instancetype)initBackImageViewWithSendMail:(MyMessagesModel*)mail :(CGRect)frame :(NSString *)image{
    self = [ super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shineBegin)   name:@"clear" object:nil];
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.userInteractionEnabled = YES;
        [self sd_setImageWithURL:[NSURL URLWithString:image]];

        CGRect labelRect = CGRectMake([mail.wordx integerValue], [mail.wordy integerValue], [mail.width integerValue], [mail.height integerValue]);
        self.shineLabel = [[RQShineLabel alloc] initWithFrame:labelRect];
        self.shineLabel.numberOfLines = 0;
        self.shineLabel.textAlignment = NSTextAlignmentCenter;
        self.shineLabel.textColor = [UIColor hexColor:mail.color];
        self.shineLabel.text = mail.content;
        self.shineLabel.font = FONT(23);
        self.shineLabel.backgroundColor = [UIColor clearColor];
        //[self.shineLabel sizeToFit];
        [self addSubview:self.shineLabel];
    }
    return self;
}
- (void)shineBegin{
    [[NSNotificationCenter  defaultCenter] removeObserver:self  name:@"clear" object:nil];
    [self.shineLabel shine];
}
- (CGSize)textSizeWithString:(NSString*)text Font:(UIFont *)font constrainedToSize:(CGSize)size{
    CGSize textSize;
    NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGRect rect = [text boundingRectWithSize:size options:option attributes:attributes context:nil];
    textSize = rect.size;
    return textSize;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]&&![textView.text isEqualToString:@""]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (UIColor*)creatColorWith:(NSString *)colorStr{
    if ([colorStr isEqualToString: @"redColor"]) {
        return [UIColor redColor];
    }else if ([colorStr isEqualToString:@"orangeColor"]){
        return [UIColor orangeColor];
    }else if ([colorStr isEqualToString:@"yellowColor"]){
        return [UIColor yellowColor];
    }else if ([colorStr isEqualToString:@"greenColor"]){
        return [UIColor greenColor];
    }else if ([colorStr isEqualToString:@"cyanColor"]){
        return [UIColor cyanColor];
    }else if ([colorStr isEqualToString:@"blueColor"]){
        return [UIColor blueColor];
    }else if ([colorStr isEqualToString:@"purpleColor"]){
        return [UIColor purpleColor];
    }else if ([colorStr isEqualToString:@"whiteColor"]){
        return [UIColor whiteColor];
    }else if ([colorStr isEqualToString:@"blackColor"]){
        return [UIColor blackColor];
    }else if ([colorStr isEqualToString:@"grayColor"]){
        return [UIColor grayColor];
    }
    return 0;
}
-(void)dealloc{
    [[NSNotificationCenter  defaultCenter] removeObserver:self  name:@"clear" object:nil];
}
@end
