//
//  CommodityTableViewCell.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/21.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CommodityTableViewCell.h"

@implementation CommodityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (iPhone6p) {
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(133, 118-1, ScreenW-30, 1)];
        line.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
        [self addSubview:line];
        
    }
    else{
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(133, 118-1, ScreenW-30, 1)];
        line.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
        [self addSubview:line];
        
    }
   // [self makeWuJiaoXing:5];
    
}
-(void)makeWuJiaoXing:(int)num{
    for (int i=0; i<num; i++) {
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
        image.frame=CGRectMake(133+i*12, 21+15,12,13);
        
        
        
        [self addSubview:image];
        
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
