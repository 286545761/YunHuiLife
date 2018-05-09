//
//  PingModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/13.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "PingModel.h"

@implementation PingModel
- (id)initWithDict:(NSDictionary *)dic
{
    _orderCode=[NSString stringWithFormat:@"%@", dic[@"orderCode"]];;;
    _time=[NSString stringWithFormat:@"%@", dic[@"time"]];;;
     _realAmount=[NSString stringWithFormat:@"%@", dic[@"realAmount"]];;;
     _userImg=[NSString stringWithFormat:@"%@", dic[@"userImg"]];;;
     _userPhone=[NSString stringWithFormat:@"%@", dic[@"userPhone"]];;;
      _merchantImg=[NSString stringWithFormat:@"%@", dic[@"merchantImg"]];;;
      _merchantName=[NSString stringWithFormat:@"%@", dic[@"merchantName"]];;;
     _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];;;
     _isComment=[NSString stringWithFormat:@"%@", dic[@"isComment"]];;;
     _merchantId=[NSString stringWithFormat:@"%@", dic[@"merchantId"]];;;
    return self;
    
}
@end
