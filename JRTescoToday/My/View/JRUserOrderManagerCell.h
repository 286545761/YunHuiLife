//
//  JRUserOrderManagerCell.h
//  JRTescoToday
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRBusinessOrderModel.h"
@interface JRUserOrderManagerCell : UITableViewCell

// 取消订单
typedef void (^cancelTheOrderBlock)(NSInteger index);
// 去评价 或者  二维码
//typedef void (^evaluationOrQrCodeBlock)(NSString *typeString);
@property(copy,nonatomic)void (^cancelTheOrderBlock)(NSInteger index);
@property(copy,nonatomic)void (^evaluationOrQrCodeBlock)(NSString *typeString,NSInteger index);//0 去评价 1 二维码支付
@property(assign,nonatomic)NSInteger indexRow;
-(void)setUpData:(JRBusinessOrderModel *)model;

@end
