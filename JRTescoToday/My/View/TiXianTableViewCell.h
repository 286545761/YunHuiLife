//
//  TiXianTableViewCell.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/16.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiXianTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tixian;
@property (weak, nonatomic) IBOutlet UILabel *zhangtai;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@end
