//
//  Search.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/2.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "Search.h"

@implementation Search
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"Search" owner:nil options:nil][0];
    }
   // self.shouSuoView.layer.masksToBounds=YES;
   [self.shouSuoView.layer setCornerRadius:15];
    self.shouSuoView.backgroundColor=[UIColor  colorWithHexString:@"#f4f4f3"];
    self.shouWoText.backgroundColor=[UIColor colorWithHexString:@"#f4f4f3"];
    [self.diQu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
   self.backgroundColor=[UIColor clearColor];
    return self;
}


@end
