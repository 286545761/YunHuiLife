//
//  MeAmontTableViewCell.m
//  DHInvestment
//
//  Created by Andy on 16/8/28.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "MeAmontTableViewCell.h"

@implementation MeAmontTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    //_touZiJinE.textColor=[UIColor colorWithHexString:@"#a8a8a8"];
    _timeText.textColor=[UIColor colorWithHexString:@"#a9a9a9"];
    _daysText.textColor=[UIColor colorWithHexString:@"#a8a8a8"];
    _DaoQitimeText.textColor=[UIColor colorWithHexString:@"#a8a8a8"];
    _jineText.textColor=[UIColor colorWithHexString:@"#a8a8a8"];
    _View.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
    UIView *line=[[UIView alloc] init];
    line.frame=CGRectMake(5, 55, kScreenSize.width-10, 0.5);
    line.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
    [self addSubview:line];
    UIView *line1=[[UIView alloc] init];
    line1.frame=CGRectMake(5, 140, kScreenSize.width-10, 0.5);
    line1.backgroundColor=[UIColor colorWithHexString:@"#e4e4e4"];
    [self addSubview:line1];
//    _heTong.backgroundColor=[UIColor colorWithRed:0.98f green:0.81f blue:0.41f alpha:1.00f];
//    [_heTong.layer setCornerRadius:15];
}

@end
