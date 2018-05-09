//
//  TuxiangVierw.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/24.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "TuxiangVierw.h"

@implementation TuxiangVierw

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"TuxiangVierw" owner:nil options:nil][0];
        
    }
    
    return self;
}

@end
