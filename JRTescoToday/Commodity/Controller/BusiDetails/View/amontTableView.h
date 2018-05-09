//
//  amontTableView.h
//  JRTescoToday
//
//  Created by 123 on 2018/1/2.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^amontTableViewBlock)(UIView *tableView);

@interface amontTableView : UIView
/*
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
 @end*/



+(void)getTableView:(UITableView *)tableview View:(amontTableViewBlock)view;

 @end
