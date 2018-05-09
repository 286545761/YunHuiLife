//
//  BusinessrView.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/23.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "BusinessrView.h"

@implementation BusinessrView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"BusinessrView" owner:nil options:nil][0];
    }
    for (int i=0; i<2; i++) {
        UIView *line=[[UIView alloc] init];
        line.frame=CGRectMake(55, i*44, kScreenSize.width, 0.5);
        line.backgroundColor=[UIColor  colorWithHexString:@"#e4e4e4"];
        if (i!=0) {
            [self.View1 addSubview:line];
        }
        
    }
    for (int i=0; i<3; i++) {
        UIView *line=[[UIView alloc] init];
        line.frame=CGRectMake(55, i*44, kScreenSize.width, 0.5);
        line.backgroundColor=[UIColor  colorWithHexString:@"#e4e4e4"];
        if (i!=0) {
            [self.View12 addSubview:line];
        }
        
    }
    return self;
}

@end
