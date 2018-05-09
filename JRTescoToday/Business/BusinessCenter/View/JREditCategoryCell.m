//
//  JREditCategoryCell.m
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JREditCategoryCell.h"
@interface JREditCategoryCell ()<UITextFieldDelegate>
@end
@implementation JREditCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.editTextField.hidden  = YES;
    self.titleLabel.hidden = NO;
    self.editBtn.hidden = NO;
    [self.editBtn addTarget:self action:@selector(clickEdit:) forControlEvents: UIControlEventTouchUpInside];
    [self.editTextField addTarget:self action:@selector(textFieldEditChange:) forControlEvents:UIControlEventEditingChanged];
    self.editTextField.delegate = self;
}
- (void)textFieldEditChange:(UITextField *)textField {
    NSLog(@"%@",textField.text);
    [self.delegate editedProductCategoryName:textField.text indexPath:_index];
}
- (void)clickEdit:(UIButton *)sender {
    self.editTextField.hidden = NO;
    self.titleLabel.hidden = YES;
    self.editBtn.hidden = YES;
    self.editTextField.placeholder = self.titleLabel.text;
}
- (void)setDefaultState:(NSInteger)defaultState {
    _defaultState = defaultState;
    self.editBtn.hidden = NO;
    self.titleLabel.hidden = NO;
    [self.editTextField resignFirstResponder];
    self.editTextField.hidden = YES;
}
- (void)setIndex:(NSInteger)index {
    _index = index;
}
//将要编辑时清空
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.editTextField.text = @"";
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.editTextField resignFirstResponder];
    self.titleLabel.hidden = NO;
    self.editBtn.hidden = NO;
    self.editTextField.hidden = YES;
    self.titleLabel.text = textField.text;
    return YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
