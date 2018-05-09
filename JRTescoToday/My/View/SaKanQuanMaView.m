//
//  SaKanQuanMaView.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/5.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "SaKanQuanMaView.h"

@implementation SaKanQuanMaView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"SaKanQuanMaView" owner:nil options:nil][0];
    }
    
    
    
    return self;
}

@end
