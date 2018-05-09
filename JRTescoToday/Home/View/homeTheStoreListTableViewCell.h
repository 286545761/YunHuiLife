//
//  homeTheStoreListTableViewCell.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/26.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//  首页商家列表

#import <UIKit/UIKit.h>
@class commodle;
@interface homeTheStoreListTableViewCell : UITableViewCell
@property(nonatomic,strong)NSString *typeString;
@property(nonatomic,strong)commodle *model;

@end
