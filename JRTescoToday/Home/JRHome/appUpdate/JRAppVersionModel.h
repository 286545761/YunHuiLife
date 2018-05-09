//
//  JRAppVersionModel.h
//  JRTescoToday
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRAppVersionModel : NSObject
//"appName": "string",
//"id": "string",
//"isEnable": false,
//"isForce": false,
//"isNew": false,
//"publishTime": "2017-11-07 09:41:06",
//"publishUser": "云惠生活",
//"type": 0,
//"updateInfo": "更新个人账户，更新新手指南，更新消息中心，更新信息披露",
//"versionId": "1.0",
//"versionUrl": "string"
@property (nonatomic, copy) NSString *updateInfo;   // 描述 ---> 内容提要
@property (nonatomic ,copy) NSString *isNew;             //是否提示更新
@property (nonatomic, copy) NSString * isForce;
/*
 *需要更新的链接
 */
@property(copy,nonatomic)NSString *versionUrl;
//是否强制更新
+ (instancetype)appVersionModelWithResultDict:(NSDictionary *)dict;
@end
