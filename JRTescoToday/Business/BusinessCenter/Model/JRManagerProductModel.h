//
//  JRManagerProductModel.h
//  JRTescoToday
//
//  Created by apple on 2017/12/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRManagerProductModel : NSObject
@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *mainImage;
@property (nonatomic, copy)NSString *status;
@property (nonatomic, copy)NSString *goodsName;
@property (nonatomic, copy)NSString *goodsPrice;
@property (nonatomic, copy)NSString *originalPrice;
@property (nonatomic, strong)NSMutableArray *goodsLabels;

@property (nonatomic, assign)CGFloat cellMaxHeight;
@property (nonatomic, assign)CGFloat tagViewMaxHeight;
@property (nonatomic, assign)CGFloat tagViewMaxWidth;
@end
