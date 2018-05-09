//
//  DDanHearView.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/4.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "DDanHearView.h"

@implementation DDanHearView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"DDanHearView" owner:nil options:nil][0];
    }
    
    
    
    return self;
}
@end
