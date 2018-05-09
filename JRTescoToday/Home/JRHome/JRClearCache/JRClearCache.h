//
//  JRClearCache.h
//  JRTescoToday
//
//  Created by apple on 2017/11/2.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRClearCache : NSObject
//清除app缓存
+ (void)clearAppCache;
//计算缓存
+ (NSUInteger)caculateAppAllCacheSize;
@end
