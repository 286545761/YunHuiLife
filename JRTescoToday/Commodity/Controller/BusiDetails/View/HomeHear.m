//
//  HomeHear.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/8.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "HomeHear.h"

@implementation HomeHear
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"HomeHear" owner:nil options:nil][0];
        //
//        @property(nonatomic,strong)UILabel*fullReductionLabel;//满减活动标签
//        @property(nonatomic,strong)UILabel*fullReductionTextLabel;//满减活动内容
//        @property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
//        @property(nonatomic,strong)UILabel*atDiscountTextLabel;//打折活动内容
//        [self addSubview:self.fullReductionLabel];
//        [self addSubview:self.fullReductionTextLabel];
//        [self addSubview:self.atDiscountLabel];
//        [self addSubview:self.atDiscountTextLabel];
    }
    self.uiJianJieText.textColor=[UIColor colorWithHexString:@"#8e8e93"];
     [self makeWuJiaoXing:5];
    return self;
}
-(UILabel *)fullReductionLabel{
    
    if (!_fullReductionLabel) {
        _fullReductionLabel =[[UILabel alloc]initWithFrame:CGRectMake(10,60 , 50, 25)];
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
        _fullReductionTextLabel =[[UILabel alloc]init];
        _fullReductionTextLabel.font=[UIFont systemFontOfSize:14];
        
        
    }
    return _fullReductionTextLabel;
}

//@property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
-(UILabel *)atDiscountLabel{
    
    if (!_atDiscountLabel) {
        _atDiscountLabel =[[UILabel alloc]initWithFrame:CGRectMake(93, 0, 0, 0)];
        _atDiscountLabel.text=@"打折";
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
        _atDiscountTextLabel =[[UILabel alloc]init];
        _atDiscountTextLabel.font=[UIFont systemFontOfSize:14];
    }
    return _atDiscountTextLabel;
}

-(void)makeWuJiaoXing:(int)num{

}
-(void)layoutSubviews{
    [super layoutSubviews];
    
//    CGFloat atDiscounttypeStringHelght=25;
//    CGFloat fullReductiontypeStringHelght=25;
//    if ([self.acModel.atDiscounttypeString isEqualToString:@"-1"]) {
//        
//        atDiscounttypeStringHelght=0;
//    }
//    if ([self.acModel.fullReductiontypeString isEqualToString:@"-1"]) {
//        fullReductiontypeStringHelght=0;
//    }
    
    
//    [self.fullReductionLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(5);
//        make.left.equalTo(self.mas_left).offset(10);
//        make.size.mas_equalTo(CGSizeMake(50, fullReductiontypeStringHelght));
//    }];
    
//    [self.fullReductionTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.fullReductionLabel.mas_top).offset(0);
//        make.left.equalTo(self.fullReductionLabel.mas_right).offset(5);
//        make.right.equalTo(self.contentView.mas_right);
//        make.height.mas_equalTo(@(fullReductiontypeStringHelght));
//    }]; //满减活动内容
//    //    @property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
//    [self.atDiscountLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.fullReductionLabel.mas_bottom).offset(5);
//        make.left.equalTo(self.titleLabel.mas_left);
//        make.size.mas_equalTo(CGSizeMake(50, fullReductiontypeStringHelght));
//    }];
//    [self.atDiscountTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.atDiscountLabel.mas_top).offset(0);
//        make.left.equalTo(self.atDiscountLabel.mas_right).offset(5);
//        make.right.equalTo(self.contentView.mas_right);
//        make.height.mas_equalTo(@(fullReductiontypeStringHelght));
//    }];
    
}
-(void)setAcModel:(activityModel *)acModel{
    _acModel=acModel;
    
    
}

@end
