//
//  JRHomeHeaderView.m
//  JRTescoToday
//
//  Created by apple on 2017/11/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRHomeHeaderView.h"
#import "CrossDevicesLayout.h"
typedef NS_ENUM(NSUInteger, HomeHeaderButton) {
    HomeHeaderButtonDeliciousFood = 0, //美食
    HomeHeaderButtonHotel = 1,//酒店
    HomeHeaderButtonEntertainment = 2, //休闲娱乐
    HomeHeaderButtonBeauty = 3, //丽人
    HomeHeaderButtonLifeService = 4, //生活服务
    HomeHeaderButtonTravelAround = 5, //生活周边
    HomeHeaderButtonKTV = 6, //KTV
    HomeHeaderButtonEducationTraining = 7, //教育培训
    HomeHeaderButtonBarbecue = 8, //烤肉烧烤
    HomeHeaderButtonPedicureMassage = 9, //足疗按摩
    HomeHeaderButtonHotPot = 10, //火锅
    HomeHeaderButtonWeddingPhotography = 11, //结婚摄影
    HomeHeaderButtonMotherInfant = 12, //母婴亲子
    HomeHeaderButtonBuffet = 13, //自助餐
    HomeHeaderButtonAllCategories = 14, //全部分类
    
    HomeHeaderButtonBanner = 15, //广告页
};

@interface JRHomeHeaderView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fromKTVToEndButtonViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fromDelisousTolifeButtonViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *activityViewHeight;
@end
@implementation JRHomeHeaderView
- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBanner:)];
    self.bannerImageView.userInteractionEnabled = YES;
    [self.bannerImageView addGestureRecognizer:tap];

}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.bannerViewHeight.constant = CGCrossDevicesHeight(150);
    self.fromDelisousTolifeButtonViewHeight.constant = ([UIScreen mainScreen].bounds.size.width/5);
    self.fromKTVToEndButtonViewHeight.constant = ([UIScreen mainScreen].bounds.size.width/5) * 2;
    self.activityViewHeight.constant = CGCrossDevicesHeight(95);
}
//Banner
- (void)tapBanner:(UITapGestureRecognizer *)tap {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonBanner];
}
//美食
- (IBAction)clickDeliciousFood:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonDeliciousFood];
}
//酒店
- (IBAction)clickHotel:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonHotel];
}
//休闲娱乐
- (IBAction)clickEntertainment:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonEntertainment];
}
//丽人
- (IBAction)clickBeauty:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonBeauty];
}
//生活服务
- (IBAction)clickLifeService:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonLifeService];
}
//周边游
- (IBAction)clickTravelAround:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonTravelAround];
}
//KTV
- (IBAction)clickKTV:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonKTV];
}
//教育培训
- (IBAction)clickEducationTraining:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonEducationTraining];
}
//烧烤烤肉
- (IBAction)clickBarbecue:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonBarbecue];
}
//足疗按摩
- (IBAction)clickPedicureMassage:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonPedicureMassage];
}
//火锅
- (IBAction)clickHotPot:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonHotPot];
}
//结婚摄影
- (IBAction)clickWeddingPhotography:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonWeddingPhotography];
}
//母婴亲子
- (IBAction)clickMotherInfant:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonMotherInfant];
}
//自助餐
- (IBAction)clickBuffet:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonBuffet];
}
//全部分类
- (IBAction)clickAllCategories:(id)sender {
    [self.delegate pushToPointViewControllerWithType:HomeHeaderButtonAllCategories];
}

@end
