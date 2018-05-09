//
//  WanAmontModel.m
//  DHInvestment
//
//  Created by Andy on 16/9/14.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "WanAmontModel.h"

@implementation WanAmontModel
- (id)initWithDict:(NSDictionary *)dic
{
    _endInterestDate=dic[@"endInterestDate"];
    _investmentAmount=dic[@"investmentAmount"];
    _projectContractDetailsUrl=dic[@"projectContractDetailsUrl"];
    _projectId=[NSString stringWithFormat:@"%@",dic[@"projectId"]];
    _projectName=[NSString stringWithFormat:@"%@",dic[@"projectName"]];
    _projectProfit=[NSString stringWithFormat:@"%@",dic[@"projectProfit"]];
    _projectTimeLimit=[NSString stringWithFormat:@"%@",dic[@"projectTimeLimit"]];
    _startInterestDate=[NSString stringWithFormat:@"%@",dic[@"startInterestDate"]];
    _state=[NSString stringWithFormat:@"%@",dic[@"state"]];
    return self;
    
}
@end
