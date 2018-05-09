//
//  CommSpotViewController.h
//  JRTescoToday
//
//  Created by 123 on 2017/8/22.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "activityModel.h"

@interface CommSpotViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *shanjiaxinxi;
@property (nonatomic,strong) NSString *strbtn;// 商品ID
@property (nonatomic,strong) NSString *strname;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *yuanjia;
@property(nonatomic,strong)NSString *code;// 商店ID
@property(nonatomic,strong)NSString *shopingCode;// 商店编码
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *line12;
@property(nonatomic,copy)NSString *theOriginalPrice;// 原单价

@property(nonatomic,copy)NSString *orderType;// (integer): 1团购2优惠买单
/*
 *<# #>
 */
@property(strong,nonatomic)activityModel *acModel;
@end
