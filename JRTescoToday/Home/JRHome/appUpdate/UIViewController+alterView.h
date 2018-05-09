//
//  UIViewController+alterView.h
//  JRTescoToday
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRAppVersionModel.h"
@interface UIViewController (alterView)
- (void)showAppUpdateAlterViewWith:(JRAppVersionModel *)model;
@end
