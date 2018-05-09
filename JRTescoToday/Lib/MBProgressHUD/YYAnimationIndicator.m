//
//  YYAnimationIndicator.m
//  AnimationIndicator
//
//  Created by 王园园 on 14-8-26.
//  Copyright (c) 2014年 王园园. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "YYAnimationIndicator.h"

#define kWidthHeight 20 // 转动的图片宽高为80

@interface YYAnimationIndicator()
{
//    UIView *bgView;
//    YYAnimationIndicator *animationView;
}
@end

static UIView *bgView;
static YYAnimationIndicator *animationView;

@implementation YYAnimationIndicator


+ (YYAnimationIndicator *)sharedYYAnimationIndicator
{
    if (animationView == nil) {
        animationView = [[self alloc] initWithFrame:(CGRect){CGPointZero,kScreenSize}];
        animationView.userInteractionEnabled = YES;
    }
    
    return animationView;
}

//+ (UIView *)sharedBgView
//{
//    if (bgView == nil) {
//        bgView = [[UIView alloc] init];
//        bgView.userInteractionEnabled = YES;
//    }
//    
//    return bgView;
//}

+ (id)allocWithZone:(NSZone *)zone
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        animationView = [super allocWithZone:zone];
    });
    
    return animationView;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _isAnimating = NO;
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenSize.width - kWidthHeight) / 2,
                                                                  (kScreenSize.height - kWidthHeight - kNavagationHeight) / 2.5,
                                                                  kWidthHeight,kWidthHeight)];
        
        imageView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:imageView];
        
        //设置动画帧
        imageView.animationImages=[NSArray arrayWithObjects: [UIImage imageNamed:@"loading1"],
                                   [UIImage imageNamed:@"loading2"],
                                   [UIImage imageNamed:@"loading3"],
                                   [UIImage imageNamed:@"loading4"],
                                   [UIImage imageNamed:@"loading5"],
                                   [UIImage imageNamed:@"loading6"],
                                   [UIImage imageNamed:@"loading7"],
                                   [UIImage imageNamed:@"loading8"],
                                   nil ];
        
        Infolabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(imageView.frame),frame.size.width,20)];
        Infolabel.backgroundColor = [UIColor clearColor];
        Infolabel.textAlignment = NSTextAlignmentCenter;
        Infolabel.textColor = [UIColor colorWithHexString:kSelectedlColor];
//        Infolabel.font = [UIFont fontWithName:@"ChalkboardSE-Bold" size:14.0f];
        Infolabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:Infolabel];
        self.layer.hidden = YES;
    }

    return self;
}


+ (void)loadAnimationWithController:(UIViewController *)controller setLoadText:(NSString *)text
{
    bgView = [[UIView alloc] init];
    bgView.userInteractionEnabled = YES;
    bgView.frame = (CGRect){CGPointZero,controller.view.bounds.size};
//    bgView.backgroundColor = [UIColor blackColor];
//    bgView.alpha = 0.6f;
    [controller.view addSubview:bgView];
    
    animationView = [YYAnimationIndicator sharedYYAnimationIndicator];
    [bgView addSubview:animationView];
    
    animationView.frame = CGRectMake(0,0,kScreenSize.width,AnimationBGHeight);
    [animationView setLoadText:text];
    [animationView startAnimation];

}
//animationImages是数组类型，该数组必须包含的UIImage对象。您可以使用相同的图像对象多次在阵中。
//例如：将一系列帧添加到一个数组里面，然后设置animation一系列属性，如动画时间，动画重复次数，还是看代码吧，直观
//NSArray *magesArray = [NSArray arrayWithObjects:
//                       [UIImage imageNamed:@"image1.png"],
//                       [UIImage imageNamed:@"image2.png"],
//                       [UIImage imageNamed:@"image3.png"],
//                       [UIImage imageNamed:@"image4.png"],
//                       [UIImage imageNamed:@"image5.png"],nil];
//
//UIImageView *animationImageView = [UIImageView alloc]init];
//[animationImageView initWithFrame:CGRectMake(0, 0, 131, 125)];
//animationImageView.animationImages = imagesArray;//将序列帧数组赋给UIImageView的animationImages属性
//animationImageView.animationDuration = 0.25;//设置动画时间
//animationImageView.animationRepeatCount = 0;//设置动画次数 0 表示无限
//[animationImageView startAnimating];//开始播放动画
//但是，如果图片少的话也许这种方式是最快速最容易达到目的的，但是图片很多的话，根据目前我做的实验，图片很多的话 这种方式程序必须会蹦，随后我会提到我们现在的实现方式，而且动画不能够实现暂停，只有停止，项目中要求序列帧播放的时候当手轻触(touch)播放暂停，松开后继续播放 ,横扫(swipe)播放加速,这一系列的需求表明了用animationImages这种方式实现已经不太现实.因为UIImageView的animation不会边用边释放(当然这点仅是我自己的拙见)，那就导致了如果图片很多，animation直接崩掉根本 用不了，我们实现的原理就是用NSTimer去实现apple的UIImageView animation的效果,其实apple应该也是用NSTimer去实现吧(猜的)，用NSTimer每隔一个时间戳去设置一次image，代码如下
//NSTimer *myAnimatedTimer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(setNextImage) userInfo:nil repeats:YES];
//-（void） setNextImage
//{
//    myAnimatedView.image = [UIImage imageNamed：[NSStringstringWithFormat:@"image%i.png",nextImage]];
//}

- (void)startAnimationWithController:(UIViewController *)controller animationView:(YYAnimationIndicator *)animationView setLoadText:(NSString *)text
{
    bgView = [[UIView alloc] initWithFrame:(CGRect){CGPointZero,controller.view.bounds.size}];
    bgView.backgroundColor = [UIColor clearColor];

    [controller.view addSubview:bgView];
    
    [bgView addSubview:animationView];
    [animationView setLoadText:text];
    
    _isAnimating = YES;
    self.layer.hidden = NO;
    
    Infolabel.text = _loadtext;
    //设置动画总时间
    imageView.animationDuration=1.0;
    //设置重复次数,0表示不重复
    imageView.animationRepeatCount=0;
    //开始动画
    [imageView startAnimating];
}

+ (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type
{
    
    [animationView stopAnimationWithLoadText:text withType:type];
}

- (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type;
{
    _isAnimating = NO;
//    Infolabel.text = text;
    [animationView removeFromSuperview];    
    [bgView removeFromSuperview];
    if(type){
        
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [imageView stopAnimating];
            self.layer.hidden = YES;
            self.alpha = 1;
        }];
    }else{
        [imageView stopAnimating];
        [imageView setImage:[UIImage imageNamed:@"3"]];
    }
    
}

- (void)startAnimation
{
    _isAnimating = YES;
    self.layer.hidden = NO;
    
    Infolabel.text = _loadtext;
    //设置动画总时间
    imageView.animationDuration=1.0;
    //设置重复次数,0表示不重复
    imageView.animationRepeatCount=0;
    //开始动画
    [imageView startAnimating];
}


- (void)setLoadText:(NSString *)text;
{
    if(text){
        _loadtext = text;
    }
}

@end
