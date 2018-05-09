//
//  CLLockInfoView.m
//  CoreLock
//
//  Created by 成林 on 15/4/27.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CLLockInfoView.h"
#import "CoreLockConst.h"





@implementation CLLockInfoView
{
    NSMutableArray* buttonArray;
    NSMutableArray* selectedButtonArray;
    NSMutableArray* wrongButtonArray;
    CGPoint nowPoint;
    
    NSTimer* timer;
    
    BOOL isWrongColor;
    BOOL isDrawing; // 正在画中
}

//-(void)drawRect:(CGRect)rect{
//    
//    //获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    //设置属性
//    CGContextSetLineWidth(ctx, CoreLockArcLineW);
//    
//    //设置线条颜色
//    [[UIColor  colorWithHexString:@"#ba2221"] set];
//    
//    //新建路径
//    CGMutablePathRef pathM =CGPathCreateMutable();
//    
//    CGFloat marginV = 3.f;
//    CGFloat padding = 1.0f;
//    CGFloat rectWH = (rect.size.width - marginV * 2 - padding*2) / 3.5;
//    
//    //添加圆形路径
//    for (NSUInteger i=0; i<9; i++) {
//        
//        NSUInteger row = i % 3;
//        NSUInteger col = i / 3;
//        
//        CGFloat rectX = (rectWH + marginV) * row + padding;
//        
//        CGFloat rectY = (rectWH + marginV) * col + padding;
//        
//        CGRect rect = CGRectMake(rectX, rectY, rectWH, rectWH);
//        
//        CGPathAddEllipseInRect(pathM, NULL, rect);
//    }
//    
//    //添加路径
//    CGContextAddPath(ctx, pathM);
//    
//    //绘制路径
//    CGContextStrokePath(ctx);
//    
//    //释放路径
//    CGPathRelease(pathM);
//}

- (void)initCircles
{
    buttonArray = [NSMutableArray array];
    selectedButtonArray = [NSMutableArray array];
    
    // 初始化圆点
    for (int i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        int x = kCircleMargin + (i%3) * (kCircleDiameter+(320-kCircleMargin*2- kCircleDiameter *3)/2);
        int y = kCircleMargin + (i/3) * (kCircleDiameter+(320-kCircleMargin*2- kCircleDiameter *3)/2);
        //        LLLog(@"每个圆点位置 %d,%d", x, y);
        [button setFrame:CGRectMake(x, y, kCircleDiameter, kCircleDiameter)];
        
        [button setBackgroundColor:[UIColor clearColor]];
        [button setBackgroundImage:[UIImage imageNamed:@"circle_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"QQ@3x"] forState:UIControlStateSelected];
        button.userInteractionEnabled= NO;//禁止用户交互
        button.alpha = kLLCircleAlpha;
        button.tag = i + kLLBaseCircleNumber + 1; // tag从基数+1开始,
        [self addSubview:button];
        [buttonArray addObject:button];
    }
    
    self.backgroundColor = [UIColor clearColor];
}


#pragma mark - 绘制连线
- (void)drawRect:(CGRect)rect
{
   // LLLog(@"drawRect - %@", [NSString stringWithFormat:@"%d", isWrongColor]);
   // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
    
        //设置属性
        CGContextSetLineWidth(ctx, CoreLockArcLineW);
    
        //设置线条颜色
        [[UIColor  colorWithHexString:RED_COLOR] set];
    
        //新建路径
        CGMutablePathRef pathM =CGPathCreateMutable();
    
        CGFloat marginV = 3.f;
        CGFloat padding = 1.0f;
        CGFloat rectWH = (rect.size.width - marginV * 2 - padding*2) / 3.5;

    if (selectedButtonArray.count > 0) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        isWrongColor ? [kLLLineColorWrong set] : [kLLLineColor set]; // 正误线条色
        CGContextSetLineWidth(context, kLLLineWidth);
        int i;
        i=0;
        // 画之前线s
        CGPoint addLines[9];
        int count = 0;
        for (UIButton* button in selectedButtonArray) {
            CGPoint point = CGPointMake(button.center.x, button.center.y);
            addLines[count++] = point;
            i++;
            NSUInteger row = i % 3;
            NSUInteger col = i / 3;
            CGFloat rectX = (rectWH + marginV) * row + padding;
            
            CGFloat rectY = (rectWH + marginV) * col + padding;
            CGRect rect = CGRectMake(rectX, rectY, rectWH, rectWH);
            // 画中心圆
            CGRect circleRect = CGRectMake(button.center.x- kLLLineWidth/2,
                                           button.center.y - kLLLineWidth/2,
                                           kLLLineWidth,
                                           kLLLineWidth);
            CGContextSetFillColorWithColor(context, kLLLineColor.CGColor);
            CGContextFillEllipseInRect(context, circleRect);
        }
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextAddLines(context, addLines, count);
        CGContextStrokePath(context);
        //*/
        
        // 画当前线
        UIButton* lastButton = selectedButtonArray.lastObject;
        CGContextMoveToPoint(context, lastButton.center.x, lastButton.center.y);
        CGContextAddLineToPoint(context, nowPoint.x, nowPoint.y);
        CGContextStrokePath(context);
    }
    
}













@end
