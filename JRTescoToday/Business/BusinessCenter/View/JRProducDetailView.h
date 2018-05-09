//
//  JRProducDetailView.h
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRProducDetailView : UIView
//获取添加状态输入的内容
@property (nonatomic, copy)NSString *titleStr;
@property (nonatomic, copy)NSString *detailStr;
//获取编辑状态输入的内容
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

//
- (void)giveTitle:(NSString *)title andDescription:(NSString *)description;
@end
