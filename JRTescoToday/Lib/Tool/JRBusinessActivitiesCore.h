//
//  JRBusinessActivitiesCore.h
//  JRTescoToday
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, ActivitiesList_Type) {
    ActivitiesList_Type_ALL = 0,//全部
    ActivitiesList_NoPay = 1,//待付款
    OrderList_Type_Payed = 2 //已付款
};
typedef NS_ENUM(NSInteger, ActivitiesCenter_Type) {
    ActivitiesCenter_Type_PlatformActivity = 0,//平台活动
    ActivitiesCenter_Type_BusinnessActivity = 1,//商家活动
};

#import "JRBusinessActivitiesModel.h"
typedef void (^CompleteBlock)(NSDictionary *data);

typedef void (^SuccessedBlock)(JRBusinessActivitiesModel *data);
typedef void (^FaildBlock)(NSString *erro);

@interface JRBusinessActivitiesCore : NSObject
@property (nonatomic, assign)ActivitiesList_Type ListType;
/**
 * 商家活动列表
 */
+ (void)queryActivitiesCenter_BusinessActivitiesListWithType:(ActivitiesCenter_Type)type PageNum:(NSInteger)pageNum AndPageSize:(NSInteger)pageSize Successed:(CompleteBlock)success Faild:(FaildBlock)faild;
/**
 * 创建商家活动
 */

+ (void)queryActivitiesCenter_CreatBusinessActivitiesWithParam:(NSDictionary *)ParamDict Successed:(CompleteBlock)success Faild:(FaildBlock)faild;

/**
 * 更改活动状态
 */

+ (void)queryActivitiesCenter_ChangeBusinessActivitiesWithParam:(NSDictionary *)ParamDict Successed:(CompleteBlock)success Faild:(FaildBlock)faild;

@end
