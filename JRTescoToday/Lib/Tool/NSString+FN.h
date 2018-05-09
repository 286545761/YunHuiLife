//
//  NSString+FN.h
//  FNInvestment
//
//  Created by JJS on 15/11/19.
//  Copyright © 2015年 Beijing Hummingbird Technology Development Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FN)

/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;


#pragma mark 获得UID 传入当前时间(每次请求只在前台控制一次)、装载所有参数的字典(值可以为空)
+ (NSString *)getUIDWihtCurrentDateStr:(NSString *)currentDateStr
                                   dic:(NSDictionary *)dic;

#pragma mark MD5加密
+ (NSString *)md5:(NSString *)str;

#pragma mark 获得当前时间
+ (NSString *)stringGetCurrentDateStr;

#pragma mark 获得当前时间
+ (NSString *)stringGetCurrentDateStr2;

#pragma mark 获得当前时间
+ (NSString *)stringGetCurrentDateStr3;

#pragma mark 获取公钥
+ (NSString *)getPulicKey;

#pragma mark 获取公钥
+ (NSString *)getUUID;

#pragma mark 验证手机号码是否合法
+ (BOOL)stringValidateMobile:(NSString *)mobileNum;

+ (BOOL)stringValidateCureNum:(NSString *)string;

@end
