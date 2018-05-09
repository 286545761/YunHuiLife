//
//  JinPanHeHuoRenModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/12.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JinPanHeHuoRenModel : NSObject
@property(nonatomic ,strong)NSString *name;
@property(nonatomic ,strong)NSString *day;
@property(nonatomic ,strong)NSString *idn;
@property(nonatomic ,strong)NSString *maxRate;
@property(nonatomic ,strong)NSString *minRate;
@property(nonatomic ,strong)NSString *increaseAmount;
@property(nonatomic ,strong)NSString *itAmount;
- (id)initWithDict:(NSDictionary *)dic;
@end
