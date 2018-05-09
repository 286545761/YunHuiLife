//
//  shopInfoView.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/4/8.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "shopInfoView.h"

@interface shopInfoView()
/*
 *优惠买单
 */
//@property(strong,nonatomic)UIButton *offerToPayButton;
/*
 *星级
 */
//@property(strong,nonatomic)UIView *theStarImageView;
/*
 *分数
 */
//@property(strong,nonatomic)UILabel *scoreLabel;
/*
 *满减 文本
 */
@property(strong,nonatomic)UILabel *fullReductionLabel;
/*
 *满减内容
 */
//@property(strong,nonatomic)UILabel *fullReductionContentLabel;
/*
 *打折 文本
 */
@property(strong,nonatomic)UILabel*atADiscountLabel;

/*
 *打折 内容
 */
//@property(strong,nonatomic)UILabel*atADiscountContentLabel;
/*
 *横线
 */
@property(strong,nonatomic)UIView *horizontalLineView;

/*
 *定位 图标
 */
//@property(strong,nonatomic)UIImageView *locationIconImageView;
/*
 *地址
 */
//@property(strong,nonatomic)UILabel *addressLabel;
/*
 *电话竖线
 */
@property(strong,nonatomic)UIView *phoneCrossLineView;
/*
 *拨打 电话
 */
//@property(strong,nonatomic)UIButton *makePhoneCallButton;


/*
 *店长推荐 文本
 */
@property(strong,nonatomic)UILabel *theManagerRecommendsTextLabel;
@property(strong,nonatomic)UIView *towHorizontalLineView;
/*
 *店长推荐 竖线
 */
@property(strong,nonatomic)UIView *theManagerRecommendsCrossView;
@end
@implementation shopInfoView


-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled=YES;
        self.backgroundColor=[UIColor whiteColor];
        
        
        
        
        
    }
    return self;
}
//
///*
// *店名
// */
//@property(strong,nonatomic)UILabel *shopNameLabel;
-(UILabel *)shopNameLabel{
    
    if (!_shopNameLabel) {
        _shopNameLabel =[[UILabel alloc]init];
        _shopNameLabel.textColor=[UIColor blackColor];
        _shopNameLabel.text=@"大妈洗衣";
        _shopNameLabel.font=[UIFont systemFontOfSize:18 weight:UIFontWeightBold];
//        _shopNameLabel.font=PFR16Font;
    }
    return _shopNameLabel;
}
//
///*
// *优惠买单
// */
//@property(strong,nonatomic)UIButton *offerToPayButton;
-(UIButton *)offerToPayButton{
    if (!_offerToPayButton) {
        _offerToPayButton =[[UIButton alloc]initWithFrame:CGRectMake(10, ScreenW-100, 50, 20)];
        [_offerToPayButton setTitle:@"买单" forState:UIControlStateNormal];
        _offerToPayButton.backgroundColor=RGB(253, 201, 46);
//        [_offerToPayButton addTarget:self action:@selector(offerToPayAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _offerToPayButton;
}

//// 优惠买单
//-(void)offerToPayAction{
//
//
//
//}
///*
// *星级
// */
//@property(strong,nonatomic)UIView *theStarImageView;
-(UIView *)theStarImageView{
    if (!_theStarImageView) {
        _theStarImageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.shopNameLabel.frame)+10, 100, 13)];
//        _theStarImageView.backgroundColor=[UIColor redColor];
    }
    
    return _theStarImageView;
}

///*
// *分数
// */
//@property(strong,nonatomic)UILabel *scoreLabel;
-(UILabel *)scoreLabel{
    if (!_scoreLabel) {
        _scoreLabel =[[UILabel alloc]init];
        _scoreLabel.text=@"5分";
        _scoreLabel.font=PFR15Font;
        
        _scoreLabel.textColor=RGB(254, 211, 48);
    }
    
    return _scoreLabel;
}



///*
// *满减 文本
// */
//@property(strong,nonatomic)UILabel *fullReductionLabel;
-(UILabel *)fullReductionLabel{
    
    if (!_fullReductionLabel) {
        _fullReductionLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.shopNameLabel.frame)+10, 50, 25)];
        _fullReductionLabel.text=@"满减";
        _fullReductionLabel.backgroundColor=[UIColor colorWithRed:242/255.f green:106/255.f blue:46/255.f alpha:1.f];
        _fullReductionLabel.textAlignment=NSTextAlignmentCenter;
        _fullReductionLabel.layer.cornerRadius=3.f;
        _fullReductionLabel.font=[UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        _fullReductionLabel.textColor=[UIColor whiteColor];
        _fullReductionLabel.layer.masksToBounds=YES;
    }
    return _fullReductionLabel;
}
//@property(nonatomic,strong)UILabel*fullReductionTextLabel;//满减活动内容
-(UILabel *)fullReductionContentLabel{
    
    if (!_fullReductionContentLabel) {
        _fullReductionContentLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.fullReductionLabel.frame)+5, CGRectGetMaxY(self.shopNameLabel.frame)+10, ScreenW-20-CGRectGetMaxX(self.fullReductionLabel.frame), 25)];
        _fullReductionContentLabel.font=[UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
        _fullReductionContentLabel.textColor=RGB(102, 102, 102);
        _fullReductionContentLabel.text=@"满10减1";
        
        
        
        
    }
    return _fullReductionContentLabel;
}

//@property(nonatomic,strong)UILabel*atADiscountLabel;//打折活动标签
-(UILabel *)atADiscountLabel{
    
    if (!_atADiscountLabel) {
        _atADiscountLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.fullReductionLabel.frame)+10, 50, 25)];
        _atADiscountLabel.text=@"折扣";
        _atADiscountLabel.backgroundColor=[UIColor colorWithRed:242/255.f green:106/255.f blue:46/255.f alpha:1.f];
        _atADiscountLabel.layer.cornerRadius=5.f;
        _atADiscountLabel.font=[UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        _atADiscountLabel.textColor=[UIColor whiteColor];
        _atADiscountLabel.textAlignment=NSTextAlignmentCenter;
        _atADiscountLabel.layer.masksToBounds=YES;
    }
    return _atADiscountLabel;
}
//@property(nonatomic,strong)UILabel*atADiscountContentLabel;//打折活动内容

-(UILabel *)atADiscountContentLabel{
    
    if (!_atADiscountContentLabel) {
        _atADiscountContentLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.atADiscountLabel.frame)+10, CGRectGetMaxY(self.fullReductionLabel.frame)+10, ScreenW-20-CGRectGetMaxX(self.fullReductionLabel.frame), 25)];
        _atADiscountContentLabel.font=[UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
        _atADiscountContentLabel.textColor=RGB(102, 102, 102);
        _atADiscountContentLabel.text=@"满10打8折";
    }
    return _atADiscountContentLabel;
}
///*
// *横线
// */
//@property(strong,nonatomic)UIView *horizontalLineView;
-(UIView *)horizontalLineView{
    if (!_horizontalLineView) {
        _horizontalLineView =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.atADiscountContentLabel.frame)+20, ScreenW, 1)];
        _horizontalLineView.backgroundColor=RGB(204, 204, 204);
    }
    return _horizontalLineView;
    
}
//
///*
// *定位 图标
// */
//@property(strong,nonatomic)UIImageView *locationIconImageView;


-(UIButton *)locationIconButton{
    if (!_locationIconButton) {
        _locationIconButton =[[UIButton alloc]init];
        
        [_locationIconButton setImage:[UIImage imageNamed:@"dingwei.png"] forState:UIControlStateNormal];
    }
    
    return _locationIconButton;
}
//-(UIImageView *)locationIconImageView{
//    if (!_locationIconImageView) {
//        _locationIconImageView =[[UIImageView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.horizontalLineView.frame)+10, 10, 15)];
//        _locationIconImageView.image=[UIImage imageNamed:@"icon_location.png"];
//
//    }
//
//    return _locationIconImageView;
//}
///*
// *地址
// */
//@property(strong,nonatomic)UILabel *addressLabel;
-(UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel =[[UILabel alloc]init];
        _addressLabel.textColor=RGB(140, 140, 140);
        _addressLabel.textAlignment=NSTextAlignmentLeft;
    }
    
    return _addressLabel;
}



///*
// *电话竖线
// */
//@property(strong,nonatomic)UIView *phoneCrossLineView;
///*
// *拨打 电话
// */
//@property(strong,nonatomic)UIButton *makePhoneCallButton;
-(UIButton *)makePhoneCallButton{
    if (!_makePhoneCallButton) {
        _makePhoneCallButton =[[UIButton alloc]initWithFrame:CGRectMake(ScreenW-80, CGRectGetMaxY(self.horizontalLineView.frame), 80, 47)];
//        _makePhoneCallButton.backgroundColor=[UIColor redColor];
        [_makePhoneCallButton setImage:[UIImage imageNamed:@"btn_phone.png"] forState:UIControlStateNormal];
        
    }
    
    return _makePhoneCallButton;
}
//
//
///*
// *店长推荐 文本
// */
//@property(strong,nonatomic)UILabel *theManagerRecommendsTextLabel;
-(UILabel *)theManagerRecommendsTextLabel{
    if (!_theManagerRecommendsTextLabel) {
        _theManagerRecommendsTextLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.theManagerRecommendsCrossView.frame)+10, CGRectGetMaxY(self.theManagerRecommendsCrossView.frame)+50, 200, 30)];
        _theManagerRecommendsTextLabel.text=@"店长推荐";
        _theManagerRecommendsTextLabel.font=PFR20Font;
        _theManagerRecommendsTextLabel.font=[UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        
    }
    
    
    return _theManagerRecommendsTextLabel;
}


///*
// *店长推荐 竖线
// */
//@property(strong,nonatomic)UILabel *theManagerRecommendsCrossLabel;
-(UIView *)theManagerRecommendsCrossView{
    
    if (!_theManagerRecommendsCrossView) {
        _theManagerRecommendsCrossView =[[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.makePhoneCallButton.frame)+10, 2, 30)];
        _theManagerRecommendsCrossView.backgroundColor=[UIColor redColor];
    }
    
    return _theManagerRecommendsCrossView;
}
-(UIView *)towHorizontalLineView{
    if (!_towHorizontalLineView) {
        _towHorizontalLineView =[[UIView alloc]init];
        
        _towHorizontalLineView.backgroundColor=RGB(241, 239, 242);
    }
    
    return _towHorizontalLineView;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
   
    

    
}
-(void)setActionType:(NSString *)actionType{
    _actionType=actionType;
    
    
//    if([self.model.acModel.fullReductiontypeString isEqualToString:@"-1"]&&[self.model.acModel.atDiscounttypeString isEqualToString:@"-1"]){
//        actionType=@"0";
//        height=120;
//
//
//    }else if(![self.model.acModel.fullReductiontypeString isEqualToString:@"-1"]&&[self.model.acModel.atDiscounttypeString isEqualToString:@"-1"]){
//        actionType=@"1";
//        height=160;
//
//    }else if([self.model.acModel.fullReductiontypeString isEqualToString:@"-1"]&& ![self.model.acModel.atDiscounttypeString isEqualToString:@"-1"]){
//
//        actionType=@"2";
//        height=160;
//
//
//    }else{
//        actionType=@"3";
//        height=230;
//
//
//    }
    
    CGFloat atDiscounttype;
    CGFloat fullHeight;
    
    if ([actionType isEqualToString:@"0"]) {//
        atDiscounttype=0;
        fullHeight=0;
    } else if ([actionType isEqualToString:@"1"]){// 满减
 atDiscounttype=0;
fullHeight=25;
        
    }else if ([actionType isEqualToString:@"2"]){// 打折
        atDiscounttype=25;
        fullHeight=0;

        
        
    }else if ([actionType isEqualToString:@"3"]){// 满减 打折
        
        atDiscounttype=25;
        fullHeight=25;
        
        
    }
    
    
    
    
    
    
    [self addSubview:self.offerToPayButton];
    [self.offerToPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    [self addSubview:self.shopNameLabel];
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(10);
        make.height.equalTo(@20);
        make.right.equalTo(self.self.offerToPayButton.mas_left);
    }];
    
    [self addSubview:self.theStarImageView];
    [self.theStarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.shopNameLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 13));
    }];
    [self addSubview:self.scoreLabel];
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.theStarImageView.mas_right).offset(10);
        make.top.equalTo(self.theStarImageView.mas_top).offset(2);
        
        make.size.mas_equalTo(CGSizeMake(60, 13));
        
    }];
    
    
    
    
    [self addSubview:self.fullReductionLabel];
    [self.fullReductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.theStarImageView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, fullHeight));
    }];
    
    
    
    [self addSubview:self.fullReductionContentLabel];
    [self.fullReductionContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fullReductionLabel.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.fullReductionLabel.mas_top);
        make.height.equalTo(@(fullHeight));
    }];
    
    
    [self addSubview:self.atADiscountLabel];
    
    [self.atADiscountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.fullReductionLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, atDiscounttype));
    }];
    [self addSubview:self.atADiscountContentLabel];
    [self.atADiscountContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.fullReductionLabel.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.atADiscountLabel.mas_top);
        make.height.equalTo(@(atDiscounttype));
        
        
        
    }];
    
    
    [self addSubview:self.horizontalLineView];
    [self.horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.atADiscountLabel.mas_bottom).offset(10);
    }];
    
    
    [self addSubview:self.locationIconButton];
    
    [self.locationIconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.horizontalLineView.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(20, 30));
    }];
    
    
    
    [self addSubview:self.makePhoneCallButton];
    [self.makePhoneCallButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.locationIconButton.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(28, 22));
    }];
    
    
    [self addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.locationIconButton.mas_centerY).offset(2);
        make.left.equalTo(self.locationIconButton.mas_right).offset(0);
        make.right.equalTo(self.makePhoneCallButton.mas_right).offset(-5);
        
        
        
        
    }];
    
    [self addSubview:self.towHorizontalLineView];
    [self.towHorizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.addressLabel.mas_bottom).offset(10);
        make.height.equalTo(@12);
    }];
    
    
    [self addSubview:self.theManagerRecommendsCrossView];
    [self.theManagerRecommendsCrossView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.towHorizontalLineView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(2, 20));
    }];
    
    
    
    
    
    
    [self addSubview:self.theManagerRecommendsTextLabel];
    [self.theManagerRecommendsTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.theManagerRecommendsCrossView.mas_right).offset(5);
        make.centerY.equalTo(self.theManagerRecommendsCrossView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 20));
        
        
    }];
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
