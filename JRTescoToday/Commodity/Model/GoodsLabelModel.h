//
//  GoodsLabelModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/12/6.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsLabelModel : NSObject
@property(nonatomic,copy)NSString* content;
//@property(nonatomic,copy)NSString* name;
//@property(nonatomic,copy)NSString* idn;
//@property(nonatomic,copy)NSArray* twoCategoryList;

- (id)initWithDict:(NSDictionary *)dic;
@end
