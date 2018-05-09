//
//  UITextField+DH.m
//  DHInvestment
//
//  Created by JJS on 15/9/14.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "UITextField+DH.h"

@implementation UITextField (DH)

#pragma mark 为UITextFiled的左边添加图片
+ (void)uitextFieldWith:(UITextField *)textField iconName:(NSString *)iconName
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.frame = CGRectMake(0, 0, 30, 40);
    textField.leftView = imageView;
    
    // 设置左边的view永远显示
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    // 内容垂直居中
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // 设置字体
    textField.font = [UIFont systemFontOfSize:14];
}

@end
