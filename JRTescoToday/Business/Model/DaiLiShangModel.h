//
//  DaiLiShangModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/11/3.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaiLiShangModel : NSObject

@property(nonatomic,strong)NSString* idn;
@property(nonatomic,strong)NSString*name;

- (id)initWithDict:(NSDictionary *)dic;
@end
