//
//  CommHear.h
//  JRTescoToday
//
//  Created by 123 on 2017/8/22.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommHear : UIView
@property (weak, nonatomic) IBOutlet UIButton *QuanCheng;
@property (weak, nonatomic) IBOutlet UIButton *zhinengpaixu;
@property (weak, nonatomic) IBOutlet UIButton *shuaxin;
@property (weak, nonatomic) IBOutlet UILabel *weizhi;
@property (weak, nonatomic) IBOutlet UIButton *quanbufenlei;
@property (weak, nonatomic) IBOutlet UIView *shuaXinParentView;
- (void)startAnimation;
- (void)stopAnimation;
@property (weak, nonatomic) IBOutlet UIButton *btnQuanCheng;
@property (weak, nonatomic) IBOutlet UIButton *btnZhiNengpaixun;
@property (weak, nonatomic) IBOutlet UIButton *QuanbuFenLei;
@end
