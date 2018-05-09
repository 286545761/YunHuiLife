//
//  JRAppVersionModel.m
//  JRTescoToday
//
//  Created by apple on 2017/11/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRAppVersionModel.h"
#import "NSDictionary+NullExamine.h"
@interface JRAppVersionModel ()

@end

@implementation JRAppVersionModel
+ (instancetype)appVersionModelWithResultDict:(NSDictionary *)dict {
    JRAppVersionModel *model = [[JRAppVersionModel alloc] init];
    NSDictionary *releaseInfo = dict;
    
    model.updateInfo = [releaseInfo stringForKey:@"updateInfo"];
    model.isNew = [releaseInfo stringForKey:@"isNew"];
    model.isForce = [NSString stringWithFormat:@"%@",[releaseInfo stringForKey:@"isForce"]];
    model.versionUrl=[releaseInfo stringForKey:@"versionUrl"];
    return model;
}

@end
