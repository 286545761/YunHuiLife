//
//  JRNavTabViewController.h
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "BaseController.h"
@protocol JRNavTabDelegate <NSObject>
- (void)clickButtonToVc:(NSInteger)tagNumber;
@end

typedef void(^DisappearBlock)(CGFloat height);
@interface JRNavTabViewController : UIViewController
@property(nonatomic, assign)id<JRNavTabDelegate>delegate;

-(instancetype)initWithSubViewControllers:(NSArray *)subViewControllers;
@property (nonatomic, strong)NSArray *subViewArr;
@property(nonatomic,copy)UIColor *btnTextNomalColor;
@property(nonatomic,copy)UIColor *btnTextSeletedColor;
@property(nonatomic,copy)UIColor *sliderColor;
@property(nonatomic,copy)UIColor *topBarColor;
@property (nonatomic, assign) CGFloat alterHeight;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, assign)BOOL hasTop;
- (void)scrollToIndex:(NSInteger)tag;
@end
