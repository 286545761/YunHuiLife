//
//  CategoriesModel2.h
//  JRTescoToday
//
//  Created by 123 on 2017/12/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoriesModel2 : NSObject
@property(nonatomic,copy)NSString* count;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* idn;
@property(nonatomic,copy)NSArray* twoCategoryList;

- (id)initWithDict:(NSDictionary *)dic;
@end
