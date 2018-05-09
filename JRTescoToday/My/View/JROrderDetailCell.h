//
//  JROrderDetailCell.h
//  JRTescoToday
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRBusinessOrderModel.h"
@interface JROrderDetailCell : UITableViewCell
- (void)setUpData:(JRBusinessOrderModel *)model;
@end
