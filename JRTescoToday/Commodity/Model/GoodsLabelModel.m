//
//  GoodsLabelModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/12/6.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "GoodsLabelModel.h"

@implementation GoodsLabelModel
- (id)initWithDict:(NSDictionary *)dic
{
    _content=[NSString stringWithFormat:@"%@", dic[@"content"]];
//    _name=[NSString stringWithFormat:@"%@", dic[@"name"]];
//    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];
//    _twoCategoryList=dic[@"twoCategoryList"];
    return self;
    
}
@end
