//
//  CommHear.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/22.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CommHear.h"
#import "GWSynchronView.h"

@implementation CommHear {
    GWSynchronView *_synchronXib;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self=[[NSBundle mainBundle]  loadNibNamed:@"CommHear" owner:nil options:nil][0];
        [self creatRefreshButton];
    }
    self.backgroundColor=[UIColor whiteColor];
    return self;
}
- (void)creatRefreshButton {
    //同步按钮
    _synchronXib = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([GWSynchronView class]) owner:nil options:nil] lastObject];
    self.shuaxin = _synchronXib.synchronSender;
    _synchronXib.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.shuaXinParentView addSubview:_synchronXib];
    [_synchronXib.synchronSender addTarget:self action:@selector(clickSynchron) forControlEvents:UIControlEventTouchUpInside];
    _synchronXib.synchronSender.enabled = YES;

}
- (void)clickSynchron {
    //开启同步动画
    [_synchronXib startRotationImageViewRotation360Degree];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.shuaXinParentView.bounds.size.width < 40) {
        _synchronXib.frame =CGRectMake(0, 0,self.shuaXinParentView.bounds.size.width, 22);
        
    }else {
        _synchronXib.frame =CGRectMake(self.shuaXinParentView.bounds.size.width-40, 0,40, 22);
    }
    
}
- (void)startAnimation {
    [_synchronXib startRotationImageViewRotation360Degree];
    
}
- (void)stopAnimation {
    [_synchronXib stopRotationImageViewRotation];
}

@end
