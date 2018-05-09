//
//  AllCategoriesmerchanModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/12/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllCategoriesmerchanModel : NSObject
@property(nonatomic,strong)NSString *tagsId;
@property(nonatomic,strong)NSString *tagsName;

- (id)initWithDict:(NSDictionary *)dataDic;
@end
