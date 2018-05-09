//
//  pingjiaXiangqingModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/19.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "pingjiaXiangqingModel.h"

@implementation pingjiaXiangqingModel
- (id)initWithDict:(NSDictionary *)dic
{
    _commentGrade=[NSString stringWithFormat:@"%@", dic[@"grade"]];
    _commentInfo=[NSString stringWithFormat:@"%@", dic[@"description"]];
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];
    _commentTimeStr=[NSString stringWithFormat:@"%@", dic[@"time"]];
    _commentType=[NSString stringWithFormat:@"%@", dic[@"commentType"]];
      _shopImg=[NSString stringWithFormat:@"%@", dic[@"image"]];
      _shopId=[NSString stringWithFormat:@"%@", dic[@"merchantId"]];
      _shopName=[NSString stringWithFormat:@"%@", dic[@"name"]];
      _ts=[NSString stringWithFormat:@"%@", dic[@"ts"]];
      _userId=[NSString stringWithFormat:@"%@", dic[@"userId"]];
    //_standard=[NSString stringWithFormat:@"%@", dic[@"standard"]];
    return self;
    
}
@end
