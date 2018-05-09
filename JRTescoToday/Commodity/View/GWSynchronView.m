//
//  GWSynchronView.m
//  GW
//
//  Created by apple on 16/12/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GWSynchronView.h"

@interface GWSynchronView ()
@property (weak, nonatomic) IBOutlet UIImageView *synchronImageView;
@property (weak, nonatomic) IBOutlet UILabel *synchronLabel;
@property (weak, nonatomic) IBOutlet UIView *synchronVIew;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *syLabelWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *syLabelHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *syImageViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *syImageViewHeight;

@end

@implementation GWSynchronView
- (void)awakeFromNib {
    [super awakeFromNib];
    //灰色
    self.synchronImageView.image = [UIImage imageNamed:@"icon_refresh.png"];
    //彩色
    self.synchronVIew.backgroundColor = [UIColor clearColor];
    self.synchronImageView.image = [UIImage imageNamed:@"icon_refresh.png"];
    
    self.synchronLabel.text = @"";
    self.synchronLabel.font = [UIFont systemFontOfSize:14];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat viewWidth = self.bounds.size.width;
    _syImageViewWidth.constant = (viewWidth)/2;
    _syImageViewHeight.constant = _syImageViewWidth.constant;
    _syLabelWidth.constant = 0;
    _syLabelHeight.constant = 0;

}


//创建360度旋转动画
- (void)startRotationImageViewRotation360Degree{
    CABasicAnimation * aniScale = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    aniScale.fromValue = @(0);
    aniScale.toValue = @(M_PI);
    aniScale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    aniScale.autoreverses = NO;
    aniScale.repeatCount = HUGE_VALF;
    aniScale.delegate = self;
    aniScale.removedOnCompletion = NO;
    [self.synchronImageView.layer addAnimation:aniScale forKey:@"rotation360Degree"];
    
}
//移除动画
- (void)stopRotationImageViewRotation {
    [self.synchronImageView.layer removeAllAnimations];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
