//
//  JRBusinessCouponsModel.h
//  JRTescoToday
//
//  Created by apple on 2018/1/17.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRBusinessCouponsModel : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *merchantId;
@property (nonatomic, copy) NSString *goodsId;
@property (nonatomic, copy) NSString *goodsName;
@property (nonatomic, copy) NSString *goodsPrice;
@property (nonatomic, copy) NSString *dueTime;
@property (nonatomic, copy) NSString *validId;
@property (nonatomic, copy) NSString *validTime;
@property (nonatomic, copy) NSString *validChannel;


@end
