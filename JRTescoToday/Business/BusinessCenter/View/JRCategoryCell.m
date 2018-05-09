//
//  JRCategoryCell.m
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRCategoryCell.h"

#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]

@implementation JRCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.textColor = UIColorFromRGB_16(0x666666, 1);
}
- (void)setISelected:(BOOL)iSelected {
    _iSelected = iSelected;
    self.selectButton.hidden = !_iSelected;
    if (_iSelected) {
        self.titleLabel.textColor = UIColorFromRGB_16(0xe62f47, 1);
    } else {
        self.titleLabel.textColor = UIColorFromRGB_16(0x666666, 1);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
