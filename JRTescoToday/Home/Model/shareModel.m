//
//  shareModel.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/15.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "shareModel.h"

@implementation shareModel
- (id)initWithDict:(NSDictionary *)dataDic
{
    _introduction=dataDic[@"introduction"];
    _title=dataDic[@"title"];
    _imageUrl=dataDic[@"imageUrl"];
    _url=dataDic[@"url"];
    return self;
}
@end
