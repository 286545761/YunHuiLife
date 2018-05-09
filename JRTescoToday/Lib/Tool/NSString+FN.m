//
//  NSString+FN.m
//  FNInvestment
//
//  Created by JJS on 15/11/19.
//  Copyright © 2015年 Beijing Hummingbird Technology Development Co.,Ltd. All rights reserved.
//

#import "NSString+FN.h"
#import <CommonCrypto/CommonDigest.h>
#import "UserAccount.h"
@implementation NSString (FN)

#pragma mark 计算字体size
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#pragma mark 获得UID 传入当前时间(每次请求只在前台控制一次)、装载所有参数的字典(值可以为空)
+ (NSString *)getUIDWihtCurrentDateStr:(NSString *)currentDateStr
                                   dic:(NSDictionary *)dic;
{
    
    // 获得参数排序字符串
    NSString *paramsKeys = [NSString getAllKeysWithSort:dic];
    
    NSString *publicKey = [NSString getPulicKey];
    
    DLog(@"%@",publicKey);
    
    // 获取当前时间数组（最原始的）
    NSMutableArray  *currentDateMurray = [NSString currentDateArray:currentDateStr];
    
    // 获取混淆时间
    NSString *mixDateStr = [NSString getMixDateWith:currentDateMurray];  //(没问题)
    
    
    // 1.将 参数key值 混淆时间 publicKey 拼接成字符串
    NSString *pinjieStr = [NSString stringWithFormat:@"%@%@%@",paramsKeys,mixDateStr,publicKey];
    
    // 2.给拼接的串加密
    NSString *MD5PinJieStr = [NSString md5:pinjieStr];
    
    
    // 3.将拼接好并且加密的字符串转化为数组
    NSMutableArray *pinjieStrToMuarray = [NSMutableArray array];
    for (int i = 0; i < MD5PinJieStr.length; i++) {
        NSRange rang = NSMakeRange(i, 1);
        NSString *str1 = [MD5PinJieStr substringWithRange:rang];
        NSString *str2 = [str1 substringToIndex:1];
        [pinjieStrToMuarray addObject:str2];
    }
    
    // 4.开始摘要
    __block NSMutableString *uid = [[NSMutableString alloc] init]; // 最后要的UID
    [currentDateMurray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [uid appendString:[NSString stringWithFormat:@"%@",pinjieStrToMuarray[[currentDateMurray[idx] intValue]]]];
    }];
    
    return uid;
}


#pragma mark 获得当前时间
+ (NSString *)stringGetCurrentDateStr
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HHmmssss"];
    return [formatter stringFromDate:date];
}

#pragma mark 获得当前时间
+ (NSString *)stringGetCurrentDateStr2
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
    
}

#pragma mark 获得当前时间
+ (NSString *)stringGetCurrentDateStr3
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:date];
}

#pragma mark 将当前时间字符串放到数组
+ (NSMutableArray *)currentDateArray:(NSString *)currentDateStr
{
    NSMutableArray *currentDateMuArray  = [NSMutableArray array];
    
    for (int i = 0; i < currentDateStr.length ; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *str1 = [currentDateStr substringWithRange:range];
        NSString *str2 = [str1 substringToIndex:1];
        [currentDateMuArray addObject:str2];
    }
    return currentDateMuArray;
}


#pragma mark 获得混淆两次的时间
+ (NSMutableString *)getMixDateWith:(NSMutableArray *)currentDateMuArray
{
    // 1. 获取两次时间混淆
    NSMutableArray *firstMixDateMuArray = [NSMutableArray array];
    
    [currentDateMuArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx % 2 == 0) {
            [firstMixDateMuArray addObject:currentDateMuArray[idx]];
        }
    }];
    
    [currentDateMuArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx % 2 != 0) {
            [firstMixDateMuArray addObject:currentDateMuArray[idx]];
        }
    }];
    
    
    NSMutableArray *secondMixDateMuArray = [NSMutableArray array];
    [firstMixDateMuArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx % 2 == 0) {
            [secondMixDateMuArray addObject:firstMixDateMuArray[idx]];
        }
    }];
    
    [firstMixDateMuArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx % 2 != 0) {
            [secondMixDateMuArray addObject:firstMixDateMuArray[idx]];
        }
    }];
    
    
    // 2. 将混淆的时间从数组中取出来转成字符串
    __block NSMutableString *mixDateStr = [[NSMutableString alloc] init];
    [secondMixDateMuArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [mixDateStr appendString:[NSString stringWithFormat:@"%@",secondMixDateMuArray[idx]]];
    }];
    
    return mixDateStr;
}


#pragma mark 获得字典中所有的键并且将健升序返回字符串
+ (NSString *)getAllKeysWithSort:(NSDictionary *)dic
{
    
    // 获得排好序的键数组
    NSArray *sortKeysArray = [[dic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    // 返回拍好序的字典 dic
    [sortKeysArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [dic objectForKey:obj];
    }];
    
    
    NSMutableArray *sortKeyVlueMuarray = [NSMutableArray array]; // 将拍好序列的字典(包含键和值)
    
    for (int i = 0; i < sortKeysArray.count; i++) {
        
        if (![dic objectForKey:sortKeysArray[i]]) {
            [[dic objectForKeyedSubscript:sortKeysArray[i]] isEqualToValue:NULL];
        }
        
        NSMutableString *b = [NSMutableString stringWithFormat:@"%@=%@",sortKeysArray[i],[dic objectForKey:sortKeysArray[i]]];
        
        if (i < sortKeysArray.count - 1) {
            
            [b appendString:@"&"];
        }
        
        [sortKeyVlueMuarray addObject:b];
    }
    
    // 遍历对键值排好序的数组
    __block NSMutableString *uid = [[NSMutableString alloc] init];
    [sortKeyVlueMuarray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [uid appendString:[NSString stringWithFormat:@"%@",sortKeyVlueMuarray[idx]]];
    }];
    
    return  uid;
}


#pragma mark 获得UUID
+ (NSString *)getUUID
{
    return [UserAccount getUserLoginInfo].userMobile;
}

#pragma mark 获得公钥
+ (NSString *)getPulicKey
{
    return [FNUserDefaults objectForKey:PUBLIC_KEY];
}


#pragma mark MD5对字符串加密
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (uint32_t)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}


#pragma mark 验证手机号码是否合法
+ (BOOL)stringValidateMobile:(NSString *)mobileNum
{
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:mobileNum];
    return isMatch;
}

#pragma mark 验证输入是否为数字
+ (BOOL)stringValidateCureNum:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

@end
