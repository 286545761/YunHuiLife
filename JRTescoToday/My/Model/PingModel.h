//
//  PingModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/13.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PingModel : NSObject
@property(nonatomic,copy)NSString* orderCode;
@property(nonatomic,copy)NSString* realAmount;
@property(nonatomic,copy)NSString* time;
@property(nonatomic,copy)NSString* userImg;
@property(nonatomic,copy)NSString* userPhone;
@property(nonatomic,copy)NSString* merchantImg;
@property(nonatomic,copy)NSString* merchantName;
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSString* isComment;
@property(nonatomic,copy)NSString* merchantId;
- (id)initWithDict:(NSDictionary *)dic;
@end
