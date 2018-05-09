//
//  BianJiShangpinController.h
//  JRTescoToday
//
//  Created by 123 on 2017/8/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BianJiShangpinController : BaseController
@property (weak, nonatomic) IBOutlet UIButton *tianjiatupian;
@property(nonatomic,strong)NSString *bianji;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *miaoshu;
@property(nonatomic,strong)NSString *categoryId;
@property (weak, nonatomic) IBOutlet UITextField *jiage;

@property(nonatomic,strong)NSString *mingcheng;
@property(nonatomic,strong)NSString *miaoshu123;
@property(nonatomic,strong)NSString *danjia;
@property(nonatomic,strong)NSString *guie1;
@property(nonatomic,strong)NSString *fengleiName;
@property(nonatomic,strong)NSString *idn;
@property(nonatomic,strong)NSString *imagecc;
@property (weak, nonatomic) IBOutlet UITextField *guige;

@property (weak, nonatomic) IBOutlet UILabel *shuiguo;
@property (weak, nonatomic) IBOutlet UIImageView *imagewwww;

@property (weak, nonatomic) IBOutlet UIButton *addFenlei;

@end
