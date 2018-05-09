//
//  BussFenLeiModel.h
//  JRTescoToday
//
//  Created by 123 on 2018/1/25.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BussFenLeiModel : NSObject
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* level;
@property(nonatomic,copy)NSString* merchantId;
@property(nonatomic,copy)NSString* name;

- (id)initWithDict:(NSDictionary *)dic;
@end
