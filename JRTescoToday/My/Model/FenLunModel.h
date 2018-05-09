//
//  FenLunModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FenLunModel : NSObject
@property(nonatomic,copy)NSString* amount;
@property(nonatomic,copy)NSString* balance;
@property(nonatomic,copy)NSString* inviteName;
@property(nonatomic,copy)NSString* origin;
@property(nonatomic,copy)NSString* time;
@property(nonatomic,copy)NSString* userType;
@property(nonatomic,copy)NSString* type;
- (id)initWithDict:(NSDictionary *)dic;
@end
