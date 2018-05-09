//
//  homeTheStoreListTableViewCell.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/26.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
// 首页商家列表

#import "homeTheStoreListTableViewCell.h"
#import "commodle.h"
//#import "activityModel.fullReductioncativityStringh"
#import "UIImageView+WebCache.h"
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height//获取设备屏幕的长

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width//获取设备屏幕的宽
@interface homeTheStoreListTableViewCell ()
@property(nonatomic,strong)UIImageView *iconImageView;// 显示图片
@property(nonatomic,strong)UILabel*titleLabel;// 标题

//@property(nonatomic,strong)UILabel*classificationLabel;//分类
//@property(nonatomic,strong)UILabel*positioningAddressLabel;//定位地址
@property(nonatomic,strong)UILabel*distanceLabel;//距离
@property(nonatomic,strong)UIImageView*theStarImageView;//评级五角星
//@property(nonatomic,strong)UIImageView*positioningAddressIconImageView;//定位小图标

@property(nonatomic,strong)UILabel*fullReductionLabel;//满减活动标签
@property(nonatomic,strong)UILabel*fullReductionTextLabel;//满减活动内容
@property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
@property(nonatomic,strong)UILabel*atDiscountTextLabel;//打折活动内容


@end


@implementation homeTheStoreListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self ) {
//        @property(nonatomic,strong)UIImageView *iconImage;// 显示图片
//        @property(nonatomic,strong)UILabel*titleLabel;// 标题
//
//        @property(nonatomic,strong)UILabel*classificationLabel;//分类
//        @property(nonatomic,strong)UILabel*positioningAddressLabel;//定位地址
//        @property(nonatomic,strong)UILabel*distanceLabel;//距离
//        @property(nonatomic,strong)UIImageView*theStarImageView;//评级五角星
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
//        [self.contentView addSubview:self.classificationLabel];
//        [self.contentView addSubview:self.positioningAddressLabel];
        [self.contentView addSubview:self.distanceLabel];
        [self.contentView addSubview:self.theStarImageView];
//        @property(nonatomic,strong)UILabel*fullReductionLabel;//满减活动标签
//        @property(nonatomic,strong)UILabel*fullReductionTextLabel;//满减活动内容
//        @property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
//        @property(nonatomic,strong)UILabel*atDiscountTextLabel;//打折活动内容
        [self.contentView addSubview:self.fullReductionLabel];
        [self.contentView addSubview:self.fullReductionTextLabel];
        [self.contentView addSubview:self.atDiscountLabel];
        [self.contentView addSubview:self.atDiscountTextLabel];

        
        
    }
    
    return self;
}
-(void)setTypeString:(NSString *)typeString{
    _typeString=typeString;
    
}
-(void)setModel:(commodle *)model{
    _model =model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.mainImageUrl]];
    self.titleLabel.text=[NSString stringWithFormat:@"%@  (%@)",model.name,model.streetName];
//    self.classificationLabel.text=model.category;
   
    self.distanceLabel.alpha=0.f;
    if ([self.typeString isEqualToString:@"2"]) {
          self.distanceLabel.alpha=1.f;
         self.distanceLabel.text =[NSString stringWithFormat:@"%.2f km",[model.distance floatValue]/1000];
    }
   
//    self.positioningAddressLabel.text=[NSString stringWithFormat:@"     %@",model.streetName];
    if (![model.acModel.atDiscounttypeString isEqualToString:@"-1"]) {
        
        self.atDiscountLabel.alpha=1.f;
        self.atDiscountTextLabel.alpha=1.f;
        self.atDiscountTextLabel.text =model.acModel.atDiscountactivityString;
    }else{
        self.atDiscountLabel.alpha=0.f;
        self.atDiscountTextLabel.alpha=0.f;
        
    }
    if (![model.acModel.fullReductiontypeString isEqualToString:@"-1"]) {
        self.fullReductionLabel.alpha=1.f;
        self.fullReductionTextLabel.alpha=1.f;
        self.fullReductionTextLabel.text=model.acModel.fullReductioncativityString;
    }else{
        self.fullReductionLabel.alpha=0.f;
        self.fullReductionTextLabel.alpha=0.f;
        
    }
    [self makeWuJiaoXing:[model.grade intValue]];
    
}

-(void)makeWuJiaoXing:(int)num{
    //    _scoreShowsLabel.text=[NSString stringWithFormat:@"%d分",num];
    
    NSString *imageNameString;
    for (int i=0; i<5; i++) {
        if (i>num-1) {
            imageNameString=@"huxingxing";
        }else{
            imageNameString=@"icon_star";
        }
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:imageNameString]];
        image.frame=CGRectMake(i*12,0,12,13);
        [self.theStarImageView addSubview:image];
        
    }
}

//[self.contentView addSubview:self.iconImageView];
-(UIImageView *)iconImageView{
    
    if (!_iconImageView) {
        _iconImageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 75, 75)];
    }
    return _iconImageView;
}
//[self.contentView addSubview:self.titleLabel];
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(95, 10, 200, 20)];
        _titleLabel.textAlignment=NSTextAlignmentLeft;
        _titleLabel.font =[UIFont systemFontOfSize:16 weight:UIFontWeightBold];
    }
    return _titleLabel;
}
//[self.contentView addSubview:self.classificationLabel];
//-(UILabel *)classificationLabel{
//
//    if (!_classificationLabel) {
//        _classificationLabel =[[UILabel alloc]initWithFrame:CGRectMake(95, 60, 200, 15)];
//        _classificationLabel.textAlignment=NSTextAlignmentLeft;
//      _classificationLabel.font =[UIFont systemFontOfSize:15 weight:UIFontWeightBold];
//       _classificationLabel.textColor=[UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1.f];
//        _classificationLabel.alpha=0.f;
//    }
//    return _classificationLabel;
//}
//[self.contentView addSubview:self.positioningAddressLabel];
//-(UILabel *)positioningAddressLabel{
//
//    if (!_positioningAddressLabel) {
//      _positioningAddressLabel =[[UILabel alloc]initWithFrame:CGRectMake(95, 85,ScreenW-105, 15)];
//        _positioningAddressLabel.textAlignment=NSTextAlignmentLeft;
//       _positioningAddressLabel.font =[UIFont systemFontOfSize:14];
//        _positioningAddressLabel.numberOfLines=0; _positioningAddressLabel.textColor=[UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1.f];
//        [_positioningAddressLabel addSubview:self.positioningAddressIconImageView];
//
//    }
//    return _positioningAddressLabel;
//}
-(UILabel *)distanceLabel{
    
    if (!_distanceLabel) {
        _distanceLabel =[[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH-70, 10, 60, 20)];
        _distanceLabel.textAlignment=NSTextAlignmentRight;
        _distanceLabel.font =[UIFont systemFontOfSize:15];
        _distanceLabel.textColor=[UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1.f];
    }
    return _distanceLabel;
}
-(UIImageView *)theStarImageView{
    if (!_theStarImageView) {
       _theStarImageView=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"0"]];
        _theStarImageView.frame=CGRectMake(96, 21+15,100,13);
//        for (int i=0; i<5; i++) {
//            UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
//            image.frame=CGRectMake(i*12, 0,12,13);
//            [_theStarImageView addSubview:image];
//
//        }
    }
    return _theStarImageView;
}
//-(UIImageView *)positioningAddressIconImageView{
//
//
//    if (!_positioningAddressIconImageView) {
//        _positioningAddressIconImageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_location.png"]];
//        _positioningAddressIconImageView.frame=CGRectMake(0, 0, 10, 15);
//    }
//    return _positioningAddressIconImageView;
//}

//@property(nonatomic,strong)UILabel*fullReductionLabel;//满减活动标签

-(UILabel *)fullReductionLabel{
    
    if (!_fullReductionLabel) {
        _fullReductionLabel =[[UILabel alloc]initWithFrame:CGRectMake(93, 0, 0, 0)];
        _fullReductionLabel.text=@"满";
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
        _fullReductionTextLabel.font=[UIFont systemFontOfSize:13];
        
        
    }
    return _fullReductionTextLabel;
}

//@property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
-(UILabel *)atDiscountLabel{
    
    if (!_atDiscountLabel) {
        _atDiscountLabel =[[UILabel alloc]initWithFrame:CGRectMake(93, 0, 0, 0)];
        _atDiscountLabel.text=@"折";
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
        _atDiscountTextLabel.font=[UIFont systemFontOfSize:13];
        
    }
    return _atDiscountTextLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
//    self.distanceLabel.backgroundColor=[UIColor yellowColor];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(70, 15));
    }];
//    self.titleLabel.backgroundColor=[UIColor redColor];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.distanceLabel.mas_left).offset(0);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.centerY.equalTo(self.distanceLabel.mas_centerY);
        make.height.equalTo(@20);
        
    }];
    [self.theStarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(@13);
        
    }];
//    [self.classificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.theStarImageView.mas_bottom).offset(5);
//        make.left.equalTo(self.titleLabel.mas_left);
//        make.right.equalTo(self.contentView.mas_right);
//        make.height.equalTo(@15);
//    }];
//    [self.positioningAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.classificationLabel.mas_bottom).offset(5);
//        make.left.equalTo(self.titleLabel.mas_left);
//        make.right.equalTo(self.contentView.mas_right);
//        make.height.equalTo(@15);
//    }];
    
    CGFloat atDiscounttypeStringHelght=20;
    CGFloat fullReductiontypeStringHelght=20;
    if ([self.model.acModel.atDiscounttypeString isEqualToString:@"-1"]) {
        
        atDiscounttypeStringHelght=0.5;
    }
    if ([self.model.acModel.fullReductiontypeString isEqualToString:@"-1"]) {
        fullReductiontypeStringHelght=0.5;
    }
    
    [self.fullReductionLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.theStarImageView.mas_bottom).offset(5);
        make.left.equalTo(self.titleLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(20, fullReductiontypeStringHelght));
    }];
    
    [self.fullReductionTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fullReductionLabel.mas_top).offset(0);
        make.left.equalTo(self.fullReductionLabel.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(@(fullReductiontypeStringHelght));
    }]; //满减活动内容
//    @property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
    [self.atDiscountLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fullReductionLabel.mas_bottom).offset(5);
        make.left.equalTo(self.titleLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(20, atDiscounttypeStringHelght));
    }];
    [self.atDiscountTextLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.atDiscountLabel.mas_top).offset(0);
        make.left.equalTo(self.atDiscountLabel.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(@(atDiscounttypeStringHelght));
    }];
//    @property(nonatomic,strong)UILabel*atDiscountTextLabel;//打折活动内容
    
    
}

@end
