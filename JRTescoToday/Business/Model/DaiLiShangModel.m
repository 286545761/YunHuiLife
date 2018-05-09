//
//  DaiLiShangModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "DaiLiShangModel.h"

@implementation DaiLiShangModel
- (id)initWithDict:(NSDictionary *)dic
{
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];
    _name=[NSString stringWithFormat:@"%@", dic[@"name"]];
    return self;
    
}
@end
