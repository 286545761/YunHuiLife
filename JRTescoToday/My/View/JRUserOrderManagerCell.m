//
//  JRUserOrderManagerCell.m
//  JRTescoToday
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRUserOrderManagerCell.h"
#import "UIImageView+WebCache.h"
@interface JRUserOrderManagerCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *groupPurchaseLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftautrolFloat;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
/*
 * 评价或者查看二维码
 */

@property(strong,nonatomic)UIButton *evaluationOrQrCodeButton;
/*
 * 评价或者查看二维码
 */

@property(strong,nonatomic)UIButton *ancelTheOrderButton;
@end

@implementation JRUserOrderManagerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.contentView addSubview:self.evaluationOrQrCodeButton];
    [self.contentView addSubview:self.ancelTheOrderButton];

    
}
-(UIButton *)ancelTheOrderButton{
    
    if (!_ancelTheOrderButton) {
        _ancelTheOrderButton =[[UIButton alloc]init];
        [_ancelTheOrderButton setTitle:@"取消订单" forState:UIControlStateNormal];
//        [_ancelTheOrderButton setTitle:@"查看卷码" forState:UIControlStateSelected];
    _ancelTheOrderButton.layer.cornerRadius=5.f;
       _ancelTheOrderButton.layer.borderColor=[UIColor colorWithRed:252/255.f green:49/255.f blue:77/255.f alpha:1.f].CGColor;
        _ancelTheOrderButton.layer.borderWidth=1.f;
       _ancelTheOrderButton.layer.masksToBounds=YES;
        [_ancelTheOrderButton setTitleColor:[UIColor colorWithRed:252/255.f green:49/255.f blue:77/255.f alpha:1.f] forState:UIControlStateNormal];
        [_ancelTheOrderButton addTarget:self action:@selector(ancelTheOrderActiocn) forControlEvents:UIControlEventTouchUpInside];
          _ancelTheOrderButton.titleLabel.font=[UIFont systemFontOfSize:14];
//        [_ancelTheOrderButton setTitleColor:[UIColor colorWithRed:252/255.f green:49/255.f blue:77/255.f alpha:1.f] forState:UIControlStateSelected];
    }
    return _ancelTheOrderButton;
}
-(void)ancelTheOrderActiocn{
    if (self.cancelTheOrderBlock) {
        self.cancelTheOrderBlock(self.indexRow);
    }
    
}
-(UIButton *)evaluationOrQrCodeButton{
    if (!_evaluationOrQrCodeButton) {
        _evaluationOrQrCodeButton =[[UIButton alloc]init];
        [_evaluationOrQrCodeButton setTitle:@"去评价" forState:UIControlStateNormal];
         [_evaluationOrQrCodeButton setTitle:@"查看券码" forState:UIControlStateSelected];
        _evaluationOrQrCodeButton.layer.cornerRadius=5.f;
        _evaluationOrQrCodeButton.layer.borderColor=[UIColor colorWithRed:252/255.f green:49/255.f blue:77/255.f alpha:1.f].CGColor;
        _evaluationOrQrCodeButton.layer.borderWidth=1.f;
        _evaluationOrQrCodeButton.layer.masksToBounds=YES;
        [_evaluationOrQrCodeButton setTitleColor:[UIColor colorWithRed:252/255.f green:49/255.f blue:77/255.f alpha:1.f] forState:UIControlStateNormal];
            [_evaluationOrQrCodeButton setTitleColor:[UIColor colorWithRed:252/255.f green:49/255.f blue:77/255.f alpha:1.f] forState:UIControlStateSelected];
        _evaluationOrQrCodeButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [_evaluationOrQrCodeButton addTarget:self action:@selector(evaluationOrQrCodeAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _evaluationOrQrCodeButton;
}
-(void)evaluationOrQrCodeAction:(UIButton*)actionButton{
    if (actionButton.selected) {// 二维码
        if (self.evaluationOrQrCodeBlock) {
            self.evaluationOrQrCodeBlock(@"1", self.indexRow);
            //0 去评价 1 二维码支付
        }
    }else{// 去评价
        
        if (self.evaluationOrQrCodeBlock) {
             self.evaluationOrQrCodeBlock(@"0", self.indexRow);
            
        }
        
    }

    
    
}
//goodsCount (integer): 1团购数量 ,
//goodsDescribe (string, optional): 1团购描述 ,
//goodsLabel (string, optional): 1团购标签 ,
//goodsValidityTime (string, optional): 1团购有效期 ,
//id (string, optional): 订单Id ,
//merchantId (string, optional): 商铺Id ,
//orderCode (string, optional): 订单编号 ,
//orderName (string, optional): 1团购名称 ,
//orderType (integer): 1团购2优惠买单 ,
//realAmount (number, optional): 付款金额 ,
//status (integer): 订单状态 0待付款，1待消费，2已消费 待评价，-1失败，3已完成，-2申请取消-3已取消 , ,
//time (string, optional): 付款时间 ,
//userImg (string, optional): 用户头像 ,
//userPhone (string, optional): 用户手机号
-(void)setIndexRow:(NSInteger)indexRow{
    _indexRow=indexRow;
    
    
}
- (void)setUpData:(JRBusinessOrderModel *)model {

    
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.merchantImg]];
    self.nameLabel.text =[NSString stringIsNull:model.orderName];

    self.priceLabel.text = [NSString stringWithFormat:@"总价: ¥%@",[NSString stringIsNull:model.realAmount]];
    self.timeLabel.text = [NSString stringWithFormat:@"有效期至:%@",[NSString stringIsNull:model.goodsValidityTime]];
       self.numberLabel.text=[NSString stringWithFormat:@"数量:%@",[NSString stringIsNull:model.goodsCount]];
    NSString *statusStr;
    switch ([model.status integerValue]) {
        case -3:
              self.numberLabel.alpha=1.f;
            self.priceLabel.alpha=1.f;
            self.evaluationOrQrCodeButton.alpha=0.f;
            self.ancelTheOrderButton.alpha=0.f;
            statusStr = @"已取消";
            break;
        case -2:
              self.numberLabel.alpha=1.f;
                        self.priceLabel.alpha=1.f;
            self.evaluationOrQrCodeButton.alpha=0.f;
            self.ancelTheOrderButton.alpha=0.f;
            statusStr = @"申请取消";
            break;
        case -1:
              self.numberLabel.alpha=1.f;
                      self.priceLabel.alpha=1.f;
            self.evaluationOrQrCodeButton.alpha=0.f;
            self.ancelTheOrderButton.alpha=0.f;
            statusStr = @"失败";
            break;
        case 0:
              self.numberLabel.alpha=1.f;
               self.priceLabel.alpha=1.f;
            self.evaluationOrQrCodeButton.alpha=0.f;
            self.ancelTheOrderButton.alpha=0.f;
            statusStr = @"待付款";
            
            break;
        case 1:
              self.numberLabel.alpha=1.f;
            self.evaluationOrQrCodeButton.alpha=1.f;
            self.ancelTheOrderButton.alpha=1.f;
             self.evaluationOrQrCodeButton.selected=YES;
                        self.priceLabel.alpha=1.f;
            statusStr = @"待消费";
            break;
        case 2:
            
            self.evaluationOrQrCodeButton.alpha=1.f;
            self.ancelTheOrderButton.alpha=0.f;
             self.evaluationOrQrCodeButton.selected=NO;
            self.timeLabel.text = [NSString stringWithFormat:@"有效期至:%@",[NSString stringIsNull:model.time]];
            self.numberLabel.alpha=1.f;
          self.priceLabel.alpha=1.f;
       if ([model.orderType isEqualToString:@"2"]){
                
           self.priceLabel.alpha=0.f;
           self.numberLabel.alpha=0.f;
           self.evaluationOrQrCodeButton.alpha=0.f;
           self.ancelTheOrderButton.alpha=0.f;

           self.nameLabel.text=[NSString stringWithFormat:@"付款金额: ¥%@",model.realAmount];
           self.timeLabel.text = [NSString stringWithFormat:@"下单时间:%@",[NSString stringIsNull:model.time]];
           break;
                
                
            }
            
            
            
            
//             self.nameLabel.text = [NSString stringWithFormat:@"总价:  ¥%@",[NSString stringIsNull:model.realAmount]];
            statusStr = @"已消费 待评价";
            break;
        case 3:
            self.priceLabel.alpha=0.f;
            self.numberLabel.alpha=0.f;
            self.evaluationOrQrCodeButton.alpha=0.f;
            self.ancelTheOrderButton.alpha=0.f;
            statusStr = @"已完成";
            self.nameLabel.text=[NSString stringWithFormat:@"付款金额: ¥%@",model.realAmount];
             self.timeLabel.text = [NSString stringWithFormat:@"下单时间:%@",[NSString stringIsNull:model.time]];
            break;
        default:
            break;
    }
    if ([model.orderType isEqualToString:@"1"]) {
        self.groupPurchaseLabel.alpha=1.f;
        self.leftautrolFloat.constant=40.f;
    }else if ([model.orderType isEqualToString:@"2"]){
        
        self.groupPurchaseLabel.alpha=0.f;
        self.leftautrolFloat.constant=15.f;
        
    
        
    }
    self.statusLabel.text = statusStr;

 
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    [self.evaluationOrQrCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
  
    [self.ancelTheOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.evaluationOrQrCodeButton.mas_left).offset(-10);
        make.bottom.equalTo(self.evaluationOrQrCodeButton.mas_bottom).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
    
}
@end
