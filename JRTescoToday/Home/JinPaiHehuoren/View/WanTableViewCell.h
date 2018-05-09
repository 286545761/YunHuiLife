//
//  WanTableViewCell.h
//  DHInvestment
//
//  Created by Andy on 16/9/14.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WanTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *QingQiTitle;
@property (weak, nonatomic) IBOutlet UILabel *shouYi;
@property (weak, nonatomic) IBOutlet UILabel *monry;
@property (weak, nonatomic) IBOutlet UILabel *days;
@property (weak, nonatomic) IBOutlet UILabel *stactTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *touZiText;
@property (weak, nonatomic) IBOutlet UILabel *timeText;

@end
