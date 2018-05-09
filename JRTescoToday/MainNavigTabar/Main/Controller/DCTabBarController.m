//
//  DCTabBarController.m
//  CDDMall
//
//  Created by apple on 2017/5/26.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "DCTabBarController.h"

// Controllers
#import "DCNavigationController.h"
// Models
#import "DCTabBar.h"
// Views

// Vendors

// Categories

// Others

@interface DCTabBarController ()<UITabBarControllerDelegate>

@end

@implementation DCTabBarController

#pragma mark - LazyLoad


#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
//         [[UITabBar appearance] setBackgroundColor:[UIColor redColor]];
  
    
    [self addDcChildViewContorller];
      [self setUpTabBar];
}

#pragma mark - 更换系统tabbar
-(void)setUpTabBar
{
    DCTabBar *tabBar = [[DCTabBar alloc] init];
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.tintColor=RGB(252, 199, 46);
    //KVC把系统换成自定义
    [self setValue:tabBar forKey:@"tabBar"];
}
/*   // 1.首页
 HomeController *home = [[HomeController alloc] init];
 [self addChildViewController:home title:@"首页" image:@"table3-08" selectedImage:@"table3-07"];
 
 
 CommodityController *me = [[CommodityController alloc] init];
 
 // 2.我的
 [self addChildViewController:me title:@"商家" image:@"table3-12" selectedImage:@"table3-11"];
 
 // 3.商品
 MyController *rice = [[MyController alloc] init];
 [self addChildViewController:rice title:@"我的" image:@"table3-09" selectedImage:@"table3-10"];
*/

#pragma mark - 添加子控制器
- (void)addDcChildViewContorller
{
    NSArray *childArray = @[
                            @{
                                MallClassKey  : @"HomeController",
                              MallTitleKey  : @"首页",
                              MallImgKey    : @"shouye",
                              MallSelImgKey : @"shouyexuanzhong"},
                            
                            @{MallClassKey  : @"CommodityController",
                              MallTitleKey  : @"商家",
                              MallImgKey    : @"shangjia",
                              MallSelImgKey : @"shangjiaxuanzhong"},
//                            @{MallClassKey  : @"FindViewController",
//                              MallTitleKey  : @"发现",
//                              MallImgKey    : @"Find3_no",
//                              MallSelImgKey : @"Find3"},
                            
                            @{MallClassKey  : @"MyController",
                              MallTitleKey  : @"我的",
                              MallImgKey    : @"wode",
                              MallSelImgKey : @"wodexuanzhong"},
                            
                      
                            
                            ];
    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop)
     {
        
        UIViewController *vc = [NSClassFromString(dict[MallClassKey]) new];
        vc.navigationItem.title = ([dict[MallTitleKey] isEqualToString:@"首页"] || [dict[MallTitleKey] isEqualToString:@"分类"]) ? nil : dict[MallTitleKey];
        DCNavigationController *nav = [[DCNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title=dict[MallTitleKey];
         
        item.image = [UIImage imageNamed:dict[MallImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[MallSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);//（当只有图片的时候）需要自动调整
        [self addChildViewController:nav];
        
    }];
}

#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];

}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];

    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}
#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}

    
#pragma mark - 禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
}

@end
