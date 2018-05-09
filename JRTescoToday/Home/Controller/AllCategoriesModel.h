//
//  AllCategoriesModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/11/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllCategoriesModel : NSObject
@property(nonatomic,strong)NSString *tagsId;
@property(nonatomic,strong)NSString *tagsName;
@property(nonatomic,strong)NSString *img;
@property(nonatomic,strong)NSMutableArray *merchantCategoryList;
- (id)initWithDict:(NSDictionary *)dataDic;
@end
