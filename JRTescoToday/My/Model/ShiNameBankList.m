//
//  ShiNameBankList.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/24.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShiNameBankList.h"

@implementation ShiNameBankList
- (id)initWithDict:(NSDictionary *)dic
{
    _bankCode=[NSString stringWithFormat:@"%@", dic[@"bankCode"]]  ;
    _bankName=[NSString stringWithFormat:@"%@", dic[@"bankName"]];
//    _status=[NSString stringWithFormat:@"%@", dic[@"status"]];;
//    _time=[NSString stringWithFormat:@"%@", dic[@"time"]];;
    
    
    return self;
    
}
@end
