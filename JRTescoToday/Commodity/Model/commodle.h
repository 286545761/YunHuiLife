//
//  commodle.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/13.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "activityModel.h"

@interface commodle : NSObject
@property(nonatomic,copy)NSString* category;
@property(nonatomic,copy)NSString* distance;
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* mainImageUrl;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* praise;
@property(nonatomic,copy)NSString* streetName;
@property(nonatomic,copy)NSString* remarks;
@property(nonatomic,copy)NSArray* twoCategoryList;
// 分数
@property(nonatomic,copy)NSString*grade;
@property(nonatomic,copy)activityModel* acModel;// 活动列表
- (id)initWithDict:(NSDictionary *)dic;

@end
