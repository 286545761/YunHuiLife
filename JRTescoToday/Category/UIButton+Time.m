//
//  UIButton+Time.m
//  GW
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIButton+Time.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>



@implementation UIButton (Time)
static char StopSignKey;//类似于一个中转站,参考

- (void)setStopSign:(NSString *)stopSign{
    objc_setAssociatedObject(self, &StopSignKey, stopSign, OBJC_ASSOCIATION_COPY_NONATOMIC);

}
- (NSString *)stopSign{
    return objc_getAssociatedObject(self, &StopSignKey);

}

- (void)captchaTimeNumer:(NSNumber *)timeNumber{
    DLog(@"captchaTimeNumer");
    if([self.stopSign isEqualToString:@"stop"]){
        [self setTitle:@"发送验证码" forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        return;
    }
    
    if([timeNumber isEqual:@0]){
        [self setTitle:@"发送验证码" forState:UIControlStateNormal];
//        self.enabled = YES;
        self.userInteractionEnabled = YES;
    }else{
        DLog(@"%@",[NSString stringWithFormat:@"%@秒",timeNumber]);
        [self setTitle:[NSString stringWithFormat:@"%@秒",timeNumber] forState:UIControlStateNormal];
        NSNumber * second  = [NSNumber numberWithInt:[timeNumber intValue] - 1];
        [self performSelector:@selector(captchaTimeNumer:) withObject:second afterDelay:1];
//        self.enabled = NO;
        self.userInteractionEnabled = NO;
    }
}


-(void)defaultStyleWithNormalTitleColor:(UIColor *)titleColor andHighTitleColor:(UIColor *)highTitleColor andBorderColor:(UIColor *)borderColor andBackgroundColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor andSelectedBgColor:(UIColor *)selectedBgColor withcornerRadius:(CGFloat)cornerRadius{
    [self bootstrapStyle:cornerRadius];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:highTitleColor forState:UIControlStateHighlighted];
    [self setTitleColor:highTitleColor forState:UIControlStateSelected];
    self.layer.borderColor = [borderColor CGColor];
    [self setBackgroundImage:[self buttonImageFromColor:bgColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:highBgColor] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:selectedBgColor] forState:UIControlStateSelected];
}

-(void)bootstrapStyle:(CGFloat)cornerRadius{
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [self.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:self.titleLabel.font.pointSize]];
}
- (UIImage *) buttonImageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
