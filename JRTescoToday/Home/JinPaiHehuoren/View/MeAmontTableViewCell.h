//
//  MeAmontTableViewCell.h
//  DHInvestment
//
//  Created by Andy on 16/8/28.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeAmontTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *DingQiTitle;
@property (weak, nonatomic) IBOutlet UILabel *shou;
@property (weak, nonatomic) IBOutlet UIImageView *titleimage;

@property (weak, nonatomic) IBOutlet UILabel *touZiJinE;
@property (weak, nonatomic) IBOutlet UILabel *days;
@property (weak, nonatomic) IBOutlet UILabel *jineText;
@property (weak, nonatomic) IBOutlet UILabel *daysText;
@property (weak, nonatomic) IBOutlet UILabel *timeText;
@property (weak, nonatomic) IBOutlet UILabel *DaoQitimeText;
@property (weak, nonatomic) IBOutlet UIButton *heTong;
@property (weak, nonatomic) IBOutlet UIButton *xiangQingBtn;
@property (weak, nonatomic) IBOutlet UIView *View;
@property (weak, nonatomic) IBOutlet UILabel *days1;
@property (weak, nonatomic) IBOutlet UILabel *days1Text;
@property (weak, nonatomic) IBOutlet UIButton *chankanxiangqingBtn;
@property (weak, nonatomic) IBOutlet UIView *View1;

@end
