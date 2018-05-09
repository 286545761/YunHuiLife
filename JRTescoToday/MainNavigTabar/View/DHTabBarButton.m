//
//  DHTabBarButton.m
//  DHInvestment
//
//  Created by JJS on 15/9/6.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "DHTabBarButton.h"

@implementation DHTabBarButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 2.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textColor = [UIColor colorWithHexString:kNormarlColor];
        [self setTitleColor:[UIColor colorWithHexString:kNormarlColor] forState:UIControlStateNormal];
        
        // 3.设置选中时的背景图片 / 文字颜色
        //        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider_os7"] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor colorWithHexString:@"#ff2d48"] forState:UIControlStateSelected];
    }
    return self;
}


// 去掉父类在高亮时所做的操作
- (void)setHighlighted:(BOOL)highlighted {}

#pragma mark - 覆盖父类的2个方法

#pragma mark 设置按钮标题的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    UIImage *image =  [self imageForState:UIControlStateNormal];
    CGFloat titleY = image.size.height;
    CGFloat titleHeight = self.bounds.size.height - titleY;
    return CGRectMake(0, titleY + 2 , self.bounds.size.width,  titleHeight);
}

#pragma mark 设置按钮图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    UIImage *image = [self imageForState:UIControlStateNormal];
    return CGRectMake(0, kMargin, contentRect.size.width, image.size.height);
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
}


@end
