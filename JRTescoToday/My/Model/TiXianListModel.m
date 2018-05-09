//
//  TiXianListModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/19.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "TiXianListModel.h"

@implementation TiXianListModel
- (id)initWithDict:(NSDictionary *)dic
{
    _amount=[NSString stringWithFormat:@"￥%@", dic[@"amount"]]  ;
    _fee=[NSString stringWithFormat:@"%@", dic[@"fee"]];
    _status=[NSString stringWithFormat:@"%@", dic[@"status"]];;
    _time=[NSString stringWithFormat:@"%@", dic[@"time"]];;

    
    return self;
    
}
@end
