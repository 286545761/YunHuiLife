//
//  JRUserDefault.h
//  JRTescoToday
//
//  Created by apple on 2017/12/20.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRUserDefault : NSObject
//token
+ (void)saveTOKEN:(NSString *)token;
+ (NSString *)getTOKEN;
+ (void)clearToken;
//refresh_token
+ (void)saveRefreshTOKEN:(NSString *)token;
+ (NSString *)getRefreshTOKEN;
+ (void)clearRefreshToken;
@end
