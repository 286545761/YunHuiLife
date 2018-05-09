//
//  AddShangoinView.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "AddShangoinView.h"

@implementation AddShangoinView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"AddShangoinView" owner:nil options:nil][0];
    }
    
    return self;
}



@end
