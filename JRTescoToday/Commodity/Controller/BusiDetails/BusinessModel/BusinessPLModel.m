//
//  BusinessPLModel.m
//  XFAppliance
//
//  Created by hduokeji on 16/4/26.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "BusinessPLModel.h"

@implementation BusinessPLModel
- (id)initWithDict:(NSDictionary *)dataDic
{
    
    _com_img_url=[[NSArray alloc] init];
    _user_img=dataDic[@"user_img"];
    _user_id=dataDic[@"user_id"];
    _com_date=dataDic[@"com_date"];
    
         _com_img_url=dataDic[@"com_img_url"];
   
   
    _com_id=dataDic[@"com_id"];
    _com_content=dataDic[@"com_content"];
    _user_name=dataDic[@"user_name"];
    return self;
}
@end
