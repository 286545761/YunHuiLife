//
//  FenLunModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "FenLunModel.h"

@implementation FenLunModel
- (id)initWithDict:(NSDictionary *)dic
{
    _amount=[NSString stringWithFormat:@"%@", dic[@"amount"]]  ;
    _time=[NSString stringWithFormat:@"%@", dic[@"time"]];
    _balance=[NSString stringWithFormat:@"%@", dic[@"balance"]];;
    _inviteName=[NSString stringWithFormat:@"%@", dic[@"inviteName"]];;
    _origin=[NSString stringWithFormat:@"%@", dic[@"origin"]];;
     _userType=[NSString stringWithFormat:@"%@", dic[@"userType"]];;
     _type=[NSString stringWithFormat:@"%@", dic[@"type"]];;
    return self;
    
}
@end
