//
//  WanAmontModel.h
//  DHInvestment
//
//  Created by Andy on 16/9/14.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WanAmontModel : NSObject
@property(nonatomic,strong)NSString *endInterestDate;
@property(nonatomic,strong)NSString *investmentAmount;
@property(nonatomic,strong)NSString *projectContractDetailsUrl;
@property(nonatomic,strong)NSString *projectId;
@property(nonatomic,strong)NSString *projectName;
@property(nonatomic,strong)NSString *projectProfit;
@property(nonatomic,strong)NSString *projectTimeLimit;
@property(nonatomic,strong)NSString *startInterestDate;
@property(nonatomic,strong)NSString *state;
- (id)initWithDict:(NSDictionary *)dic;
@end
