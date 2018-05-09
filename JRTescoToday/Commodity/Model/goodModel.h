//
//  goodModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface goodModel : NSObject
@property(nonatomic,copy)NSString* descp;
@property(nonatomic,copy)NSString* goodsPrice;
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* mainImage;
@property(nonatomic,copy)NSString* standard;

- (id)initWithDict:(NSDictionary *)dic;
@end
