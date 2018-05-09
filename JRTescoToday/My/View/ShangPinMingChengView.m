//
//  ShangPinMingChengView.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/5.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShangPinMingChengView.h"



@interface ShangPinMingChengView ()

@property(nonatomic,strong)UILabel*fullReductionLabel;//满减活动标签
@property(nonatomic,strong)UILabel*fullReductionTextLabel;//满减活动内容
@property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
@property(nonatomic,strong)UILabel*atDiscountTextLabel;//打折活动内容

@end

@implementation ShangPinMingChengView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"ShangPinMingChengView" owner:nil options:nil][0];
        [self addSubview:self.fullReductionLabel];//
        [self addSubview:self.fullReductionTextLabel];//满减活动内容
        [self addSubview:self.atDiscountLabel];//打折活动标签
        [self addSubview:self.atDiscountTextLabel];
    }
    
    
    
    return self;
}
//@property(nonatomic,strong)UILabel*fullReductionLabel;//满减活动标签

-(UILabel *)fullReductionLabel{
    
    if (!_fullReductionLabel) {
        _fullReductionLabel =[[UILabel alloc]initWithFrame:CGRectMake(116, 105, 40, 20)];
        _fullReductionLabel.text=@"满减";
        _fullReductionLabel.backgroundColor=[UIColor colorWithRed:242/255.f green:106/255.f blue:46/255.f alpha:1.f];
        _fullReductionLabel.textAlignment=NSTextAlignmentCenter;
        _fullReductionLabel.layer.cornerRadius=5.f;
        _fullReductionLabel.font=[UIFont systemFontOfSize:13 weight:UIFontWeightBold];
        _fullReductionLabel.textColor=[UIColor whiteColor];
        _fullReductionLabel.layer.masksToBounds=YES;
    }
    return _fullReductionLabel;
}
//@property(nonatomic,strong)UILabel*fullReductionTextLabel;//满减活动内容
-(UILabel *)fullReductionTextLabel{
    
    if (!_fullReductionTextLabel) {
        _fullReductionTextLabel =[[UILabel alloc]initWithFrame:CGRectMake(160, 105, ScreenW-160, 20)];
        _fullReductionTextLabel.font=[UIFont systemFontOfSize:13];
        
        
    }
    return _fullReductionTextLabel;
}

//@property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
-(UILabel *)atDiscountLabel{
    
    if (!_atDiscountLabel) {
        _atDiscountLabel =[[UILabel alloc]initWithFrame:CGRectMake(116, 130, 40, 20)];
        _atDiscountLabel.text=@"折扣";
        _atDiscountLabel.backgroundColor=[UIColor colorWithRed:242/255.f green:106/255.f blue:46/255.f alpha:1.f];
        _atDiscountLabel.layer.cornerRadius=5.f;
        _atDiscountLabel.font=[UIFont systemFontOfSize:13 weight:UIFontWeightBold];
        _atDiscountLabel.textColor=[UIColor whiteColor];
        _atDiscountLabel.textAlignment=NSTextAlignmentCenter;
        _atDiscountLabel.layer.masksToBounds=YES;
    }
    return _atDiscountLabel;
}
//@property(nonatomic,strong)UILabel*atDiscountTextLabel;//打折活动内容

-(UILabel *)atDiscountTextLabel{
    
    if (!_atDiscountTextLabel) {
        _atDiscountTextLabel =[[UILabel alloc]initWithFrame:CGRectMake(160, 130, ScreenW-160, 20)];
        _atDiscountTextLabel.font=[UIFont systemFontOfSize:13];
    }
    return _atDiscountTextLabel;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
//    [self addSubview:self.fullReductionLabel];//满减活动标签
////    [self.fullReductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.equalTo(self.mas_left.)
////
////    }];
//   [self addSubview:self.fullReductionTextLabel];//满减活动内容
//
//[self addSubview:self.atDiscountLabel];//打折活动标签
//
//    [self addSubview:self.atDiscountTextLabel];



    
    
    
    
    
}
-(void)setModel:(activityModel *)model{
    
    
    if (![model.atDiscounttypeString isEqualToString:@"-1"]) {
        
        self.atDiscountLabel.alpha=1.f;
        self.atDiscountTextLabel.alpha=1.f;
        self.atDiscountTextLabel.text =model.atDiscountactivityString;
    }else{
        self.atDiscountLabel.alpha=0.f;
        self.atDiscountTextLabel.alpha=0.f;
        
    }
    if (![model.fullReductiontypeString isEqualToString:@"-1"]) {
        self.fullReductionLabel.alpha=1.f;
        self.fullReductionTextLabel.alpha=1.f;
        self.fullReductionTextLabel.text=model.fullReductioncativityString;
    
        
    }else{
        self.fullReductionLabel.alpha=0.f;
        self.fullReductionTextLabel.alpha=0.f;
        
    }
    
    if (![model.atDiscounttypeString isEqualToString:@"-1"]&&[model.fullReductiontypeString isEqualToString:@"-1"]) {
        self.fullReductionLabel.frame=CGRectMake(0, 0, 0, 0);
        self.fullReductionTextLabel.frame=CGRectMake(0, 0, 0, 0);
        self.atDiscountLabel.frame=CGRectMake(116, 125, 40, 20);
        self.atDiscountTextLabel.frame=CGRectMake(160, 125, ScreenW-160, 20);
    }
    
    
    
}

@end
