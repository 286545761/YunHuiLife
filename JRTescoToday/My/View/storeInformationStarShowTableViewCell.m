//
//  storeInformationStarShowTableViewCell.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/4/2.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//  店铺信息 星级显示

#import "storeInformationStarShowTableViewCell.h"


@interface storeInformationStarShowTableViewCell()
/*
 *评价 文本
 */
@property(strong,nonatomic)UILabel *evaluationOfTextLabel;
/*
 *
 */
@property(strong,nonatomic)UILabel *scoreShowsLabel;
@end;
@implementation storeInformationStarShowTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.evaluationOfTextLabel];
        [self.contentView addSubview:self.scoreShowsLabel];
        
    }
    
    return self;
}
-(UILabel *)evaluationOfTextLabel{
    if (!_evaluationOfTextLabel) {
        _evaluationOfTextLabel =[[UILabel alloc]init];
        _evaluationOfTextLabel.text=@"评价";
        _evaluationOfTextLabel.textColor=[UIColor blackColor];
        _evaluationOfTextLabel.font=[UIFont systemFontOfSize:17 weight:UIFontWeightBold];
        
    }
    
    return  _evaluationOfTextLabel;
}
-(UILabel *)scoreShowsLabel{
    if (!_scoreShowsLabel) {
        _scoreShowsLabel =[[UILabel alloc]init];
        _scoreShowsLabel.textColor=[UIColor blackColor];
        _scoreShowsLabel.text=@"3分";
        _scoreShowsLabel.textAlignment=NSTextAlignmentRight;
        _scoreShowsLabel.font=[UIFont systemFontOfSize:15];
    }
    
    return _scoreShowsLabel;
}
-(void)makeWuJiaoXing:(int)num{
    _scoreShowsLabel.text=[NSString stringWithFormat:@"%d分",num];
    
    NSString *imageNameString;
    for (int i=0; i<5; i++) {
        if (i>num-1) {
            imageNameString=@"huxingxing";
        }else{
            imageNameString=@"icon_star";
        }
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:imageNameString]];
        image.frame=CGRectMake(70+i*12, 14,12,13);
        [self.contentView addSubview:image];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.evaluationOfTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(12);
        make.size.mas_equalTo(CGSizeMake(50, 17));
    }];
    [self.scoreShowsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(12);
        make.size.mas_equalTo(CGSizeMake(50, 17));
    }];
    
}

@end
