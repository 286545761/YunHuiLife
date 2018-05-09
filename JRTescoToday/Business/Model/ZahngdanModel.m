//
//  ZahngdanModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ZahngdanModel.h"

@implementation ZahngdanModel
- (id)initWithDict:(NSDictionary *)dic
{
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];;
    _month=[NSString stringWithFormat:@"%@", dic[@"month"]] ;
    _tradeAmount=[NSString stringWithFormat:@"%@", dic[@"tradeAmount"]];
    _tradeCategory=[NSString stringWithFormat:@"%@", dic[@"tradeCategory"]];;
    _tradeRemark=[NSString stringWithFormat:@"%@", dic[@"tradeRemark"]];;;
    _tradeTime=[NSString stringWithFormat:@"%@", dic[@"tradeTime"]];;
    
    return self;
    
}
@end
