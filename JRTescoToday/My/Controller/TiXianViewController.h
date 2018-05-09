//
//  TiXianViewController.h
//  JRTescoToday
//
//  Created by 123 on 2017/8/25.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiXianViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *tixianBtn;
@property (weak, nonatomic) IBOutlet UILabel *viewshangjia;

@property (weak, nonatomic) IBOutlet UIButton *querenTixian;
@property(nonatomic,strong)NSString *shangjia;
@property (weak, nonatomic) IBOutlet UIButton *tixianjiluBtn;
@property (weak, nonatomic) IBOutlet UILabel *BankName;
@property (weak, nonatomic) IBOutlet UILabel *BankCord;
@property (weak, nonatomic) IBOutlet UIView *BankView;

@end
