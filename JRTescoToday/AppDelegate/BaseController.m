//
//  BaseController.m
//  DHInvestment
//
//  Created by JJS on 15/11/2.
//  Copyright © 2015年 DuohaoTechnolog. All rights reserved.
//

#import "BaseController.h"
#import "Reachability.h"
#import "UIButton+DH.h"

#define kNoNetViewHeight 152
#define kReloadBtnWidth 140
#define kImageWH 72

@interface BaseController ()
{
    UIImageView   *navBarlineImageView;   // 导航条底部的imagView
}

@end

@implementation BaseController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    navBarlineImageView.hidden = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;

    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        [self.view addSubview:noNetView];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    navBarlineImageView.hidden = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:kAllViewBgColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // 去掉导航条底部的UIImageView
    self.navigationController.navigationBar.translucent = NO;
    navBarlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];


}

#pragma mark 设置无网络View
- (UIView *)buildNoNetUIWithDock:(int)dock
{
    
    CGFloat noNetViewY = dock ? (kScreenSize.height - kDockHeight - kNoNetViewHeight - kNavagationHeight) / 2 :
                                     (kScreenSize.height - kNavagationHeight - kNoNetViewHeight) / 2;
    
    noNetView = [[UIView alloc] initWithFrame:CGRectMake(0, noNetViewY,kScreenSize.width, kNoNetViewHeight)];
    noNetView.backgroundColor = [UIColor clearColor];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenSize.width - kImageWH) / 2, kMargin, kImageWH, kImageWH)];
    imgView.image = [UIImage imageNamed:@"no_net"];
    [noNetView addSubview:imgView];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame) + kMargin, kScreenSize.width, 20)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:13];
    lable.text = @"网络连接失败，请检查网络连接！";
    lable.textColor = [UIColor colorWithHexString:kNormarlColor];
    [noNetView addSubview:lable];
    
    reloadBtn = [UIButton buttonWithTitle:@"重新加载" normalImg:@"" selectedImg:@"" normalColor:TitleColor
                                                        selectedColor:TitleColor font:BtnTitleFont];
    reloadBtn.layer.cornerRadius = kRadius;
    reloadBtn.backgroundColor = [UIColor lightGrayColor];
    reloadBtn.frame = CGRectMake((kScreenSize.width - kReloadBtnWidth) / 2, CGRectGetMaxY(lable.frame) + 5,
                                                           kReloadBtnWidth, ButtonHeight);
    [noNetView addSubview:reloadBtn];
    
    return noNetView;
}


#pragma mark 去掉导航条底部的UIImageView
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark 是否有网络
- (BOOL)checkNet
{
    NSString *hostName = @"www.baidu.com";
    Reachability *hostReach = [Reachability reachabilityWithHostName:hostName];
    NetworkStatus netStatus = [hostReach currentReachabilityStatus];
    [hostReach startNotifier];
    
    if (netStatus == NotReachable){
        return NO;
    }

    return YES;
}

#pragma 删除View中所有的子类
- (void)removeSubviews
{
    for (UIView *child in self.view.subviews) {
        if ([child isKindOfClass:[UIView class]]) {
            [child removeFromSuperview];
        }
    }
}

@end
