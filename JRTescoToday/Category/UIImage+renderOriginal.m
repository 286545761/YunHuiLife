//
//  UIImage+renderOriginal.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/4.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "UIImage+renderOriginal.h"

@implementation UIImage (renderOriginal)
+ (UIImage *)imageWithRenderOriginalName:(NSString *)name{
    UIImage *image =  [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
