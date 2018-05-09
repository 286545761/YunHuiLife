//
//  fenleiRengZhengModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "fenleiRengZhengModel.h"

@implementation fenleiRengZhengModel
- (id)initWithDict:(NSDictionary *)dic
{
    

        _shopName=[NSString stringWithFormat:@"%@", dic[@"name"]] ;
        _shopid=[NSString stringWithFormat:@"%@", dic[@"id"]] ;

   
    return self;
    
}
@end
