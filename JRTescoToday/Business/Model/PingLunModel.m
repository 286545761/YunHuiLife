//
//  PingLunModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "PingLunModel.h"

@implementation PingLunModel
- (id)initWithDict:(NSDictionary *)dic
{
    
//phone: 15356055922,
//info: 记得记得接,
//grade: 3,
//time: 2018 - 03 - 30
    
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];;
    _commentGrade=[NSString stringWithFormat:@"%@", dic[@"grade"]] ;
    _commentTimeStr=[NSString stringWithFormat:@"%@", dic[@"time"]];
    _commentType=[NSString stringWithFormat:@"%@", dic[@"commentType"]];;
    _shopId=[NSString stringWithFormat:@"%@", dic[@"shopId"]] ;
    _shopImg=[NSString stringWithFormat:@"%@", dic[@"shopImg"]];
    _idn=[NSString stringWithFormat:@"%@", dic[@"shopName"]];;
     _commentInfo=[NSString stringWithFormat:@"%@", dic[@"info"]] ;
    _shopName=[NSString stringWithFormat:@"%@", dic[@"merchantId"]] ;
    _userId=[NSString stringWithFormat:@"%@", dic[@"userId"]];
       _userName=[NSString stringWithFormat:@"%@", dic[@"phone"]];
    return self;
    
}
@end
