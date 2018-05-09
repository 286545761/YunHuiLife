//
//  JRManagerProductModel.m
//  JRTescoToday
//
//  Created by apple on 2017/12/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRManagerProductModel.h"
#import "MJExtension.h"
@implementation JRManagerProductModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID" : @"id"};
    
}
- (NSMutableArray *)goodsLabels{
    if(!_goodsLabels){
        _goodsLabels = [[NSMutableArray alloc] init];
    }
    return _goodsLabels;
}

@end
