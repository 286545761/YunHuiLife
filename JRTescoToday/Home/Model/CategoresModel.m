//
//  CategoresModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/12/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CategoresModel.h"

@implementation CategoresModel
- (id)initWithDict:(NSDictionary *)dataDic
{
    _tagsName=dataDic[@"name"];
    _tagsId=dataDic[@"id"];
    _img=dataDic[@"img"];
    
    return self;
}
@end
