//
//  JRBusinessInforModel.h
//  JRTescoToday
//
//  Created by apple on 2017/12/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRBusinessInforModel : NSObject

@property (nonatomic, copy) NSString *userName; //商家名称
@property (nonatomic, copy) NSString *imageName; //商家头像
@property (nonatomic, copy) NSString *authentivationState; //商家审核状态
@property (nonatomic, copy) NSString *authentivationStateName; //审核状态
@property (nonatomic, copy) NSString *stateImageName; //商家审核状态对应的图片
@property (nonatomic, assign) BOOL canEnable;
@property (nonatomic, copy) NSString *qrCodeNumber; //二维码
@property (nonatomic, copy) NSString *AccumulativeRewardAmount; //累计奖励
@property (nonatomic, copy) NSString *PurseBalanceAmount; //钱包余额
@property (nonatomic, copy) NSString *orderTodayAmount; //今日订单
@property (nonatomic, copy) NSString *isRealNameAuth; //实名认证
@property (nonatomic, copy) NSString *isSetupPayPassword; //设置支付密码

@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, copy) NSString *shareTitle;
@property (nonatomic, copy) NSString *shareImage;
@property (nonatomic, copy) NSString *shareIntroduction;



@end
