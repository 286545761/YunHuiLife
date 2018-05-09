//
//  JRProductCatogryModel.m
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRProductCatogryModel.h"
#import "MJExtension.h"
@implementation JRProductCatogryModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"titleName" : @"name",@"ID" : @"id"};
}

@end
