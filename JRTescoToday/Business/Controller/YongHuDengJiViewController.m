//
//  YongHuDengJiViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/11.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "YongHuDengJiViewController.h"

@interface YongHuDengJiViewController ()

@end

@implementation YongHuDengJiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
      self.navigationController.navigationBarHidden=NO;
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];;
    [super viewDidLoad]; self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
}

@end
