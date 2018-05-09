//
//  UIButton+DH.h
//  DHInvestment
//
//  Created by JJS on 15/9/2.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DH)

//+ (UIButton *)buttonWihtTitle:(NSString *)titile setButtonX:(CGFloat)x setButtonY:(CGFloat)y;


#pragma mark 创建带有文字和图片的按钮
+ (UIButton *)buttonWithTitle:(NSString *)title normalImg:(NSString *)normalImgName selectedImg:(NSString *)selectedImgName
                    normalColor:(NSString *)normalColor selectedColor:(NSString *)selectedColor font:(CGFloat)titleFont;

- (UIButton *)buttonWithTitle:(NSString *)title normalImg:(NSString *)normalImgName selectedImg:(NSString *)
selectedImgName normalColor:(NSString *)normalColor selectedColor:(NSString *)selectedColor font:(CGFloat)titleFont;


#pragma mark 弹出提示信息
//+ (void)alertViewWithAlertTitle:(NSString *)alerTitle controller:(UIViewController *)controller;

@end
