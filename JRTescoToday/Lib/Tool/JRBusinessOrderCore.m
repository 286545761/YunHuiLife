//
//  JRBusinessOrderCore.m
//  JRTescoToday
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRBusinessOrderCore.h"
#import "HttpTool.h"
#import "JRUserDefault.h"
@implementation JRBusinessOrderCore
#pragma mark - 订单列表

+ (void)queryBusinessOrderListWithType:(NSInteger)type PageNum:(NSInteger)pageNum AndPageSize:(NSInteger)pageSize Successed:(SuccessedBlock)success Faild:(FaildBlock)faild {
    NSString *tokenStr = [JRUserDefault getTOKEN];
    NSString *typeStr = [NSString stringWithFormat:@"%ld",type];
    NSString *pageNumStr = [NSString stringWithFormat:@"%ld",pageNum];
    NSString *pageSizeStr = [NSString stringWithFormat:@"%ld",pageSize];
    //
    NSMutableDictionary *paramDic;
    
    if (type == 10) {
        //全部订单
        paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":tokenStr, @"pageNum":pageNumStr, @"pageSize":pageSizeStr}];
    } else {
        paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":tokenStr, @"pageNum":pageNumStr, @"pageSize":pageSizeStr, @"status":typeStr}];
    }
    //GET /person/orders
    [HttpTool getWithBaseURL:kBaseURL path:@"person/orders" params:paramDic success:^(id data) {
        success(data);
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        faild(alertInfo);
    }];
}

#pragma mark - 订单详情
+ (void)queryBusineesOrderDetailWithID:(NSString *)ID Successed:(SuccessedBlock)success Faild:(FaildBlock)faild {
    NSString *token = [JRUserDefault getTOKEN];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":token}];
    ///person/orders
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",@"person/orders",ID];
    [HttpTool getWithBaseURL:kBaseURL path:urlStr params:paramDic success:^(id data) {
        success(data);
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        faild(alertInfo);
    }];

}



@end
