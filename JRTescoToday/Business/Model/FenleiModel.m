//
//  FenleiModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "FenleiModel.h"

@implementation FenleiModel
- (id)initWithDict:(NSDictionary *)dic
{
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];;
    _level=[NSString stringWithFormat:@"%@", dic[@"level"]] ;
    _merchantId=[NSString stringWithFormat:@"%@", dic[@"merchantId"]];
    _name=[NSString stringWithFormat:@"%@", dic[@"name"]];;
    _parentId=[NSString stringWithFormat:@"%@", dic[@"parentId"]] ;
    _time=[NSString stringWithFormat:@"%@", dic[@"time"]];
    return self;
    
}
@end
