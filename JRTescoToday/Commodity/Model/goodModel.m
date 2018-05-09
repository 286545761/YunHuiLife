//
//  goodModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "goodModel.h"

@implementation goodModel
- (id)initWithDict:(NSDictionary *)dic
{
    _descp=[NSString stringWithFormat:@"%@", dic[@"descp"]];
    _goodsPrice=[NSString stringWithFormat:@"%@", dic[@"goodsPrice"]];
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];
    _mainImage=[NSString stringWithFormat:@"%@", dic[@"mainImage"]];
    _standard=[NSString stringWithFormat:@"%@", dic[@"standard"]];
    return self;
    
}
@end
