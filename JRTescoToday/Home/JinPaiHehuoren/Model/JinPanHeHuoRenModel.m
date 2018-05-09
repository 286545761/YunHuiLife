//
//  JinPanHeHuoRenModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/12.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JinPanHeHuoRenModel.h"

@implementation JinPanHeHuoRenModel
- (id)initWithDict:(NSDictionary *)dic
{
    _name=[NSString stringWithFormat:@"%@",dic[@"name"]];;
    _idn=[NSString stringWithFormat:@"%@",dic[@"id"]];;
    _maxRate=[NSString stringWithFormat:@"%@",dic[@"maxRate"]];
    _day=[NSString stringWithFormat:@"%@",dic[@"day"]];
    _minRate=[NSString stringWithFormat:@"%@",dic[@"minRate"]];
    
        _increaseAmount=[NSString stringWithFormat:@"%@",dic[@"increaseAmount"]];
        _itAmount=[NSString stringWithFormat:@"%@",dic[@"initAmount"]];
    return self;
    
}
@end
