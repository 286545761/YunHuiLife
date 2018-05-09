//
//  DHTabBar.h
//  DHInvestment
//
//  Created by JJS on 15/9/6.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHTabBarButton.h"
@class DHTabBar;

@protocol DHTabBarDelegate <NSObject>

@optional
- (void)tabBar:(DHTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface DHTabBar : UIView

@property(nonatomic ,strong)DHTabBarButton *guimiBtn;
/**
 *  通过一个item对象来添加一个按钮TabBarButton
 */
- (void)addTabBarButtonWithItem:(UITabBarItem *)item nstring:(NSString *)name;
- (void)btnClick:(DHTabBarButton *)btn;
/**
 *  代理
 */
@property (nonatomic, weak) id<DHTabBarDelegate> delegate;

@end
