//
//  JRBusinessActivitiesModel.h
//  JRTescoToday
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRBusinessActivitiesModel : NSObject

@property (nonatomic, copy) NSString *amount;//满减(减xxx)
@property (nonatomic, copy) NSString *createTime;//活动创建时间
@property (nonatomic, copy) NSString *descriptions;//活动介绍
@property (nonatomic, copy) NSString *endTime;//活动结束时间
@property (nonatomic, copy) NSString *ID;//
@property (nonatomic, copy) NSString *merchantId;//商户id
@property (nonatomic, copy) NSString *minAmount;//满减(满xxx)
@property (nonatomic, copy) NSString *name;//商户名称
@property (nonatomic, copy) NSString *rebate;//折扣
@property (nonatomic, copy) NSString *startTime;//活动开始时间
@property (nonatomic, copy) NSString *status;//状态(1：进行中，2：已终止)
@property (nonatomic, copy) NSString *type;//类型:1,满减 2,折扣


@end
