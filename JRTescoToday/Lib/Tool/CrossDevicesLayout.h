//
//  CrossDevicesLayout.h
//  GW
//
//  Created by 艾呦呦 on 16/04/23.
//  Copyright © 2016年 apple. All rights reserved.
//  跨设备的尺寸转换

#ifndef CrossDevicesLayout_h
#define CrossDevicesLayout_h

//iphoneX       375 x 812
#define KiphoneXStatusBar                   (44.0f)
#define KiphoneXNavBar                      (44.0f)
#define KiphoneXTableBar                    (49.0f)
#define KiphoneXHomeBar                     (34.0f)
#define KiphoneXHeader                      (88.0f)
#define KiphoneXFooter                      (83.0f)
#define KiphoneXWidth                       (375.0f)
#define KiphoneXHeight                      (812.0f)


#define NAV_BAR [UIScreen mainScreen].bounds.size.height == 812 ? 88 : 64
#define TAB_BAR [UIScreen mainScreen].bounds.size.height == 812 ? 83 : 49
#define STATUS_BAR [UIScreen mainScreen].bounds.size.height == 812 ? 44 : 24

#define KiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define KUITableViewFrame ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGRectMake(0, 88, kScreenWidth, kScreenHeight - 88 - 83) : CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64 - 49))


// 设计屏幕尺寸 iPhone6
#define kDesignWidth                        (375.0f)
#define kDesignHeight                       (667.0f)

// 当前主屏幕尺寸
#define kScreenWidth                        [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                       [[UIScreen mainScreen] bounds].size.height

// 缩放因子 (当前屏幕宽高与设计屏幕宽高比)
#define kHorizontalScaleFactor              (kScreenWidth / kDesignWidth)
#define kVerticalScaleFactor                (kScreenHeight / kDesignHeight)

// 传入设计图上的数值 转换成跨设备的数值(向下取浮点数)
#define CGCrossDevicesX(x)                  floorf(x * kHorizontalScaleFactor)
#define CGCrossDevicesY(y)                  floorf(y * kVerticalScaleFactor)
#define CGCrossDevicesWidth(w)              floorf(w * kHorizontalScaleFactor)
#define CGCrossDevicesHeight(h)             floorf(h * kVerticalScaleFactor)
#define CGCrossDevicesPointMake(x, y)       CGPointMake(CGCrossDevicesX(x), CGCrossDevicesY(y))
#define CGCrossDevicesSizeMake(w, h)        CGSizeMake(CGCrossDevicesWidth(w), CGCrossDevicesHeight(h))
// 由于开发中的坐标原点不确定,所以设置 frame 时,使用 CGRectMake(x, y, w, h), 根据需求对其中的数值进行跨设备转换


#endif /* CrossDevicesLayout_h */
