//
//  UIButton+DH.m
//  DHInvestment
//
//  Created by JJS on 15/9/2.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

// 选项卡中按钮的宽高以及字体大小 

#import "UIButton+DH.h"

#define kBtnFontSize 15

@implementation UIButton (DH)

#pragma mark 创建按钮
//+ (UIButton *)buttonWihtTitle:(NSString *)titile setButtonX:(CGFloat)x setButtonY:(CGFloat)y
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:titile forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:kBtnFontSize];
//    button.titleLabel.textAlignment = NSTextAlignmentCenter;
//    [button setTitleColor:[UIColor colorWithHexString:@"#8e8e93"] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor colorWithHexString:@"#ffa103"] forState:UIControlStateSelected];
//    [button setTitleColor:[UIColor colorWithHexString:@"#ffa103"] forState:UIControlStateHighlighted];
//    
//    
//    if(iPhone4){
//        button.frame = CGRectMake(x, y, kBtnWidth , kBtnHeight);
//    }else{
//        button.frame = CGRectMake(x, y, 80 , 50);
//    }
//    return button;
//}


+ (UIButton *)buttonWithTitle:(NSString *)title normalImg:(NSString *)normalImgName selectedImg:(NSString *)
            selectedImgName normalColor:(NSString *)normalColor selectedColor:(NSString *)selectedColor font:(CGFloat)titleFont
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageNamed:normalImgName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateHighlighted];
    
    [button setTitle:title forState:UIControlStateNormal];
    
     button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    [button setTitleColor:[UIColor colorWithHexString:normalColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:selectedColor] forState:UIControlStateHighlighted];
    
    
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return button;
}

- (UIButton *)buttonWithTitle:(NSString *)title normalImg:(NSString *)normalImgName selectedImg:(NSString *)
selectedImgName normalColor:(NSString *)normalColor selectedColor:(NSString *)selectedColor font:(CGFloat)titleFont
{
    return [self buttonWithTitle:title normalImg:normalImgName selectedImg:selectedImgName normalColor:normalColor selectedColor:selectedColor font:titleFont];;
}


#pragma mark 覆盖父类设置高亮的方法
- (void)setHighlighted:(BOOL)highlighted {
}


#pragma mark 提示信息
+ (void)alertViewWithAlertTitle:(NSString *)alerTitle controller:(UIViewController *)controller
{
    // 1.创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.enabled = NO;
    btn.adjustsImageWhenDisabled = NO;
    
    btn.backgroundColor = [UIColor blackColor];
    CGFloat w = kScreenSize.width;
    CGFloat h = 35;
    btn.frame = CGRectMake(0, 30, w, h);
    
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:alerTitle forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    
    // 2.开始执行动画
    CGFloat duration = 0.7f;
    
    // 添加到导航上面
    [controller.navigationController.view insertSubview:btn belowSubview:controller.navigationController.navigationBar];
    
    [UIView animateWithDuration:duration animations:^{ // 下来
        btn.transform = CGAffineTransformMakeTranslation(0, h);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.5f options:UIViewAnimationOptionCurveLinear animations:^{// 上去
            btn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [btn removeFromSuperview];
        }];
    }];
}

@end
