//
//  ConsumptionController.h
//  JRTescoToday
//
//  Created by 123 on 2017/8/25.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopPasswordView.h"
@interface ConsumptionController : BaseController<PopPasswordViewDelegate>

// 生成的订单编号
@property(nonatomic,strong) NSString *theOrderNumberString;
@property(nonatomic,strong) NSString *theStoreID;
@property(nonatomic,strong) NSString *theStoreCode;//商店编码
@property(nonatomic,strong) NSString *cgBUS;// 商品id
@property(nonatomic,strong) NSString *zhekou123;
@property(nonatomic,copy)NSString *nnnnn;// 订单的单价
@property(nonatomic,copy)NSString *theNumber;// 个数
@property(nonatomic,copy)NSString *theOriginalPrice;// 原单价
@property(nonatomic,strong) NSString *OrderType;// 订单类型 orderType (integer): 1团购2优惠买单
@property(nonatomic,retain)PopPasswordView *passwordView;
@property (weak, nonatomic) IBOutlet UIImageView *weixinimage;
@property (weak, nonatomic) IBOutlet UIImageView *zhifubaiimage;
@property (weak, nonatomic) IBOutlet UIImageView *qianbaoimage;
@property (weak, nonatomic) IBOutlet UIView *ssssss;
@end
