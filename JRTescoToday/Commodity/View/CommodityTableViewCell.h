//
//  CommodityTableViewCell.h
//  JRTescoToday
//
//  Created by 123 on 2017/8/21.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommodityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewas;
@property (weak, nonatomic) IBOutlet UILabel *pinlei;
-(void)makeWuJiaoXing:(int)num;
@property (weak, nonatomic) IBOutlet UIImageView *tuxiang;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *weizhi;
@property (weak, nonatomic) IBOutlet UILabel *mi;
@end
