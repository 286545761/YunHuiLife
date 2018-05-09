//
//  TiXianModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/16.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TiXianModel : NSObject
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* merchantAddress;
@property(nonatomic,copy)NSString* merchantCategoryName;
@property(nonatomic,copy)NSString* merchantId;
@property(nonatomic,copy)NSString* merchantImg;
@property(nonatomic,copy)NSString* merchantName;

- (id)initWithDict:(NSDictionary *)dic;
@end
