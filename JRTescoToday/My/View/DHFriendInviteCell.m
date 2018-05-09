//
//  DHFriendInviteCell.m
//  DHInvestment
//
//  Created by Andy on 16/6/13.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "DHFriendInviteCell.h"

@implementation DHFriendInviteCell

- (void)awakeFromNib {
     _numLable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,kScreenSize.width/5,44)];
    
    _numLable1.text =@"邀请用户";
    
    _numLable1.textAlignment = 1;
    
    _numLable1.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    _numLable1.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:_numLable1];
    
    _numLable = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5, 0,kScreenSize.width/5,44)];
    
    _numLable.text =@"用户性质";
    
   _numLable.textAlignment = 1;
    
    _numLable.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    _numLable.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:_numLable];
    _numLable2 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5*2, 0,kScreenSize.width/5,44)];
    
    _numLable2.text =@"流水金额";
    
    _numLable2.textAlignment = 1;
    
    _numLable2.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    _numLable2.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:_numLable2];
    
    _numLable4 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5*3, 0,kScreenSize.width/5,44)];
    
    _numLable4.text =@"分润金额";
    
    _numLable4.textAlignment = 1;
    
    _numLable4.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    _numLable4.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:_numLable4];
    _numLable3 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5*4, 0,kScreenSize.width/5,44)];
    
   _numLable3.text =@"发放时间";
    
    _numLable3.textAlignment = 1;
    
    _numLable3.textColor =[UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    _numLable3.font = [UIFont systemFontOfSize:12];
    
    [self addSubview:_numLable3];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
