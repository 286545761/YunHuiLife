//
//  HomeHear.h
//  XFAppliance
//
//  Created by hduokeji on 16/3/8.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "activityModel.h"

@interface HomeHear : UIView
@property (weak, nonatomic) IBOutlet UILabel *uiJianJieText;
@property (weak, nonatomic) IBOutlet UILabel *name;
-(void)makeWuJiaoXing:(int)num;
@property (weak, nonatomic) IBOutlet UIButton *xiaLaBtn;

@property (weak, nonatomic) IBOutlet UIButton *DiTuDingWei;
@property (weak, nonatomic) IBOutlet UILabel *zhekou;
@property (weak, nonatomic) IBOutlet UILabel *fenshu;
@property (weak, nonatomic) IBOutlet UILabel *name1;
@property (weak, nonatomic) IBOutlet UIButton *maidan;
@property (weak, nonatomic) IBOutlet UIButton *dianhua;
@property (weak, nonatomic) IBOutlet UIButton *bingwei;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fenShuSPace;
@property(nonatomic,strong)UILabel*fullReductionLabel;//满减活动标签
@property(nonatomic,strong)UILabel*fullReductionTextLabel;//满减活动内容
@property(nonatomic,strong)UILabel*atDiscountLabel;//打折活动标签
@property(nonatomic,strong)UILabel*atDiscountTextLabel;//打折活动内容

@property(nonatomic,strong)activityModel*acModel;//打折活动内容


@end
