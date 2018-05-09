//
//  ShangJiaRenZhengView.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/31.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//unrecognized selector sent to instance 0x7fe026733e20'／／空指针

#import "ShangJiaRenZhengView.h"

@implementation ShangJiaRenZhengView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"ShangJiaRenZhengView" owner:nil options:nil][0];
    }
    
    return self;
}

@end
