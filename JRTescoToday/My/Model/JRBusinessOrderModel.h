//
//  JRBusinessOrderModel.h
//  JRTescoToday
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRBusinessOrderModel : NSObject
@property (nonatomic, strong) NSString *amount; //订单总价
@property (nonatomic, strong) NSString *discountAmount; //折扣金额

@property (nonatomic, strong) NSString *goodsCount;//团购数量
@property (nonatomic, strong) NSString *goodsDescribe;//团购描述
@property (nonatomic, strong) NSString *goodsLabel;//团购标签
@property (nonatomic, strong) NSString *goodsValidityTime;//团购有效期
@property (nonatomic, strong) NSString *ID;//订单Id
@property (nonatomic, strong) NSString *merchantId;//商铺Id
@property (nonatomic, strong) NSString *orderCode;//1团购名称
@property (nonatomic, strong) NSString *orderName;//1团购2优惠买单  1团购名称 ,
@property (nonatomic, strong) NSString *orderType;//1团购2优惠买单 ,
@property (nonatomic, strong) NSString *realAmount;//团购价格
//订单状态 0待付款，1待消费，2已消费 待评价，-1失败，3已完成，-2申请取消-3已取消
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *time;//付款时间
@property (nonatomic, strong) NSString *merchantImg;// 商品图片
@property (nonatomic, strong) NSString *userPhone;//用户手机号
@property (nonatomic, strong) NSString *isComment;//用户手机号 是否评价（0未评价，1已评价）
@property (nonatomic, strong) NSString *merchantName;//商铺名称
@property (nonatomic, strong) NSString *rating;//商铺评分
@property (nonatomic, strong) NSString *useCode;//(string, optional): 1团购二维码
@property (nonatomic, strong) NSString *code;
// 商铺地址
@property (nonatomic, strong) NSString *merchantAddress;
// 商铺电话
@property (nonatomic, strong) NSString *merchantPhone;


@end
