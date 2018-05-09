//
//  UIView+DH.h
//  DHInvestment
//
//  Created by JJS on 15/9/8.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//  可以快速的修改UIViewFrame中的值

// someView.x = 100;
// someView.width = 200;

#import <UIKit/UIKit.h>

@interface UIView (DH)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

+ (UIView *)createNavHeadViewWithTitle:(NSString *)title andClass:(id)classObject andSEL:(SEL)sel;

@end
