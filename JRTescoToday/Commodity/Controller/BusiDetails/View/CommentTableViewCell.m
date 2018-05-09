//
//  CommentTableViewCell.m
//  XFAppliance
//
//  Created by hduokeji on 16/5/4.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
     self.backgroundColor=[UIColor  colorWithHexString:@"#f4f4f3"];
   }

@end
