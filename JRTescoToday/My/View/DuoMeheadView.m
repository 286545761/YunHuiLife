//
//  DuoMeheadView.m
//  DHInvestment
//
//  Created by Andy on 16/8/24.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "DuoMeheadView.h"

@implementation DuoMeheadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"DuoMeheadView" owner:nil options:nil][0];
    }
    for (int i=0; i<2; i++) {
        UIView *line=[[UIView alloc] init];
        line.frame=CGRectMake(55, i*44, kScreenSize.width, 0.5);
        line.backgroundColor=[UIColor  colorWithHexString:@"#e4e4e4"];
        if (i!=0) {
          [self.View addSubview:line];
        }
        
    }
    UIView *line=[[UIView alloc] init];
    line.frame=CGRectMake(55, 44, kScreenSize.width, 0.5);
    line.backgroundColor=[UIColor  colorWithHexString:@"#e4e4e4"];
    [self.View12 addSubview:line];
    _jifen.textColor=[UIColor colorWithHexString:@"#666666"];
    _titlemory.textColor=[UIColor colorWithHexString:@"#666666"];
    _yueww.textColor=[UIColor colorWithHexString:@"#666666"];
    _labelBtntext.textColor=[UIColor colorWithHexString:@"#666666"];
     _Rcode.textColor=[UIColor colorWithHexString:@"#666666"];
    return self;
}

@end
