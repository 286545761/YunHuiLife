//
//  GWSynchronView.h
//  GW
//
//  Created by apple on 16/12/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface GWSynchronView : UIView
@property (weak, nonatomic) IBOutlet UIButton *synchronSender;

/**
 * 开启图片绕Z轴旋转360度
 */
- (void)startRotationImageViewRotation360Degree;
/**
 * 关闭动画
 */
- (void)stopRotationImageViewRotation;

@end
