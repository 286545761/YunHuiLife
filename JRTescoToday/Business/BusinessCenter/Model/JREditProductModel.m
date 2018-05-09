//
//  JREditProductModel.m
//  JRTescoToday
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JREditProductModel.h"
#import "MJExtension.h"
@implementation JREditProductModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID" : @"id"};
    
}
- (NSMutableArray *)goodsLabels {
    if (!_goodsLabels) {
        _goodsLabels = [[NSMutableArray alloc] init];
    }
    return _goodsLabels;
}
@end
