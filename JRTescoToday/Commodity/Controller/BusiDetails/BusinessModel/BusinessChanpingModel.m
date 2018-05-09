//
//  BusinessChanpingModel.m
//  XFAppliance
//
//  Created by hduokeji on 16/4/26.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "BusinessChanpingModel.h"

@implementation BusinessChanpingModel
- (id)initWithDict:(NSDictionary *)dataDic
{
    _p_img_url=dataDic[@"p_img_url"];
    _is_save=dataDic[@"is_save"];
    _p_name=dataDic[@"p_name"];
    _p_log_url=dataDic[@"p_log_url"];
    _save_num=dataDic[@"save_num"];
    _p_id=dataDic[@"p_id"];
      _m_logo_url=dataDic[@"m_logo_url"];
    return self;
}
@end
