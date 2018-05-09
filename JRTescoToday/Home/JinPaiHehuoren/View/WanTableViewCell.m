//
//  WanTableViewCell.m
//  DHInvestment
//
//  Created by Andy on 16/9/14.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "WanTableViewCell.h"

@implementation WanTableViewCell

- (void)awakeFromNib {
    _timeText.textColor=[UIColor colorWithHexString:@"#a9a9a9"];
    _endTime.textColor=[UIColor colorWithHexString:@"#a8a8a8"];
    _stactTime.textColor=[UIColor colorWithHexString:@"#a8a8a8"];
    _touZiText.textColor=[UIColor colorWithHexString:@"#a8a8a8"];
    //_View.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
    UIView *line=[[UIView alloc] init];
    line.frame=CGRectMake(5, 55, kScreenSize.width-10, 0.5);
    line.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
    [self addSubview:line];
    UIView *line1=[[UIView alloc] init];
    line1.frame=CGRectMake(5, 140, kScreenSize.width-10, 0.5);
    line1.backgroundColor=[UIColor colorWithHexString:@"#e4e4e4"];
    [self addSubview:line1];
    self.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
