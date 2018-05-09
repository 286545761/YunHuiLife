//
//  AmontView.m
//  DHInvestment
//
//  Created by Andy on 16/8/26.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "AmontView.h"

@implementation AmontView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"AmontView" owner:nil options:nil][0];
    }
    _line1.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
        _line2.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
    self.backgroundColor=[UIColor colorWithHexString:@"#f5f5f9"];
    return self;
}

@end
