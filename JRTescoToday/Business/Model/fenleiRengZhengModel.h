//
//  fenleiRengZhengModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface fenleiRengZhengModel : NSObject
@property(nonatomic,copy)NSString*  shopName;
@property(nonatomic,copy)NSString*  shopid;
- (id)initWithDict:(NSDictionary *)dic;
@end
