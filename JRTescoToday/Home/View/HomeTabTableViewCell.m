//
//  HomeTabTableViewCell.m
//  TescoToday
//
//  Created by 123 on 2017/8/18.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "HomeTabTableViewCell.h"

@implementation HomeTabTableViewCell
{
    NSString *make;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if (iPhone6p) {
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(133, kScreenSize.width*0.3-1, ScreenW-30, 1)];
        line.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
        [self addSubview:line];
      
    
    }
    else{
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(133, 128-1, ScreenW-30, 1)];
        line.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
        [self addSubview:line];
      
    }
    _miaoshu.textColor=[UIColor colorWithHexString:@"#999999"];
    
    _monry.textColor=[UIColor colorWithHexString:@"#ff2d48"];
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
