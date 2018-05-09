//
//  JRTagButton.m
//  JRTescoToday
//
//  Created by apple on 2017/11/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRTagButton.h"
@interface JRTagButton ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong)UILongPressGestureRecognizer *longPress;
@end
@implementation JRTagButton
{
    UIImageView *tapImageView;
}
- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    if ([longPress state] == UIGestureRecognizerStateBegan) {
//        [_target performSelector:_action withObject:self afterDelay:0];
        if (!_deleteImageView) {
            _deleteImageView = [[UIImageView alloc] init];
            _deleteImageView.frame = CGRectMake(self.frame.size.width - 5, -5, 10, 10);
            _deleteImageView.image = [UIImage imageNamed:@"delete1411.png"];
            self.canDelete = YES;
            [self addSubview:_deleteImageView];
            
//            tapImageView =[[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 10, -10, 25, 25)];
//            tapImageView.backgroundColor = [UIColor redColor];
//            tapImageView.tag =self.tag;
//            tapImageView.userInteractionEnabled = YES;
//            [self addSubview:tapImageView];
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
//            tap.delegate = self;
//            [tapImageView addGestureRecognizer:tap];
        }
    }
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *view = [super hitTest:point withEvent:event];
//    if (view == nil) {
//        // 转换坐标系
//        CGPoint newPoint = [tapImageView convertPoint:point fromView:self];
//        // 判断触摸点是否在tapImageView上
//        if (CGRectContainsPoint(tapImageView.bounds, newPoint)) {
//            view = self;
//        }
//     }
//    return view;
//}
//

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    self.canDelete = YES;
//    [_target performSelector:_action withObject:self afterDelay:0];
//
//    if ([touch.view isKindOfClass:[UIButton class]]){
//        return false;
//    }
//
//    return true;
//
//}

- (void)addLongPressTarget:(id)target action:(SEL)action {
    _target = target;
    _action = action;
    if (!_longPress) {
        _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        _longPress.minimumPressDuration = 0.5; //定义按的时间
        [self addGestureRecognizer:_longPress];
    }
}
- (void)dealloc {
    _target = nil;
    _action = nil;
    [_deleteImageView removeFromSuperview];
    [self removeGestureRecognizer:self.longPress];
}
@end
