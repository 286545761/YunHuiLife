//
//  ShrinkModel.m
//  XFAppliance
//
//  Created by hduokeji on 16/4/18.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "ShrinkModel.h"

@implementation ShrinkModel
- (id)initWithDict:(NSDictionary *)dataDic
{
    _tagsName=dataDic[@"tagsName"];
    _tagsId=dataDic[@"tagsId"];
    
    
    return self;
}
@end
