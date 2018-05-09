//
//  AllCategoriesModel.m
//  JRTescoToday
//
//  Created by 123 on 2017/11/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "AllCategoriesModel.h"

@implementation AllCategoriesModel
- (id)initWithDict:(NSDictionary *)dataDic
{
    _tagsName=[NSString stringWithFormat:@"%@", dataDic[@"name"]]    ;
   // _tagsId=dataDic[@"tagsId"];
    _merchantCategoryList=[[NSMutableArray alloc] init];
    _img=[NSString stringWithFormat:@"%@", dataDic[@"img"]]    ;
    _merchantCategoryList =dataDic[@"merchantCategoryList"];
    
    
    return self;
}
@end
