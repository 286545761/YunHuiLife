//
//  tabBarView1.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/9.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "tabBarView1.h"

@implementation tabBarView1

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"tabBarView1" owner:nil options:nil][0];
        self.frame=CGRectMake(0, ScreenW-49, ScreenW, 49);
    }
    
    return self;
}


@end
