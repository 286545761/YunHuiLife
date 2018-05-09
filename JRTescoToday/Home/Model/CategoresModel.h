//
//  CategoresModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/12/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoresModel : NSObject
@property(nonatomic,strong)NSString *tagsId;
@property(nonatomic,strong)NSString *tagsName;
@property(nonatomic,strong)NSString *img;
- (id)initWithDict:(NSDictionary *)dataDic;
@end
