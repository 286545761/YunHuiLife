//
//  ShiNameBankList.h
//  JRTescoToday
//
//  Created by 123 on 2018/1/24.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShiNameBankList : NSObject
@property(nonatomic,copy)NSString* bankCode;
@property(nonatomic,copy)NSString* bankIcon;
@property(nonatomic,copy)NSString* bankName;
- (id)initWithDict:(NSDictionary *)dic;
@end
