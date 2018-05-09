//
//  ShangpingModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/15.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShangpingModel.h"

@implementation ShangpingModel
- (id)initWithDict:(NSDictionary *)dic
{
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];;
    _descp=[NSString stringWithFormat:@"%@", dic[@"descp"]] ;
    _goodsName=[NSString stringWithFormat:@"%@", dic[@"goodsName"]];
    _goodsPrice=[NSString stringWithFormat:@"%@", dic[@"goodsPrice"]];;
    _mainImage=[NSString stringWithFormat:@"%@", dic[@"mainImage"]];;;
    _standard=[NSString stringWithFormat:@"%@", dic[@"standard"]];;
    _categoryName=[NSString stringWithFormat:@"%@", dic[@"categoryName"]];
       _categoryId=[NSString stringWithFormat:@"%@", dic[@"categoryId"]];
    return self;
    
}
@end
