//
//  bannerActivitiesTableViewCell.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
// banner点击活动列表

#import "bannerActivitiesTableViewCell.h"
@interface bannerActivitiesTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titileLabel;
//距离
@property (weak, nonatomic) IBOutlet UILabel *distanceLable;
@property (weak, nonatomic) IBOutlet UIImageView *addressIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
//满减文本
@property (weak, nonatomic) IBOutlet UILabel *fullReductionTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *fullReductionLabel;
// 折扣文本
@property (weak, nonatomic) IBOutlet UILabel *discountTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@end

@implementation bannerActivitiesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.fullReductionTextLabel.layer.cornerRadius=2.f;
    self.fullReductionTextLabel.layer.borderWidth=1.f;
    self.fullReductionTextLabel.layer.borderColor=RGB(240, 64, 58).CGColor;
    self.fullReductionTextLabel.backgroundColor=RGBA(240, 64, 58, 0.2);
    self.fullReductionTextLabel.layer.masksToBounds=YES;
    
    self.discountTextLabel.layer.cornerRadius=2.f;
    self.discountTextLabel.layer.borderWidth=1.f;
    self.discountTextLabel.layer.borderColor=RGB(5, 168, 168).CGColor;
    self.discountTextLabel.backgroundColor=RGBA(5, 168, 168, 0.2);
    self.discountTextLabel.layer.masksToBounds=YES;
    self.contentView.userInteractionEnabled=YES;
    UITapGestureRecognizer *addressIconTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(MapNavigation)];
    
    self.addressIconImageView.userInteractionEnabled=YES;
    self.addressLabel.userInteractionEnabled=YES;
    UITapGestureRecognizer *addressLabelTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(MapNavigation)];
    [self.addressIconImageView addGestureRecognizer:addressIconTap];
    [self.addressLabel addGestureRecognizer:addressLabelTap];
}

#pragma mark ---------地图导航----------
-(void)MapNavigation{
    
    if (self.mapNavigationBlock) {
        self.mapNavigationBlock(self.index);
    }
    
    
}
-(void)setFrame:(CGRect)frame{
    frame.origin.x += 10;
    
    frame.size.width -= 2 * 10;
    [super setFrame:frame];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
    [self.distanceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(20);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 12));
    }];
    [self.titileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.centerY.equalTo(self.distanceLable.mas_centerY);
        make.right.equalTo(self.distanceLable.mas_left).offset(-5);
        make.height.equalTo(@15);
        
    }];
    
    [self.addressIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titileLabel.mas_left).offset(-2);
        make.top.equalTo(self.titileLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(8, 10));
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressIconImageView.mas_right).offset(5);
        make.top.equalTo(self.titileLabel.mas_bottom).offset(10);
        make.height.equalTo(@12);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    
    
    
    
    [self.fullReductionTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titileLabel.mas_left).offset(0);
        make.top.equalTo(self.addressIconImageView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(35, 14));
        
    }];
    [self.fullReductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fullReductionTextLabel.mas_right).offset(5);
        make.centerY.equalTo(self.fullReductionTextLabel.mas_centerY);
        make.height.equalTo(@12);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    //    @property (weak, nonatomic) IBOutlet UILabel *discountTextLabel;
    [self.discountTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titileLabel.mas_left).offset(0);
        make.top.equalTo(self.fullReductionLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(35, 14));
    }];
    [self.discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.discountTextLabel.mas_right).offset(5);
        make.centerY.equalTo(self.discountTextLabel.mas_centerY);
        
//        make.top.equalTo(self.fullReductionLabel.mas_bottom).offset(10);
        make.height.equalTo(@12);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
  
    
}
@end
