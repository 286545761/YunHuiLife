//
//  checkTheVolumeSizeViewController.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/30.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//  查看卷码支付

#import <UIKit/UIKit.h>

@interface checkTheVolumeSizeViewController : UIViewController
/*
 *名字
 */
@property(copy,nonatomic)NSString *nameString;
/*
 *有效期
 */
@property(copy,nonatomic)NSString *timeString;
/*
 *数字串
 */
@property(copy,nonatomic)NSString *codeNoString;
// 二维码串
@property(copy,nonatomic)NSString *useCodeString;

// 订单号
@property(copy,nonatomic)NSString *theOrderNumberString;

// 订单号
@property(copy,nonatomic)NSString *goodsID;
// 订单号
@property(copy,nonatomic)NSString *orderStaute;


@end
