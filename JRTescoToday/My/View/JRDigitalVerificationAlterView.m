//
//  JRDigitalVerificationAlterView.m
//  JRTescoToday
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRDigitalVerificationAlterView.h"

@implementation JRDigitalVerificationAlterView

- (IBAction)cancelAlter:(id)sender {
    [self removeFromSuperview];
}
- (void)show {
    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([view isKindOfClass:[JRDigitalVerificationAlterView class]]) {
            [view removeFromSuperview];
        }
    }
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
@end
