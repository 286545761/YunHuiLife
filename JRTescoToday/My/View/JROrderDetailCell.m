//
//  JROrderDetailCell.m
//  JRTescoToday
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JROrderDetailCell.h"
#import "UIImageView+WebCache.h"
@interface JROrderDetailCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *volumeSizeLabelHeight;
@property (weak, nonatomic) IBOutlet UILabel *volumeSizeLabel;// 卷码


@property (weak, nonatomic) IBOutlet UILabel *statusLabel;// 消费状态
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *volumeSizeLabelTop;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *productDescriptionHeight;
@property (weak, nonatomic) IBOutlet UIView *productDescriptionView;// 描述
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;// 用户头像
//@property (weak, nonatomic) IBOutlet UILabel *groupPurchaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;// 有效期
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;// 订单总价
@property (weak, nonatomic) IBOutlet UILabel *payLabel;//付款金额
@property (weak, nonatomic) IBOutlet UILabel *orderLabel;//订单号
@property (weak, nonatomic) IBOutlet UILabel *payTimeLabel;// 付款时间
//@property (weak, nonatomic) IBOutlet UIImageView *userIconImage;
//@property (weak, nonatomic) IBOutlet UIButton *callButton;
//
//@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation JROrderDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _productDescriptionView.hidden = NO;
    _productDescriptionHeight.constant = 200;
}
- (void)setUpData:(JRBusinessOrderModel *)model {
    //优惠买单
    self.volumeSizeLabel.text=[NSString stringWithFormat:@"    劵码 %@",model.code];
    if ([model.orderType integerValue] == 2) {
        self.productDescriptionHeight.constant = 0;
        self.productDescriptionView.hidden = YES;
        self.volumeSizeLabel.hidden=YES;
         self.volumeSizeLabelHeight.constant=0;
        self.volumeSizeLabelTop.constant=0;
    }
    //团购
    if ([model.orderType integerValue] == 1) {
        self.productDescriptionHeight.constant = 200;
        self.productDescriptionView.hidden = NO;
          self.volumeSizeLabel.hidden=NO;
        self.volumeSizeLabelHeight.constant=40;
        self.volumeSizeLabelTop.constant=10;
    }

    self.iconImageView.layer.cornerRadius=0.5;

    self.iconImageView.layer.borderColor=RGB(253, 145, 150).CGColor;
    self.iconImageView.layer.masksToBounds=YES;
//    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.merchantImg]];
//    [self.userIconImage sd_setImageWithURL:[NSURL URLWithString:model.merchantImg]];
    self.nameLabel.text = model.orderName;
    NSString *statusStr;
    switch ([model.status integerValue]) {
        case -3:
            statusStr = @"已取消";
            break;
        case -2:
            statusStr = @"申请取消";
            break;
        case -1:
            statusStr = @"失败";
            break;
        case 0:
            statusStr = @"待付款";
            break;
        case 1:
            statusStr = @"待消费";
            break;
        case 2:
            statusStr = @"已消费 待评价";
            break;
        case 3:
            statusStr = @"已完成";
            break;
        default:
            break;
    }
    self.statusLabel.text = statusStr;
    self.timeLabel.text = [NSString stringWithFormat:@"有效期至: %@",model.goodsValidityTime];
    self.tagLabel.text = model.goodsLabel;
    self.descriptionLabel.text =[NSString stringWithFormat:@"描述: %@", model.goodsDescribe];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",model.amount];
//    self.saleLabel.text = model.discountAmount;
    self.payLabel.text = [NSString stringWithFormat:@"¥ %@",model.realAmount];
    self.orderLabel.text = model.orderCode;
    self.payTimeLabel.text = model.time;
    self.payTimeLabel.textAlignment=NSTextAlignmentLeft;
//    self.phoneLabel.text = model.userPhone;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
