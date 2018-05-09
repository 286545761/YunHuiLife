//
//  HttpTool.m
//  DuohaoTechnolog
//
//  Created by apple on 15-08-24.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "Login.h"
@interface HttpTool()

@end

@implementation HttpTool

+ (void)requestWithBaseURL:(NSString *)baseURL path:(NSString *)path params:(NSDictionary *)params
                   success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure method:(NSString *)postMethod alertInfo:(HttpAlertInfoBlock)alertInfo
{
    // 1.创建post请求
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:baseURL]];
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    
    // 拼接传进来的参数
    if (params) {
        [allParams setDictionary:params];
    }
  
   
    NSMutableURLRequest *post = [client requestWithMethod:postMethod path:path parameters:allParams];
    
    // 2.创建AFJSONRequestOperation对象
    NSOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:post
                                                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                          NSLog(@"123344%@",response);
                                                                          
                                                                          
                                                                          NSLog(@"%@",JSON);
                                                                          
                                                                          // 返回成功的值
                                                                          if ([JSON[@"code"] intValue] >= 5000) {
                                                        
                                                                              NSDictionary *jsonDataDict=JSON[@"data"];
                                                                              if (jsonDataDict==nil) {
                                                                                  jsonDataDict=JSON;
                                                        }
                                                                              
                                                success(jsonDataDict);
                                                                          }else if ([JSON[@"code"] intValue] < 5000 && [JSON[@"open"] intValue] != 1){
                                                                              [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                                                                              alertInfo(@"目前访问人数太多，请稍后再试!");
                                                                          }
                                                                          
                                                                          if ([JSON[@"open"] intValue] ==1 && JSON[@"msg"] != nil){
                                                                              [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//                                                                              dispatch_sync(dispatch_get_main_queue(), ^{
                                               [MBProgressHUD showError:JSON[@"msg"]];
//                                                                              });
                                                                                   alertInfo(JSON[@"msg"]);
                                                                          }
                                                                      }
                                                                     failure : ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                failure(error);
                                                                         NSLog(@"%@",response);
                                                                         NSLog(@"123344%@", [NSString stringWithFormat:@"%ld",response.statusCode] );
                                                                         if ([[NSString stringWithFormat:@"%ld",response.statusCode] isEqualToString:@"401"]) {
                                                                             [Login loginRenZengPhone:nil andPwdnum:nil];
                                                                         }
                                                                         
                                                                     }];
    
    // 3.发送请求
    [op start];
}


+ (void)postWithBaseURL:(NSString *)baseURL path:(NSString *)path params:(NSDictionary *)params
                success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure alertInfo:(HttpAlertInfoBlock)alertInfo
{
    [self requestWithBaseURL:baseURL path:path params:params success:success failure:failure method:@"POST" alertInfo:alertInfo];
}


+ (void)getWithBaseURL:(NSString *)baseURL path:(NSString *)path params:(NSDictionary *)params
               success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure alertInfo:(HttpAlertInfoBlock)alertInfo
{
    [self requestWithBaseURL:baseURL path:path params:params success:success failure:failure method:@"GET" alertInfo:alertInfo];
}
+ (void)quttWithBaseURL:(NSString *)baseURL path:(NSString *)path params:(NSDictionary *)params
               success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure alertInfo:(HttpAlertInfoBlock)alertInfo
{
    [self requestWithBaseURL:baseURL path:path params:params success:success failure:failure method:@"PUT" alertInfo:alertInfo];
}
@end
