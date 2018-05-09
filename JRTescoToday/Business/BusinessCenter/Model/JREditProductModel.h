//
//  JREditProductModel.h
//  JRTescoToday
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JREditProductModel : NSObject
/**
"data": {
 "id": "9ca517e2-d5b5-11e7-aac6-ecf4bbbf8260",
 "mainImage": "http://jyegou.oss-cn-beijing.aliyuncs.com/test/GC20170913132600011512115228649.jpg",
 "name": "商品名称1,测试测试123456",
 "descp": "描述描述描述描述描述描述,测试测试测试",
 "goodsPrice": 168,
 "originalPrice": 1680,
 "merchantName": "rfff",
 "merchantPhone": "ddd",
 "address": "丰台区ddd",
 "goodsCategoryId": "d4365b51-ca77-11e7-aac6-ecf4bbbf8260,1abac9ef-b2fa-11e7-8afd-1051721c39fe",
 */
@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *mainImage;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *descp;
@property (nonatomic, copy)NSString *goodsPrice;
@property (nonatomic, copy)NSString *originalPrice;
@property (nonatomic, copy)NSString *merchantName;
@property (nonatomic, copy)NSString *merchantPhone;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *goodsCategoryId;
@property (nonatomic, copy)NSString *categoryName;
@property (nonatomic, strong)NSMutableArray *goodsLabels;
@end
