//
//  JRBusinessOrderCore.h
//  JRTescoToday
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRBusinessOrderModel.h"

typedef NS_ENUM(NSInteger, OrderList_Type) {
    OrderList_Type_ALL = 0,//全部
    OrderList_Type_NoPay = 1,//待付款
    OrderList_Type_Payed = 2 //已付款
};

typedef void (^SuccessedBlock)(NSDictionary *data);
typedef void (^FaildBlock)(NSString *erro);

@interface JRBusinessOrderCore : NSObject
//   /merchant/users/orders/{id}

/**
 * 商户获取订单列表
 */
+ (void)queryBusinessOrderListWithType:(NSInteger)type PageNum:(NSInteger)pageNum AndPageSize:(NSInteger)pageSize Successed:(SuccessedBlock)success Faild:(FaildBlock)faild;

/**
 * 商户获取订单详情
 */
+ (void)queryBusineesOrderDetailWithID:(NSString *)ID Successed:(SuccessedBlock)success Faild:(FaildBlock)faild;

@end
