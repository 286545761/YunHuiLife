//
//  DHNavigationController.m
//  DHInvestment
//
//  Created by JJS on 15/8/25.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "DHNavigationController.h"
#import "LoginController.h"
#import "DHMainController.h"
#import "UIBarButtonItem+DH.h"

@interface DHNavigationController ()

@end

@implementation DHNavigationController

/**
 *  初始化（每一个类只会调用一次）
 */
+ (void)initialize
{
    // 获得bar对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];


navBar.barTintColor =RGB(255, 199,46);
    
    // 设置状态栏字体
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // 设置文字样式
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [navBar setTitleTextAttributes:attrs];
    
    // 设置导航栏按钮的主题
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    // 设置按钮的文字样式
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [barItem setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:itemAttrs forState:UIControlStateHighlighted];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *backButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [backButton setImage:[UIImage imageNamed:@"nav_return_all"] forState:UIControlStateNormal];
        backButton.imageEdgeInsets=UIEdgeInsetsMake(0, -40, 0, 0);
        UIBarButtonItem *leftBackBar=[[UIBarButtonItem alloc]initWithCustomView: backButton];
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem =leftBackBar;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
