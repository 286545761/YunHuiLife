//
//  PingLunModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PingLunModel : NSObject
@property(nonatomic,copy)NSString* shopId;
@property(nonatomic,copy)NSString*  shopName;
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* commentType;
@property(nonatomic,copy)NSString* commentTimeStr;
@property(nonatomic,copy)NSString* commentInfo;
@property(nonatomic,copy)NSString* commentGrade;
@property(nonatomic,copy)NSString* shopImg;
@property(nonatomic,copy)NSString* userId;
@property(nonatomic,copy)NSString* userName;
- (id)initWithDict:(NSDictionary *)dic;
@end
