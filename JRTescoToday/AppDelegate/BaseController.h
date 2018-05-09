//
//  BaseController.h
//  DHInvestment
//
//  Created by JJS on 15/11/2.
//  Copyright © 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController
{
    UIButton *reloadBtn;
    UIView   *noNetView;
}


// 设置无网页面 有Dock就是1 没有就是0
- (UIView *)buildNoNetUIWithDock:(int)dock;

// 是否有网络
- (BOOL)checkNet;

// 删除View中所有的子类
- (void)removeSubviews;

@end
