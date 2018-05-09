//
//  ShangPinMingChengView.h
//  JRTescoToday
//
//  Created by 123 on 2018/1/5.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "activityModel.h"
@interface ShangPinMingChengView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *tuxiang;
@property (weak, nonatomic) IBOutlet UILabel *qian;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *geshu;
@property (weak, nonatomic) IBOutlet UIButton *jian;
@property (weak, nonatomic) IBOutlet UIButton *jia;
@property (weak, nonatomic) IBOutlet UILabel *zhe;
@property (weak, nonatomic) IBOutlet UIButton *tiaojiaodingdan;

@property (weak, nonatomic) IBOutlet UILabel *qian12;
/*
 *<# #>
 */
@property(strong,nonatomic)activityModel *model;

@end
