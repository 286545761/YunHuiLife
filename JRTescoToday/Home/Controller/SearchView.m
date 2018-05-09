//
//  SearchView.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/10.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"SearchView" owner:nil options:nil][0];
    }
     self.tiView.layer.masksToBounds=YES;
    [self.tiView.layer setCornerRadius:15];
    self.tiView.backgroundColor=[UIColor  colorWithHexString:@"#f4f4f3"];
    self.shouText.backgroundColor=[UIColor colorWithHexString:@"#f4f4f3"];
    self.frame=CGRectMake(0, 20, SCREEN_WIDTH, 44);
//    [self.quXiao setTitleColor:[UIColor colorWithHexString:kAllViewZiColor] forState:UIControlStateNormal];
    return self;
}

@end
