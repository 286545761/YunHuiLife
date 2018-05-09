//
//  JRBusinessHeaderView.m
//  JRTescoToday
//
//  Created by apple on 2017/12/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRBusinessHeaderView.h"

@interface JRBusinessHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
//认证
@property (weak, nonatomic) IBOutlet UIButton *AuthenticationButton;

@property (weak, nonatomic) IBOutlet UIView *numberView;
@property (weak, nonatomic) IBOutlet UIButton *AccumulativeReward;
@property (weak, nonatomic) IBOutlet UIButton *PurseBalance;
@property (weak, nonatomic) IBOutlet UIButton *OrderToday;

@end

@implementation JRBusinessHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    _numberView.layer.shadowColor = [UIColor groupTableViewBackgroundColor].CGColor;//shadowColor阴影颜色
    _numberView.layer.shadowOffset = CGSizeMake(0,5);//shadowOffset阴影偏移,x向右偏移0，y向下偏移5，默认(0, -3),这个跟shadowRadius配合使用
    _numberView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    _numberView.layer.shadowRadius = 4;//阴影半径，默认3

}

#pragma mark - 店铺
- (IBAction)clickShop:(id)sender {
    [self.delegate pushToShopViewController];
}
#pragma mark - 消息

- (IBAction)clickNews:(id)sender {
    [self.delegate pushToNewsViewController];
}
#pragma mark - 设置

- (IBAction)clickSetUp:(id)sender {
    [self.delegate pushToSetUpViewController];
}
#pragma mark - 二维码

- (IBAction)clickQRCode:(id)sender {
    [self.delegate pushToQRCodeViewController];
}
#pragma mark - 扫码验证

- (IBAction)clickScanCodeTestVoucher:(id)sender {
    [self.delegate pushToScanCodeAndTestVoucherViewController];
}
#pragma mark - 分享好友

- (IBAction)clickShareFriend:(id)sender {
    [self.delegate pushToShareFriendViewController];
}

@end
