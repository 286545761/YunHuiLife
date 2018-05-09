//
//  ShenModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShenModel.h"

@implementation ShenModel
- (id)initWithDict:(NSDictionary *)dic
{
 
  
    _shopName=[NSString stringWithFormat:@"%@", dic[@"areaname"]] ;
  
    return self;
    
}
@end
