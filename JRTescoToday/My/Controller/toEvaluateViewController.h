//
//  toEvaluateViewController.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/29.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
// 去评价

#import <UIKit/UIKit.h>

@interface toEvaluateViewController : BaseController





/*
 *<# #>
 */
@property(copy,nonatomic)void(^EvaluateBlock)();
/*
 *标题
 */
@property(copy,nonatomic)NSString *titleString;// 标题
/*
 *金额
 */
@property(copy,nonatomic)NSString *OrderAmountString;
/*
 *图片链接
 */
@property(copy,nonatomic) NSString*iconURLString;
/*
 *订单编号
 */
@property(copy,nonatomic)NSString *OrderNo;




@end
