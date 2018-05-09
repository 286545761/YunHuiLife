//
//  DHMyInviteListModel.h
//  DHInvestment
//
//  Created by Andy on 16/7/2.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHMyInviteListModel : NSObject

//        userId：用户id
//        phone：手机号
//        amount：奖励金额
//        isInvest：是否投资
//        time：邀请时间


@property (nonatomic,copy)NSString* userId;

@property (nonatomic,copy)NSString* phone;

@property (nonatomic,copy)NSString* amount;

@property (nonatomic,strong)NSString* isInvest;

@property (nonatomic,copy)NSString* time;

@end
