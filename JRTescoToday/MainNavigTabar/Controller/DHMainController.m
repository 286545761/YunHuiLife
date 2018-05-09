//
//  DHMainController.m
//  DHInvestment
//
//  Created by JJS on 15/9/6.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.89638f535908e7b15e48e9a9b1945c7fdc28fc96
//
#import "HomeController.h"
#import "CommodityController.h"
#import "DHNavigationController.h"
#import "DHTabBar.h"
#import "LoginController.h"
#import "DHMainController.h"
#import "LoginController.h"
#import "UserAccount.h"
#import "MyController.h"
#import "DCTabBar.h"
//#import "DuMEViewController.h"
//#import "DHFinancingController.h"
#import "LoginController.h"
#import "CLLockVC.h"
#import "BusinessUserViewController.h"
#import "QRCodeGenerateVC.h"
@interface DHMainController()<DHTabBarDelegate,UITabBarControllerDelegate>
{
    DHTabBar *_customTabbar;
   
}
@end


@implementation DHMainController
 static DHMainController *_mainC;

/**
 *  代理方法
 */


- (void)tabBar:(DHTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish123) name:@"SET_HAND_PWD" object:nil];
    if (![FNUserDefaults objectForKey:@"usersid"]&&to==2) {
        LoginController *login=[[LoginController alloc] init];
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:login];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        return;
    }
    else
    {
      self.selectedIndex = to;
    
    }
    
}

+(instancetype)shareMain
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_mainC==nil) {
            _mainC=[[DHMainController alloc] init];
        }
    });
  
   
    
    return _mainC;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    //在多线程有问题
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    _mainC=[[super allocWithZone:zone] init];
    });
   
    return _mainC;
}
-(void)downLoadFinish123
{
  
    BOOL hasPwd = [CLLockVC hasPwd];
  
    
    if ([[FNUserDefaults objectForKey:@"headPassword"] isEqualToString:@"YES"] && [UserAccount getUserLoginInfo].userPassword)
    {
        if(!hasPwd){
            
            NSLog(@"你还没有设置密码，请先设置密码");
        }else {
            
            [CLLockVC showVerifyLockVCInVC:self forgetPwdBlock:^{
                NSLog(@"忘记密码");
            } successBlock:^(CLLockVC *lockVC, NSString *pwd) {
                NSLog(@"密码正确");
                if ([[FNUserDefaults objectForKey:@"numguanggao"] intValue]<0||[[FNUserDefaults objectForKey:@"numguanggao"] isEqualToString:@"100000"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD12345" object:nil];
                }
                
                [lockVC dismiss:1.0f];
                
            }];
        }
    }
    CLLockVC *lockVC=[[CLLockVC alloc] init];
    [lockVC dismiss:1.0f];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加tabbar
    [self addTabbar];
    
    // 添加所有子控制器
    [self addAllChildViewControllers];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeViewForUITabBarButton) name:REMOVE_TABBAR_SUBVIEWS object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeVC) name:@"removeVC" object:nil];
}
-(void)downLoadFinish11
{
    
   // [self addAllChildViewControllers];

   
}
//#pragma mark - <UITabBarControllerDelegate>
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    //点击tabBarItem动画
//    [self tabBarButtonClick:[self getTabBarButton]];
//    
//}
//- (UIControl *)getTabBarButton{
//    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
//    
//    for (UIView *tabBarButton in self.tabBar.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
//            [tabBarButtons addObject:tabBarButton];
//        }
//    }
//    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
//    tabBarButton.backgroundColor=[UIColor whiteColor];
//    return tabBarButton;
//}

- (void)removeVC
{
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}


/**
 *  添加自定义Tabbar
 */
- (void)addTabbar
{
    // DCTabBar *TabBar = [[DCTabBar alloc] init];
 DHTabBar *customTabbar = [[DHTabBar alloc] init];
//
//
//    //KVC把系统换成自定义
  // [self setValue:TabBar forKey:@"tabBar"];
    customTabbar.delegate = self;
    customTabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabbar];
    _customTabbar = customTabbar;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
   
    // 移除之前的4个UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) { //UITabBarButton
            [child removeFromSuperview];
        }
    }
}

#pragma mark 初始化所有的子控制器
- (void)addAllChildViewControllers
{
 
   
        // 1.首页
        HomeController *home = [[HomeController alloc] init];
        [self addChildViewController:home title:@"首页" image:@"table3-08" selectedImage:@"table3-07"];
        

        CommodityController *me = [[CommodityController alloc] init];

        // 2.我的
        [self addChildViewController:me title:@"商家" image:@"table3-12" selectedImage:@"table3-11"];

        // 3.商品
        MyController *rice = [[MyController alloc] init];
        [self addChildViewController:rice title:@"我的" image:@"table3-09" selectedImage:@"table3-10"];

    
    }

#pragma mark - 添加一个子控制器
- (void)addChildViewController:(UIViewController *)child title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置标题和图片
    child.tabBarItem.title = title;
    child.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selected = [UIImage imageNamed:selectedImage];
    
    // 不渲染选中的图片
    child.tabBarItem.selectedImage = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器
   // child.title = title;
    DHNavigationController *nav = [[DHNavigationController alloc] initWithRootViewController:child];
   // [nav removeFromParentViewController];
    // 成为tabbarController的子控制器
    [self addChildViewController:nav];
   
    // 添加一个按钮
    [_customTabbar addTabBarButtonWithItem:child.tabBarItem nstring:title];
}
#pragma mark 删除系统自动生成的UITabBarButton
- (void)removeViewForUITabBarButton
{
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
@end
