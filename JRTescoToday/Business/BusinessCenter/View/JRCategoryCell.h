//
//  JRCategoryCell.h
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRCategoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (nonatomic, assign) BOOL iSelected;
@end
