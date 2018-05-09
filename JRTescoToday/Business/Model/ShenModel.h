//
//  ShenModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShenModel : NSObject

@property(nonatomic,copy)NSString*  shopName;

- (id)initWithDict:(NSDictionary *)dic;
@end
