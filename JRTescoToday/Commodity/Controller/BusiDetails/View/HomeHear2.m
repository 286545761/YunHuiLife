//
//  HomeHear2.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/8.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "HomeHear2.h"

@implementation HomeHear2

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"HomeHear2" owner:nil options:nil][0];
    }

    return self;
}

@end
