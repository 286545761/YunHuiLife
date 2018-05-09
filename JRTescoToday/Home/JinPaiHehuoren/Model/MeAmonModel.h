//
//  MeAmonModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/12.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeAmonModel : NSObject
@property(nonatomic,strong)NSString *amount;
@property(nonatomic,strong)NSString *day;
@property(nonatomic,strong)NSString *endTime;
@property(nonatomic,strong)NSString *idn;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *startTime;
@property(nonatomic,strong)NSString *status;
- (id)initWithDict:(NSDictionary *)dic;
@end
