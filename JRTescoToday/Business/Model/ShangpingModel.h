//
//  ShangpingModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/15.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShangpingModel : NSObject
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* categoryId;
@property(nonatomic,copy)NSString* descp;
@property(nonatomic,copy)NSString* goodsName;
@property(nonatomic,copy)NSString* goodsPrice;
@property(nonatomic,copy)NSString* mainImage;
@property(nonatomic,copy)NSString* categoryName;
@property(nonatomic,copy)NSString* standard;
- (id)initWithDict:(NSDictionary *)dic;
@end
