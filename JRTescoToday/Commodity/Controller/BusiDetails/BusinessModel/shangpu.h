//
//  shangpu.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shangpu : NSObject
@property(nonatomic,strong)NSString *descp;
@property(nonatomic,strong)NSString *goodsPrice;
@property(nonatomic,strong)NSString *idn;// 
@property(nonatomic,strong)NSString *mainImage;
@property(nonatomic,strong)NSString *standard;
@property(nonatomic,strong)NSString *goodsName;
@property(nonatomic,strong)NSArray *goodsLabels;
- (id)initWithDict:(NSDictionary *)dataDic;
@end
