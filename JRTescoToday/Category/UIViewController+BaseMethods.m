//
//  UIViewController+BaseMethods.m
//  JRTescoToday
//
//  Created by apple on 2018/1/18.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "UIViewController+BaseMethods.h"
#import "UIImage+ImageColor.h"
@implementation UIViewController (BaseMethods)
- (void)setNavgationBackgroundColor:(UIColor *)color andTitleColor:(UIColor *)titleColor {
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:titleColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
    [self.navigationController.navigationBar setBarTintColor:RGB(252, 199, 46)];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
}
@end