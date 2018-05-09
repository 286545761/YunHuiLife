//
//  noOrdersView.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/4/23.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "noOrdersView.h"

@implementation noOrdersView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"noOrdersView" owner:nil options:nil][0];
    }
    return self;
}
-(instancetype)init
{
    self=[super init];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"noOrdersView" owner:nil options:nil][0];
    }
    return self;
}




@end
