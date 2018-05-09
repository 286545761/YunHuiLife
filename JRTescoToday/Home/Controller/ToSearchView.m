//
//  ToSearchView.m
//  XFAppliance
//
//  Created by hduokeji on 16/4/19.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "ToSearchView.h"

@implementation ToSearchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"ToSearchView" owner:nil options:nil][0];
    }
  
    return self;
}

@end
