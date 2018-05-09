//
//  CLLockNavVC.m
//  CoreLock
//
//  Created by 成林 on 15/4/28.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CLLockNavVC.h"

@interface CLLockNavVC ()
{
    UIImageView *imageView1;
}
@end

@implementation CLLockNavVC


- (void)viewDidLoad {
    [super viewDidLoad];
    imageView1=[[UIImageView  alloc]  initWithImage:[UIImage  imageNamed:@"4-23"]];
    imageView1.frame=CGRectMake(kScreenSize.width/2-65, 114, 130,40);
    [imageView1.layer setCornerRadius:30];
    [self.view addSubview:imageView1];
    //图片点击事件
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor  whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"SET_HAND_PWD1" object:nil];
    [self.navigationBar setBackgroundColor:[UIColor  colorWithHexString:RED_COLOR]];
    
    //tintColor
    self.navigationBar.tintColor = [UIColor  whiteColor];
}
-(void)downLoadFinish
{
   // [self removeFromParentViewController];
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
