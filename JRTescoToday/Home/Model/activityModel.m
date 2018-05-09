//
//  activityModel.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/28.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "activityModel.h"

@implementation activityModel
-(id)initWithDict:(NSDictionary *)dataDic{
    if ([[NSString stringWithFormat:@"%@",dataDic[@"type"]] isEqualToString:@"1"]) {// 满减
        
    }else if ([[NSString stringWithFormat:@"%@",dataDic[@"type"]] isEqualToString:@"2"]){// 打折
        
        
    }else{
        
        
    }
    

    
   
    return self;
}
@end
