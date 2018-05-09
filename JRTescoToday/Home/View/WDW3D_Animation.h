//
//  WDW3D_Animation.h
//  3D效果无限循环轮播图
//
//  Created by 吴德文 on 16/7/9.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClickImgDelegate <NSObject>//点击图片的协议

-(void)ClickImg:(int)index;//点击图片的方法

@end

@interface WDW3D_Animation : UIView

@property (nonatomic, assign)int currentIndex;//当前图片的下标

@property (nonatomic, strong)UIImageView *imageView;//图片

@property (nonatomic, strong)NSArray *imageArr;//图片数组
@property (nonatomic)BOOL qqq;//图片数组
@property (assign, nonatomic) id <ClickImgDelegate> delegate;

//声明页码器的属性
@property(nonatomic,strong)UIPageControl *pageControl;

//动画模式
@property(nonatomic,strong)NSArray * animationModeArr;

//显示3D广告的方法
- (void)show3DBannerView;

@end
