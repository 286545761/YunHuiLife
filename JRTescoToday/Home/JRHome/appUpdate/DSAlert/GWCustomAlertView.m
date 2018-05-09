//
//  GWCustomAlertView.m
//  GW
//
//  Created by apple on 16/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GWCustomAlertView.h"

@interface GWCustomAlertView ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *containLabel;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;


@property (copy, nonatomic) void(^callback)(NSInteger index);

@end

@implementation GWCustomAlertView
+ (instancetype)makeViewWithFrame:(CGRect)frame Title:(NSString *)title Contain:(NSString*)contain buttonTitles:(NSArray *)buttonTitles buttonBlock:(void (^)(NSInteger))block {
    GWCustomAlertView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GWCustomAlertView class]) owner:self options:nil] firstObject];
    view.frame = frame;
    [view setNeedsLayout];
    
    view.titleLabel.text = title;
    view.containLabel.text = contain;
    if ( buttonTitles.count == 3 ) {
        [view.leftBtn setTitle:buttonTitles[0] forState:UIControlStateNormal];
        [view.rightBtn setTitle:buttonTitles[1] forState:UIControlStateNormal];
        [view.cancelBtn setTitle:buttonTitles[2] forState:UIControlStateNormal];

        view.leftBtn.tag = 1;
        view.rightBtn.tag = 2;
        view.cancelBtn.tag = 3;
    }else {
        NSLog(@"按钮标题数要跟按钮个数一致");
    }
    view.callback = block;
    return view;
}

- (IBAction)didButtonAction:(UIButton *)sender {
    if ( self.callback ) {
        self.callback(sender.tag);
    }
}

@end
