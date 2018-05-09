//
//  JRAppVersionCore.h
//  JRTescoToday
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRAppVersionModel.h"
typedef void (^FailedBlock)(NSError *error);
typedef void (^SuccessBlock)(NSDictionary *dict);
typedef void (^CheckUpdateBlock)(JRAppVersionModel *appVersionModel, NSError *error);
@interface JRAppVersionCore : NSObject
+ (void)checkAppVerionForUpdate:(CheckUpdateBlock)updateBlock;
@end
