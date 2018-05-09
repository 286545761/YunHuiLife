//
//  JRProducDetailView.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRProducDetailView.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "UIImage+Orientation.h"
#import "MBProgressHUD+NJ.h"
#import "UITextView+ZWPlaceHolder.h"
#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]

@interface JRProducDetailView ()<UITextViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleCountLimitLabel;

@end

@implementation JRProducDetailView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleCountLimitLabel.textColor = UIColorFromRGB_16(0x999999, 1);
    self.detailTextView.zw_placeHolder = @"主人，请描述下商品详情吧！";
    [self.titleTextField addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    self.titleTextField.delegate = self;
    self.detailTextView.delegate = self;
    
    self.titleTextField.autocorrectionType = UITextAutocorrectionTypeNo;

}
- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    _titleStr =  _titleTextField.text;
    
}
- (void)textFieldEditChanged:(UITextField *)textField {
    self.titleStr = textField.text;
    if (textField == self.titleTextField) {
        if (textField.text.length > 20) {
            textField.text = [textField.text substringToIndex:20];
        }
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {


    if (textField == self.titleTextField) {
     
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (string.length == 0)[NSString stringWithFormat:@"%ld",(long)(20-selectedLength)];
        if (existedLength - selectedLength + replaceLength > 20) {
            return NO;
        } else {
            self.titleCountLimitLabel.text = [NSString stringWithFormat:@"%ld",(long)(20-(existedLength - selectedLength + replaceLength ))];
        }
    }

    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    self.detailStr = textView.text;
    return YES;
}
#pragma mark - 编辑状态下赋数据
- (void)giveTitle:(NSString *)title andDescription:(NSString *)description {
    self.titleTextField.text = title;
    
    self.detailTextView.text = description;
}
@end
