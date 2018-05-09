//
//  shurkuang.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/15.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "shurkuang.h"

@implementation shurkuang

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"shurkuang" owner:nil options:nil][0];
    }
    
    
    
    return self;
}

@end
