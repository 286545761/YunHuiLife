//
//  storeInformationTableViewCell.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/30.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//  订单详情  店铺信息

#import "storeInformationTableViewCell.h"

@interface storeInformationTableViewCell ()
/*
 *商家信息文本
 */
@property(strong,nonatomic)UILabel *shopInfoTetxLabel;


/*
 *右边分割线
 */
@property(strong,nonatomic)UIImageView *rightMakeLingImageView;


/*
 *横分割线
 */
@property(strong,nonatomic)UIImageView *crossMakeLingImageView;
/*
 *店名
 */
@property(strong,nonatomic)UILabel *nameLabel;


/*
 *定位小图标
 */
@property(strong,nonatomic)UIImageView *addressIconImageView;

/*
 *地址
 */
@property(strong,nonatomic)UILabel *addressLabel;
/*
 *拨打电话
 */
@property(strong,nonatomic)UIButton *phoneButton;



@end



@implementation storeInformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel =[[UILabel alloc]init];
        _addressLabel.textColor=RGB(103, 103, 103);
        _addressLabel.font=[UIFont systemFontOfSize:14];
    }
    
    return _addressLabel;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.rightMakeLingImageView];
        [self.contentView addSubview:self.shopInfoTetxLabel];
        [self.contentView addSubview:self.crossMakeLingImageView];
        [self.contentView addSubview: self.nameLabel];
        [self.contentView addSubview:  self.addressIconImageView];
        [self.contentView addSubview:self.addressLabel];
        [self.contentView addSubview:self.phoneButton];
    }
    
    return self;
}
-(void)setModel:(JRBusinessOrderModel *)model{
    _model=model;
    self.nameLabel.text=model.merchantName;
    self.addressLabel.text=model.merchantAddress;
    

    
    
    
}
-(UIButton *)phoneButton{
    if (!_phoneButton) {
        _phoneButton=[[UIButton alloc]init];
//        _phoneButton.backgroundColor=[UIColor redColor];
        [_phoneButton setImage:[UIImage imageNamed:@"btn_phone.png"] forState:UIControlStateNormal];
        [_phoneButton addTarget:self action:@selector(phoneAction)  forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _phoneButton;
}
-(void)phoneAction{
    __weak typeof(self) weakSelf=self;
    if (weakSelf.phoneCallBlock) {
        weakSelf.phoneCallBlock();
    }
    
    
    
    
}

-(UIImageView *)crossMakeLingImageView{
    if (!_crossMakeLingImageView) {
        _crossMakeLingImageView =[[UIImageView alloc]init];
        _crossMakeLingImageView.backgroundColor=RGB(203, 203, 203);
    }
    
    
    return _crossMakeLingImageView;
}

-(UILabel *)shopInfoTetxLabel{
    if (!_shopInfoTetxLabel) {
        _shopInfoTetxLabel =[[UILabel alloc]init];
        _shopInfoTetxLabel.text=@"商家信息";
        _shopInfoTetxLabel.textColor=[UIColor blackColor];
        _shopInfoTetxLabel.font=[UIFont systemFontOfSize:17 weight:UIFontWeightBold];
        
        
    }
    
    return _shopInfoTetxLabel;
}

-(UIImageView *)rightMakeLingImageView{
    if (!_rightMakeLingImageView) {
        _rightMakeLingImageView =[[UIImageView alloc]init];
        _rightMakeLingImageView.backgroundColor =[UIColor redColor];
    }
    
    return _rightMakeLingImageView;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel =[[UILabel alloc]init];
        _nameLabel.font=[UIFont systemFontOfSize:14 ];
        
    }
    
    return _nameLabel;
}
-(UIImageView *)addressIconImageView{
    if (!_addressIconImageView) {
        _addressIconImageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_location.png"]];
    }
    
    return _addressIconImageView;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.rightMakeLingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(2.5, 20));
    }];
    [self.shopInfoTetxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightMakeLingImageView.mas_right).offset(20);
        make.centerY.equalTo(self.rightMakeLingImageView.mas_centerY);
        
        make.height.equalTo(@20);
        make.right.equalTo(self.contentView.mas_right);
        
        
        
        
    }];
    [self.crossMakeLingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.rightMakeLingImageView.mas_bottom).offset(15);
            make.height.equalTo(@1);
    }];
    
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightMakeLingImageView.mas_left);
        make.top.equalTo(self.crossMakeLingImageView.mas_bottom).offset(15);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@15);
        
    }];
    [self.addressIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
        
        make.size.mas_equalTo(CGSizeMake(10, 15));
        
        
        
    }];
    [self.phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.right.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.addressIconImageView.mas_centerY);
        make.left.equalTo(self.addressIconImageView.mas_right).offset(5);
        make.right.equalTo(self.phoneButton.mas_left);
        
        
        
        
        

        
        
        
    }];
    



}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
