//
//  JinPaiHenHuoView.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JinPaiHenHuoView.h"

@implementation JinPaiHenHuoView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"JinPaiHenHuoView" owner:nil options:nil][0];
    }
    // self.shouSuoView.layer.masksToBounds=YES;
  
    return self;
}

@end
