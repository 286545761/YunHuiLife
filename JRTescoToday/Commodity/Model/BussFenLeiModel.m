//
//  BussFenLeiModel.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/25.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "BussFenLeiModel.h"

@implementation BussFenLeiModel
- (id)initWithDict:(NSDictionary *)dic
{

    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];
    _merchantId=[NSString stringWithFormat:@"%@", dic[@"merchantId"]];;
    _name=[NSString stringWithFormat:@"%@", dic[@"name"]];;;
   
    return self;
    
}
@end
