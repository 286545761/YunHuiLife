//
//  JRStoreInforCell.m
//  JRTescoToday
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRStoreInforCell.h"
#import "UIImageView+WebCache.h"
@interface JRStoreInforCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *storeName;
@property (weak, nonatomic) IBOutlet UILabel *storeAddress;
@property (weak, nonatomic) IBOutlet UILabel *storeDetailAddress;
@property (weak, nonatomic) IBOutlet UILabel *storePhone;
@property (weak, nonatomic) IBOutlet UILabel *storeEmail;


@property (weak, nonatomic) IBOutlet UILabel *storeInstruction;

@end
@implementation JRStoreInforCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setUpData:(JRBusinessStoreInforModel *)model {
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.storeName.text = model.name;
    self.storeAddress.text = model.position;
    self.storeDetailAddress.text = model.address;
    self.storePhone.text = model.phone;
    self.storeName.text = model.email;
    self.storeInstruction.text = model.info;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
