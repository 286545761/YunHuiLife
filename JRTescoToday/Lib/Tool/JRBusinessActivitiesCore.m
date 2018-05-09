//
//  JRBusinessActivitiesCore.m
//  JRTescoToday
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRBusinessActivitiesCore.h"
#import "HttpTool.h"
#import "JRUserDefault.h"
@implementation JRBusinessActivitiesCore
//GET /merchant/activitis
#pragma mark - 商家活动列表
+ (void)queryActivitiesCenter_BusinessActivitiesListWithType:(ActivitiesCenter_Type)type PageNum:(NSInteger)pageNum AndPageSize:(NSInteger)pageSize Successed:(CompleteBlock)success Faild:(FaildBlock)faild {
    NSString *token = [JRUserDefault getTOKEN];
    NSDictionary *paramDict = @{@"access_token":token,@"pageNum":[NSString stringWithFormat:@"%ld", pageNum],@"pageSize":[NSString stringWithFormat:@"%ld", pageSize]};
    [HttpTool getWithBaseURL:kBaseURL path:@"/merchant/activities" params:paramDict success:^(id data) {
        success(data);
        
        
        
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        faild(alertInfo);
    }];
}
#pragma mark - 创建活动
//+ (void)queryActivitiesCenter_CreatBusinessActivitiesWithParam:(NSDictionary *)ParamDict Successed:(CompleteBlock)success Faild:(FaildBlock)faild {
//    //@"access_token":[JRUserDefault getTOKEN],
//    NSString *urlString = [NSString stringWithFormat:@"%@?access_token=%@",@"/merchant/activities",[JRUserDefault getTOKEN]];
//    [HttpTool postWithNSURLConnectionBaseURL:kBaseURL path:urlString params:ParamDict success:^(id data) {
//
//        success(data);
//    } failure:^(NSError *error) {
//
//    } alertInfo:^(NSString *alertInfo) {
//        faild(alertInfo);
//    }];
//}
#pragma mark - 更改活动状态
+ (void)queryActivitiesCenter_ChangeBusinessActivitiesWithParam:(NSDictionary *)ParamDict Successed:(CompleteBlock)success Faild:(FaildBlock)faild {
    [HttpTool quttWithBaseURL:kBaseURL path:@"/merchant/activity" params:ParamDict success:^(id data) {
        success(data);
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        faild(alertInfo);
    }];
}

@end
