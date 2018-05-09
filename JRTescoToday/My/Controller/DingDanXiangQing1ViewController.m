//
//  DingDanXiangQing1ViewController.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/4.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "DingDanXiangQing1ViewController.h"
#import "DDewFootView.h"
#import "DDanHearView.h"
@interface DingDanXiangQing1ViewController ()

@end

@implementation DingDanXiangQing1ViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    self.view.backgroundColor=[UIColor colorWithHexString:All_VIEW_BG_COLOR];
    [self makeUI];
}

#pragma mard 搭建UI界面
- (void)makeUI
{
    DDanHearView *ddan=[[DDanHearView alloc] init];
    ddan.frame=CGRectMake(0, 0, kScreenSize.width,220);
    [self.view addSubview:ddan];
    
    DDewFootView *ddew=[[DDewFootView alloc] init];
    ddew.frame=CGRectMake(0,  220+64, kScreenSize.width, 300);
    [self.view addSubview:ddew];
}

@end
