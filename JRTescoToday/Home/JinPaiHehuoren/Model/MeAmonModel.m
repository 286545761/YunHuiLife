//
//  MeAmonModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/12.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "MeAmonModel.h"

@implementation MeAmonModel
- (id)initWithDict:(NSDictionary *)dic
{
    _amount=[NSString stringWithFormat:@"%@",dic[@"amount"]];
    _day=[NSString stringWithFormat:@"%@",dic[@"day"]];
    _endTime=[NSString stringWithFormat:@"%@",dic[@"endTime"]];
    _idn=[NSString stringWithFormat:@"%@",dic[@"id"]];
    _name=[NSString stringWithFormat:@"%@",dic[@"name"]];
    _startTime=[NSString stringWithFormat:@"%@",dic[@"startTime"]];
    _status=[NSString stringWithFormat:@"%@",dic[@"status"]];
    return self;
    
}
@end
