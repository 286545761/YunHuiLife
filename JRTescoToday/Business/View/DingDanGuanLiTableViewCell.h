//
//  DingDanGuanLiTableViewCell.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/15.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DingDanGuanLiTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *name;
@property (weak, nonatomic) IBOutlet UIImageView *touxiang;
@property (weak, nonatomic) IBOutlet UILabel *qian;
@property (weak, nonatomic) IBOutlet UILabel *shouji;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
