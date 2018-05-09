//
//  pingLunbussView.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/23.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "pingLunbussView.h"

@implementation pingLunbussView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"pingLunbussView" owner:nil options:nil][0];
           }
    
    return self;
}
@end
