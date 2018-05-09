//
//  JRDigitalCell.m
//  JRTescoToday
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRDigitalCell.h"
//#import "JRBusinessVoucherCore.h"
#import "MBProgressHUD+NJ.h"
@interface JRDigitalCell ()

@end
@implementation JRDigitalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.verifyCouponsButton addTarget:self action:@selector(clickVerify:) forControlEvents:UIControlEventTouchUpInside];

}
- (void)clickVerify:(UIButton *)sender {
//    [JRBusinessVoucherCore testCouponsWithNumber:self.codeNumberTextField.text andChannel:TestCouponsType_Input Successed:^(NSDictionary *data) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD showError:@"兑换成功"];
//        });
//    } Faild:^(NSString *erro) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD showError:erro];
//        });
//    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
