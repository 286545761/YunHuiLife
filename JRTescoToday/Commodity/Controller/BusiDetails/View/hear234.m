//
//  hear234.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/22.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "hear234.h"

@implementation hear234
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"hear234" owner:nil options:nil][0];
        self.frame=CGRectMake(0, ScreenW-49, ScreenW, 49);
    }
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 1, ScreenW, 0.5)];
    line.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
    [self addSubview:line];
    
    UIView *line2=[[UIView alloc] initWithFrame:CGRectMake(0, 93, ScreenW, 0.5)];
    line2.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
    [self addSubview:line2];

    return self;
}


@end
