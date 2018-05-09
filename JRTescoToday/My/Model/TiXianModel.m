//
//  TiXianModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/16.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "TiXianModel.h"

@implementation TiXianModel
- (id)initWithDict:(NSDictionary *)dic
{
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]]  ;
    _merchantAddress=[NSString stringWithFormat:@"%@", dic[@"merchantAddress"]];
    _merchantCategoryName=[NSString stringWithFormat:@"%@", dic[@"merchantCategoryName"]];;
    _merchantId=[NSString stringWithFormat:@"%@", dic[@"merchantId"]];;
    _merchantImg=[NSString stringWithFormat:@"%@", dic[@"merchantImg"]];;
    _merchantName=[NSString stringWithFormat:@"%@", dic[@"merchantName"]];;
    
    return self;
    
}
@end
