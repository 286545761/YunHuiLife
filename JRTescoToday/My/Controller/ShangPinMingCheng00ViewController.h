//
//  ShangPinMingCheng00ViewController.h
//  JRTescoToday
//
//  Created by 123 on 2018/1/29.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "activityModel.h"
@interface ShangPinMingCheng00ViewController : UIViewController
@property(nonatomic ,copy)NSString *strbtn;// 商品ID
@property(nonatomic ,copy)NSString *strbtn1;// 图片
@property(nonatomic ,copy)NSString *strbtn2;// // 原价 价格
@property(nonatomic ,copy)NSString *strbtn3;// 店名
@property(nonatomic ,copy)NSString *strbtn4;// 原价格
@property(nonatomic ,copy)NSString *theStoreID;// 商铺编码
@property(nonatomic ,copy)NSString *theStoreNewID;//商铺ID
@property(nonatomic,copy)NSString *theOriginalPrice;// 原单价
@property(nonatomic,copy)NSString *orderType;
//1团购2优惠买单
/*
 *<# #>
 */
@property(strong,nonatomic)activityModel *acModel;
@end
