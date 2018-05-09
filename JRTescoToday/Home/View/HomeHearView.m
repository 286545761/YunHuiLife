//
//  HomeHearView.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/21.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "HomeHearView.h"

@implementation HomeHearView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"HomeHearView" owner:nil options:nil][0];
        
    }
    self.backgroundColor=[UIColor whiteColor];
    return self;
}
@end
