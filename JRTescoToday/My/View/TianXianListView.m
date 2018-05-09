//
//  TianXianListView.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "TianXianListView.h"

@implementation TianXianListView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"TianXianListView" owner:nil options:nil][0];
    }
   


    return self;
}
@end
