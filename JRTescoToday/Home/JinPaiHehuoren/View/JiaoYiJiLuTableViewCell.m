//
//  JiaoYiJiLuTableViewCell.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JiaoYiJiLuTableViewCell.h"

@implementation JiaoYiJiLuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    UIView *line1=[[UIView alloc] init];
    line1.frame=CGRectMake(15, 49, kScreenSize.width-15, 1);
    line1.backgroundColor=[UIColor colorWithHexString:@"#e4e4e4"];
    [self addSubview:line1];
}

@end
