//
//  UIBarButtonItem+DH.m
//  DHInvestment
//
//  Created by JJS on 15/9/7.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "UIBarButtonItem+DH.h"

@implementation UIBarButtonItem (DH)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image higlightedImage:(NSString *)higlightedImage target:(id)target action:(SEL)action
{
    // 1.创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置按钮背景图片
    UIImage *normal = [UIImage imageNamed:image];
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    
    // 3.设置按钮的尺寸
    btn.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
    
    // 4.监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 5.返回创建好的item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
