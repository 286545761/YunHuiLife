//
//  CLLockInfoView.h
//  CoreLock
//
//  Created by 成林 on 15/4/27.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//  仅仅是做展示用

#import <UIKit/UIKit.h>
#define kLLBaseCircleNumber 10000       // tag基数（请勿修改）
#define kCircleMargin 45.0              // 圆点离屏幕左边距
#define kCircleDiameter 10.0            // 圆点直径
#define kLLCircleAlpha 1.0              // 圆点透明度
#define kLLLineWidth 4.0               // 线条宽
#define kLLLineColor [UIColor colorWithRed:77.0/255.0 green:76.0/255.0 blue:156.0/255.0 alpha:0.8] // 线条色蓝
#define kLLLineColorWrong [UIColor colorWithRed:201.0/255.0 green:9.0/255.0 blue:22.0/255.0 alpha:0.8] // 线条色红
@interface CLLockInfoView : UIView

@end
