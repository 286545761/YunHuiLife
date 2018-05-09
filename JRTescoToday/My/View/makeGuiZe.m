//
//  makeGuiZe.m
//  JRTescoToday
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "makeGuiZe.h"

@implementation makeGuiZe

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"makeGuiZe" owner:nil options:nil][0];
    }
    
    
    
    return self;
}
@end
