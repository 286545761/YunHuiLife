//
//  activityModel.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/28.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//  活动

#import <Foundation/Foundation.h>

@interface activityModel : NSObject
@property(nonatomic,strong)NSString * atDiscounttypeString;// 打折
@property(nonatomic,strong)NSString *atDiscountactivityString;//打折内容
@property(nonatomic,strong)NSString *fullReductiontypeString;// 满减
@property(nonatomic,strong)NSString *fullReductioncativityString;//满减内容
- (id)initWithDict:(NSDictionary *)dataDic;

@end
