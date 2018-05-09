//
//  JRUserDefault.m
//  JRTescoToday
//
//  Created by apple on 2017/12/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRUserDefault.h"

@implementation JRUserDefault
#pragma mark - token
+ (void)saveTOKEN:(NSString *)token{
    NSUserDefaults * tokenUserDefault = [NSUserDefaults standardUserDefaults];
    [tokenUserDefault setValue:token forKey:@"usersid"];
    [tokenUserDefault synchronize];
}
//获取 登录token
+ (NSString *)getTOKEN{
    NSUserDefaults *tokenUserDefault = [NSUserDefaults standardUserDefaults];
    NSString *tokenStr = [tokenUserDefault valueForKey:@"usersid"];
    return tokenStr;
}
//清空登录token
+ (void)clearToken {
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:nil forKey:@"usersid"];
    [userDefault synchronize];
}
#pragma mark - refreshToken
+ (void)saveRefreshTOKEN:(NSString *)token {
    NSUserDefaults * tokenUserDefault = [NSUserDefaults standardUserDefaults];
    [tokenUserDefault setValue:token forKey:@"oldusersid"];
    [tokenUserDefault synchronize];
}
+ (NSString *)getRefreshTOKEN {
    NSUserDefaults *tokenUserDefault = [NSUserDefaults standardUserDefaults];
    NSString *tokenStr = [tokenUserDefault valueForKey:@"oldusersid"];
    return tokenStr;
}
+ (void)clearRefreshToken {
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:nil forKey:@"oldusersid"];
    [userDefault synchronize];
}

@end
