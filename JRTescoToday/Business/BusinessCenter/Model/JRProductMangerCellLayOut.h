//
//  JRProductMangerCellLayOut.h
//  JRTescoToday
//
//  Created by apple on 2017/12/3.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRManagerProductModel.h"

@interface JRProductMangerCellLayOut : NSObject
+ (CGFloat)layout_caculaterCellHeightWith:(JRManagerProductModel *)model;

+ (CGFloat)layout_caculaterViewWidh;
+ (CGFloat)layout_caculaterViewHeightWith:(JRManagerProductModel *)model;
@end
