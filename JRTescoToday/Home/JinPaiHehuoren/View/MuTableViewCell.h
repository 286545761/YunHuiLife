//
//  MuTableViewCell.h
//  DHInvestment
//
//  Created by Andy on 16/9/14.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *shouyi;
@property (weak, nonatomic) IBOutlet UILabel *monry;
@property (weak, nonatomic) IBOutlet UILabel *days;
@property (weak, nonatomic) IBOutlet UILabel *shouyiText;
@property (weak, nonatomic) IBOutlet UILabel *qiXianText;
@property (weak, nonatomic) IBOutlet UIButton *heTong;

@end
