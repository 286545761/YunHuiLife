//
//  JRBusinessCollectionReusableView.h
//  JRTescoToday
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRBusinessInforModel.h"

@protocol JRBusinessCollectionReusableViewDelegate <NSObject>
- (void)pushToStoreInforViewController;
- (void)pushToQRCodeViewController;
- (void)pushToScanCodeAndTestVoucherViewController;
- (void)pushToAuthenticationViewController;
@end

@interface JRBusinessCollectionReusableView : UICollectionReusableView

@property (nonatomic, weak)id<JRBusinessCollectionReusableViewDelegate>delegate;
- (void)setUpDataWithInfor:(JRBusinessInforModel *)inforModel;
@end
