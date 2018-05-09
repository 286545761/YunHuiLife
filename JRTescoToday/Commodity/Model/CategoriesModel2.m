//
//  CategoriesModel2.m
//  JRTescoToday
//
//  Created by 123 on 2017/12/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CategoriesModel2.h"

@implementation CategoriesModel2
- (id)initWithDict:(NSDictionary *)dic
{
    _count=[NSString stringWithFormat:@"%@", dic[@"count"]];
    _name=[NSString stringWithFormat:@"%@", dic[@"name"]];
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];
  _twoCategoryList=dic[@"twoCategoryList"];
    return self;
    
}
@end
