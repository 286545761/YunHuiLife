//
//  UIViewController+alterView.m
//  JRTescoToday
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "UIViewController+alterView.h"
#import "DSAlert.h"
@implementation UIViewController (alterView)
- (void)showAppUpdateAlterViewWith:(JRAppVersionModel *)model {
    [self appUpdateAppearWithUpdateInfor:model.updateInfo isNew:model.isNew andForceUpdate:model.isForce];
}
#pragma mark - appUpDateUI
- (void)terminateApplication {
    UIApplication *application = [UIApplication sharedApplication];
    [application performSelector:@selector(suspend)];
    [NSThread sleepForTimeInterval:0.2];
    exit(0);
}
#pragma mark -ui
- (void)appUpdateAppearWithUpdateInfor:(NSString *)infor isNew:(NSString *)isNew andForceUpdate:(NSString *)forceUpdate {
    if (![isNew integerValue]) return;
    DSAlert *_updateAlert;
    __weak typeof(self) weakSelf = self;

    //是否强制更新
    if ([forceUpdate integerValue]) {
        _updateAlert = [[DSAlert alloc] ds_showTitle:@"发现新版本" message:infor image:nil buttonTitles:@[@"立即更新"] buttonTitlesColor:@[[UIColor redColor]]];
        _updateAlert.showAnimate = YES;
        _updateAlert.messageTextAlignment = NSTextAlignmentLeft;
        [_updateAlert ds_showAlertView];
        
        _updateAlert.buttonActionBlock = ^(NSInteger index) {
            if (index == 0) {
                UIApplication *application = [UIApplication sharedApplication];
                NSString *trackUrlString = [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?mt=8&uo=4", @"1312708943"];
                NSURL *trackViewUrl = [NSURL URLWithString:trackUrlString];
                if ([application canOpenURL:trackViewUrl]) {
                    [application openURL:trackViewUrl];
                }
                [weakSelf terminateApplication];
            }
            
        };
        return;
    }
    //非强制更新
    _updateAlert = [[DSAlert alloc] ds_showTitle:@"发现新版本" message:infor image:nil buttonTitles:@[@"取消",@"立即更新"] buttonTitlesColor:@[[UIColor redColor] , [UIColor redColor]]];
    _updateAlert.showAnimate = YES;
    _updateAlert.messageTextAlignment = NSTextAlignmentLeft;
    [_updateAlert ds_showAlertView];
    __weak typeof(_updateAlert) weakSelf_updateAlert = _updateAlert;
    _updateAlert.buttonActionBlock = ^(NSInteger index) {
        if (index == 0) {
            [weakSelf_updateAlert ds_dismissAlertView];
        } else {
            UIApplication *application = [UIApplication sharedApplication];
            NSString *trackUrlString = [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?mt=8&uo=4", @"1312708943"];
            NSURL *trackViewUrl = [NSURL URLWithString:trackUrlString];
            if ([application canOpenURL:trackViewUrl]) {
                [application openURL:trackViewUrl];
            }
        }
        
    };
    
}
@end
