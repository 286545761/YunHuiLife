//
//  ZahngdanModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZahngdanModel : NSObject
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* month;
@property(nonatomic,copy)NSString* tradeAmount;
@property(nonatomic,copy)NSString* tradeCategory;
@property(nonatomic,copy)NSString* tradeRemark;
@property(nonatomic,copy)NSString* tradeTime;
- (id)initWithDict:(NSDictionary *)dic;
@end
