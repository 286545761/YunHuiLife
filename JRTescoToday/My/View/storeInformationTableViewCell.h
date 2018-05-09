//
//  storeInformationTableViewCell.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/30.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//订单详情  店铺信息

#import <UIKit/UIKit.h>
#import "JRBusinessOrderModel.h"

@interface storeInformationTableViewCell : UITableViewCell
/*
 *<# #>
 */
@property(strong,nonatomic)JRBusinessOrderModel *model;
/*
 *
 */
@property(copy,nonatomic)void (^phoneCallBlock)();
@end
