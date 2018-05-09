//
//  JRDigitalVerificationCell.m
//  JRTescoToday
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRDigitalVerificationCell.h"

@interface JRDigitalVerificationCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UILabel *codeNumber;

@end
@implementation JRDigitalVerificationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setupData:(JRBusinessCouponsModel *)model {
    self.title.text = model.goodsName;
    self.price.text = [NSString stringWithFormat:@"¥%@",model.goodsPrice];
    NSMutableString *string = [model.code mutableCopy];
    for (NSInteger i = string.length - 4; i > 0; i -= 4) {
        [string insertString:@" " atIndex:i];
    }

    self.codeNumber.text = [NSString stringWithFormat:@"%@",string];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
