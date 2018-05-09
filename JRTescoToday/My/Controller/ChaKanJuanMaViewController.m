//
//  ChaKanJuanMaViewController.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/5.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ChaKanJuanMaViewController.h"
#import "SaKanQuanMaView.h"
@interface ChaKanJuanMaViewController ()

@end

@implementation ChaKanJuanMaViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    [self makeUI];//调用创建UI方法
}
#pragma mark 创建UI
-(void)makeUI
{
    SaKanQuanMaView *sakan=[[SaKanQuanMaView alloc] init];
    sakan.frame=CGRectMake(0,64, kScreenSize.width, kScreenSize.height);
    [self.view addSubview:sakan];
}

@end
