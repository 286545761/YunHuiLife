//
//  DHTabBar.m
//  DHInvestment
//
//  Created by JJS on 15/9/6.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "DHTabBarButton.h"
#import "DHTabBar.h"
#import "UserAccount.h"
#import "LoginController.h"
@interface DHTabBar()
{
    int _tabBarButtonCount;
    DHTabBarButton *_selectedBtn;
    CGFloat btny;
    int i;
}
@end

@implementation DHTabBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景色
//      self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background_os7"]];
        self.backgroundColor = [UIColor whiteColor];
        
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish11) name:SIGNOUT object:nil];
    return self;
}
//-(void)downLoadFinish11
//{
//    self addTabBarButtonWithItem:<#(UITabBarItem *)#> nstring:<#(NSString *)#>
//}
- (void)addTabBarButtonWithItem:(UITabBarItem *)item nstring:(NSString *)name
{
    // 创建底部按钮
    DHTabBarButton *btn = [[DHTabBarButton alloc] init];
    
    // 设置frame
    if ([name isEqualToString:@""]){
       btny = 0;
    }
    else
    {
       btny = 0;
    }
   CGFloat btnH = self.frame.size.height;
    CGFloat btnW = self.frame.size.width / 3;
    CGFloat btnX = btnW * _tabBarButtonCount;
    btn.frame = CGRectMake(btnX, btny, btnW, btnH);
    
    // 设置图片和标题
    btn.item = item;
    
    // 监听点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    // 默认选中第0个按钮  guimijihua panduanio
    
    btn.tag = _tabBarButtonCount;
    [[FNUserDefaults objectForKey:@"touziyemian"]  intValue]  ;
    
    if ([[FNUserDefaults objectForKey:@"panduanio"] isEqualToString:@"3"] ) {
        if ([[FNUserDefaults objectForKey:@"guimijihua"] isEqualToString:@"1"] ) {
            i=2;
        }
        else
        {
            i=0;
        }

    }
    else
    {
        if ([[FNUserDefaults objectForKey:@"touziyemian"] isEqualToString:@"1"] ) {
            i=1;
        }
        else
        {
            i=0;
        } 
    }
    
       if (_tabBarButtonCount == i) {
       [FNUserDefaults removeObjectForKey:@"touziyemian"];
           //[FNUserDefaults removeObjectForKey:@"panduanio"];
       [FNUserDefaults removeObjectForKey:@"guimijihua"];
    [self btnClick:btn];
   }
    
    [self addSubview:btn];
    
    _tabBarButtonCount++;
}

/**
 *  监听CMTabBarButton点击
 */
- (void)btnClick:(DHTabBarButton *)btn
{
   
   
    // 通知代理
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)])
    {
        
        
        [_delegate tabBar:self didSelectedButtonFrom:_selectedBtn.tag to:btn.tag];
    }
    
    if (![FNUserDefaults objectForKey:@"usersid"]&&btn.tag==2) {
        
    }
    else
    {
        // 控制器选中按钮
        _selectedBtn.selected = NO;
        btn.selected = YES;
        _selectedBtn = btn;
        
        
            //if ([_selectedBtn.imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                //需要实现的帧动画,这里根据自己需求改动
                CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
                animation.keyPath = @"transform.scale";
                animation.values = @[@1.0,@1.1,@0.9,@1.0];
                animation.duration = 0.3;
                animation.calculationMode = kCAAnimationCubic;
                //添加动画
                [_selectedBtn.imageView.layer addAnimation:animation forKey:nil];
            
        //}
    }
}

@end
