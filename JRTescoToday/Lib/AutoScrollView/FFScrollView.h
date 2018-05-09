//
//  FFScrollView.h
//  CaiMao
//
//  Created by Fengpj on 14-12-15.
//  Copyright (c) 2014年 58cm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    FFScrollViewSelecttionTypeTap = 100,  // 默认的为可点击模式
    FFScrollViewSelecttionTypeNone        // 不可点击的
}FFScrollViewSelecttionType;

@protocol FFScrollViewDelegate <NSObject>

@optional
- (void)scrollViewDidClickedAtPage:(NSInteger)pageNumber;

@end

@interface FFScrollView : UIView <UIScrollViewDelegate>
{
    NSTimer *timer;
    
    // 保存图片数组
    NSArray *sourceArr;
}
- (id)initPageViewWithFrame:(CGRect)frame views:(NSMutableArray *)views andNSarray:(NSMutableArray *)array;
@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIPageControl *pageControl;
@property(assign,nonatomic) FFScrollViewSelecttionType selectionType;
@property(assign,nonatomic) id <FFScrollViewDelegate> pageViewDelegate;


@end
