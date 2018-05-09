//
//  UIBarButtonItem+DH.h
//  DHInvestment
//
//  Created by JJS on 15/9/7.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (DH)

#pragma mark 添加导航左右两边的按钮
+ (UIBarButtonItem *)itemWithImage:(NSString *)image higlightedImage:(NSString *)higlightedImage target:(id)target action:(SEL)action;

@end
