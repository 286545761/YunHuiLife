//
//  BusinDiZiModel.m
//  XFAppliance
//
//  Created by hduokeji on 16/4/29.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "BusinDiZiModel.h"

@implementation BusinDiZiModel
- (id)initWithDict:(NSDictionary *)dataDic
{
    _m_tel=dataDic[@"m_tel"];
    _m_workdate=dataDic[@"m_workdate"];
    _longitude=dataDic[@"longitude"];
    _latitude=dataDic[@"latitude"];
    _m_address=dataDic[@"m_address"];
     _m_id=dataDic[@"m_id"];
     _m_name=dataDic[@"m_name"];
    return self;
}
@end
