//
//  JRBusinessCollectionReusableView.m
//  JRTescoToday
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRBusinessCollectionReusableView.h"

@interface JRBusinessCollectionReusableView ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
//认证
@property (weak, nonatomic) IBOutlet UIButton *AuthenticationButton;//认证状态
@property (weak, nonatomic) IBOutlet UIButton *storeState;//店铺状态

@property (weak, nonatomic) IBOutlet UIButton *AccumulativeReward;//累计奖励
@property (weak, nonatomic) IBOutlet UIButton *PurseBalance;//钱包余额
@property (weak, nonatomic) IBOutlet UIButton *OrderToday;//今日订单
@end
@implementation JRBusinessCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.AuthenticationButton addTarget:self action:@selector(clickAuthentication:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 认证
- (void)clickAuthentication:(UIButton *)sender {
    [self.delegate pushToAuthenticationViewController];
}
#pragma mark - 我的店铺
- (IBAction)clickMyStore:(id)sender {
    [self.delegate pushToStoreInforViewController];
}

#pragma mark - 二维码

- (IBAction)clickQRCode:(id)sender {
    [self.delegate pushToQRCodeViewController];
}
#pragma mark - 扫码验证

- (IBAction)clickScanCodeTestVoucher:(id)sender {
    [self.delegate pushToScanCodeAndTestVoucherViewController];
}

#pragma mark - 数据处理
- (void)setUpDataWithInfor:(JRBusinessInforModel *)inforModel {
    [self.AccumulativeReward setTitle:[NSString stringWithFormat:@"%.2f",[inforModel.AccumulativeRewardAmount floatValue]] forState:UIControlStateNormal];
    [self.PurseBalance setTitle:[NSString stringWithFormat:@"%.2f",[inforModel.PurseBalanceAmount floatValue]] forState:UIControlStateNormal];
    [self.OrderToday setTitle:[NSString stringWithFormat:@"%.2f",[inforModel.orderTodayAmount floatValue]] forState:UIControlStateNormal];
    [self.storeState setTitle:@"店铺状态" forState:UIControlStateNormal];
    [self.AuthenticationButton setTitle:inforModel.authentivationStateName forState:UIControlStateNormal];
    [self.storeState setImage:[UIImage imageNamed:inforModel.stateImageName] forState:UIControlStateNormal];
    [self.AuthenticationButton setImage:[UIImage imageNamed:inforModel.stateImageName] forState:UIControlStateNormal];
}
@end
