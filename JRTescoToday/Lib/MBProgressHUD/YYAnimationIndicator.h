//
//  YYAnimationIndicator.h
//  AnimationIndicator
//
//  Created by 王园园 on 14-8-26.
//  Copyright (c) 2014年 王园园. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

#define AnimationBGHeight 100

@interface YYAnimationIndicator : UIView
{
    UIImageView *imageView;
    UILabel *Infolabel;
}

@property (nonatomic, assign) NSString *loadtext;
@property (nonatomic, readonly) BOOL isAnimating;


-(void)setLoadText:(NSString *)text;

- (void)startAnimationWithController:(UIViewController *)controller animationView:(YYAnimationIndicator *)animationView
                         setLoadText:(NSString *)text;
#pragma mark 加载动画
+ (void)loadAnimationWithController:(UIViewController *)controller setLoadText:(NSString *)text;

#pragma mark 停止动画
+ (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type;
- (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type;


@end
