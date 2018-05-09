//
//  JRAppVersionCore.m
//  JRTescoToday
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRAppVersionCore.h"
#import "HttpTool.h"
@interface JRAppVersionCore ()

@end

@implementation JRAppVersionCore
+ (void)checkAppVerionForUpdate:(CheckUpdateBlock)updateBlock {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    //http://123.57.1.61:8092/system/checkNewVersion?type=0&version=1.0.0
    NSString *currentAppVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:currentAppVersion,@"version", nil];
    
    [HttpTool getWithBaseURL:kBaseURL path:@"/system/check/0" params:paramsDict success:^(id data) {
        NSDictionary *dict = data;
        JRAppVersionModel *model = [JRAppVersionModel appVersionModelWithResultDict:dict];
        updateBlock(model,nil);
    } failure:^(NSError *error) {
   
        updateBlock(nil,error);
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}


//版本更新方法实现
- (NSComparisonResult)shouldUpdateOnlineVersion {
    //获取app地址
    NSURL *appURLPath = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",@"1382504763"]];
    //获取发布版本的Version
    NSString *string = [NSString stringWithContentsOfURL:appURLPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString *onlineVersion;
    
    if (!([string isEqualToString:@""] || string == nil)) {
//        NSDictionary *dic = [JsonUtil dictionaryWithJsonString:string];
        
//        NSInteger resultCount = [[dic objectForKey:@"resultCount"] integerValue];
//        if (resultCount == 1) {
//            NSArray *result = [dic objectForKey:@"results"];
//            NSDictionary *first = [result firstObject];
//            onlineVersion = [first objectForKey:@"version"];
//        }else{
//            return NSOrderedDescending;
//        }
        
        
    }
    
    NSString *nowVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    
    NSComparisonResult result = [nowVersion compare:onlineVersion];
    return result;
    
    
}

@end
