//
//  FNFenxiangView.h
//  FNInvestment
//
//  Created by hduokeji on 15/12/12.
//  Copyright © 2015年 Beijing Hummingbird Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNFenxiangView : UIView
@property (weak, nonatomic) IBOutlet UIButton *QQ;
@property (weak, nonatomic) IBOutlet UIButton *weixin;
@property (weak, nonatomic) IBOutlet UIButton *xinlang;
@property (weak, nonatomic) IBOutlet UIView *ccc;
@property(nonatomic,strong)UIButton *shareSino;
@property(nonatomic)int string;
@property(nonatomic,strong)  UIButton *btn;
@property(nonatomic,strong)  UIButton *btn1;
@property(nonatomic,strong)  UIButton *btn2;
@property(nonatomic,strong)  UIButton *btn3;

-(void)makeUmengHeadUrl:(NSString *)headUrl andTitle:(NSString *)title andShareContent:(NSString *)content andShare:(int)string;
@end
