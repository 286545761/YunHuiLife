//
//  AddShangPinController.h
//  JRTescoToday
//
//  Created by 123 on 2017/8/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XWPresentedOneControllerDelegate <NSObject>

- (void)presentedOneControllerPressedDissmiss;
-(void)FenLeiName:(NSString *)fenleiname andFenLeiId:(NSString *)fenleiid;
- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end

@interface AddShangPinController : UIViewController
@property(nonatomic,strong)NSString *bianji;
@property(nonatomic ,strong)NSString *name;
@property(nonatomic,strong)NSString *idnnn;
@property (nonatomic, assign) id<XWPresentedOneControllerDelegate> delegate;
@end
