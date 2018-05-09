//
//  UIImage+renderOriginal.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/4.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (renderOriginal)
/**
 *  图片不要渲染
 *
 *  @param name 图片名字
 *
 *  @return 返回一张不要渲染的图片
 */
+ (UIImage *)imageWithRenderOriginalName:(NSString *)name;

@end
