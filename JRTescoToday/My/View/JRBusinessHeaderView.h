//
//  JRBusinessHeaderView.h
//  JRTescoToday
//
//  Created by apple on 2017/12/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JRBusinessHeaderViewDelegate <NSObject>
- (void)pushToShopViewController;
- (void)pushToNewsViewController;
- (void)pushToSetUpViewController;
- (void)pushToAuthenticationViewController;
- (void)pushToQRCodeViewController;
- (void)pushToScanCodeAndTestVoucherViewController;
- (void)pushToShareFriendViewController;
@end
@interface JRBusinessHeaderView : UIView
@property (nonatomic, assign)id<JRBusinessHeaderViewDelegate>delegate;
@end
