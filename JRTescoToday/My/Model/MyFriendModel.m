//
//  MyFriendModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/12.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "MyFriendModel.h"

@implementation MyFriendModel
- (id)initWithDict:(NSDictionary *)dic
{
//    _phone=dic[@"endInterestDate"];
//    _time=dic[@"investmentAmount"];
    _phone=[NSString stringWithFormat:@"%@", dic[@"phone"]]  ;
    _time=[NSString stringWithFormat:@"%@", dic[@"time"]];
    return self;
    
}
@end
