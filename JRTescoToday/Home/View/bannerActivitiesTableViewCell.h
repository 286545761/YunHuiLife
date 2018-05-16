//
//  bannerActivitiesTableViewCell.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bannerActivitiesTableViewCell : UITableViewCell
/*
 *
 */
@property(assign,nonatomic)NSInteger index;
/*
 *
 */
@property(copy,nonatomic)void (^mapNavigationBlock)(NSInteger index);
@end
