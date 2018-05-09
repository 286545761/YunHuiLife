//
//  BussUploadView.m
//  JRTescoToday
//
//  Created by 123 on 2017/10/31.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "BussUploadView.h"

@implementation BussUploadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"BussUploadView" owner:nil options:nil][0];
    }
    
    return self;
}

@end
