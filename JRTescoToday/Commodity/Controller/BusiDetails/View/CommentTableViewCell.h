//
//  CommentTableViewCell.h
//  XFAppliance
//
//  Created by hduokeji on 16/5/4.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameTitle;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end
