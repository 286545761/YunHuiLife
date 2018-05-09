//
//  FenleiModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FenleiModel : NSObject
@property(nonatomic,copy)NSString* level;
@property(nonatomic,copy)NSString*  merchantId;
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString* parentId;
@property(nonatomic,copy)NSString* time;
- (id)initWithDict:(NSDictionary *)dic;
@end
