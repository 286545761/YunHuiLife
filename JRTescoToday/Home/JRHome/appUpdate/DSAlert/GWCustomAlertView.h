//
//  GWCustomAlertView.h
//  GW
//
//  Created by apple on 16/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWCustomAlertView : UIView
+ (instancetype)makeViewWithFrame:(CGRect)frame Title:(NSString *)title Contain:(NSString*)contain buttonTitles:(NSArray *)buttonTitles buttonBlock:(void (^)(NSInteger))block;

@end
