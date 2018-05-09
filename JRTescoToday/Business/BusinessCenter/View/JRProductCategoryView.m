//
//  JRProductCategoryView.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRProductCategoryView.h"
#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]
@interface JRProductCategoryView ()<UITextFieldDelegate>

@end
@implementation JRProductCategoryView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.presentPriceTextField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    self.presentPriceTextField.tag = 100;
    self.presentPriceTextField.textColor = UIColorFromRGB_16(0xff2d48, 1);
    //
    [self.originalPriceTextField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    self.originalPriceTextField.tag = 200;
    self.originalPriceTextField.textColor = UIColorFromRGB_16(0x666666, 1);

    //
    [self.selectCategory addTarget:self action:@selector(clickSelect:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickSelect:(UIButton *)sender {
    [self.delegate selectTheCatagoryOfProduct];
}
- (void)textFieldEditChanged:(UITextField *)textField {
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

