//
//  UIView+DH.m
//  DHInvestment
//
//  Created by JJS on 15/9/8.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "UIView+DH.h"

@implementation UIView (DH)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

+ (UIView *)createNavHeadViewWithTitle:(NSString *)title andClass:(id)classObject andSEL:(SEL)sel
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 64)];
    view.backgroundColor = [UIColor colorWithHexString:kSelectedlColor];
    
    // 标题
    UILabel *titleLabel = [[UILabel  alloc] init];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    CGSize titleSize = [titleLabel.text sizeWithFont:[UIFont systemFontOfSize:18] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    titleLabel.frame = CGRectMake((kScreenSize.width - titleSize.width) / 2, 20, titleSize.width, titleSize.height);
    [view addSubview:titleLabel];
    
    // 返回 + 按钮
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, titleSize.height, kScreenSize.width/5 ,34 );
    [backBtn  setTitle:@"返回" forState:UIControlStateNormal];
    backBtn.titleLabel.font=[UIFont   systemFontOfSize:15];
    
    UIImage *backImage=[UIImage  imageNamed:@"nav_back_btn"];
    [backBtn addTarget:classObject action:sel forControlEvents:UIControlEventTouchDown];
    [backBtn setImage:backImage forState:UIControlStateNormal];
    [view addSubview:backBtn];
    
    return view;
    
}
@end
