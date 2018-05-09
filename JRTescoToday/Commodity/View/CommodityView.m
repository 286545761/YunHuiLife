//
//  CommodityView.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/21.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CommodityView.h"

@implementation CommodityView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"CommodityView" owner:nil options:nil][0];
        
    }
    self.backgroundColor=[UIColor whiteColor];
    return self;
}

@end
