//
//  HttpTool.h
//  DuohaoTechnolog
//
//  Created by apple on 15-08-24.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//  请求工具类

#import <Foundation/Foundation.h>

typedef void (^HttpSuccessBlock)(id data);
typedef void (^HttpFailureBlock)(NSError *error);
typedef void (^HttpAlertInfoBlock)(NSString *alertInfo); // 提示信息

typedef void (^requestOptCall)(NSInteger flage,id result);

@interface HttpTool : NSObject


+ (void)postWithBaseURL:(NSString *)baseURL path:(NSString *)path params:(NSDictionary *)params
                success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure alertInfo:(HttpAlertInfoBlock)alertInfo;

+ (void)quttWithBaseURL:(NSString *)baseURL path:(NSString *)path params:(NSDictionary *)params
                success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure alertInfo:(HttpAlertInfoBlock)alertInfo;
+ (void)getWithBaseURL:(NSString *)baseURL path:(NSString *)path params:(NSDictionary *)params
               success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure alertInfo:(HttpAlertInfoBlock)alertInfo;
@end
