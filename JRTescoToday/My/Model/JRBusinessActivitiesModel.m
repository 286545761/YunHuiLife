//
//  JRBusinessActivitiesModel.m
//  JRTescoToday
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRBusinessActivitiesModel.h"
#import "MJExtension.h"
@implementation JRBusinessActivitiesModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID" : @"id",@"descriptions":@"description"};
}
@end
