//
//  UserAccount.h
//  DHInvestment
//
//  Created by JJS on 15/9/11.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//  将用户登录信息存到本地

#import <Foundation/Foundation.h>

@interface UserAccount : NSObject<NSCoding>

@property (nonatomic,copy) NSString  *userMobile;
@property (nonatomic,copy) NSString  *userPassword;

@property (nonatomic, strong) UserAccount *userAccount;

#pragma mark 归档
- (void)saveUserLoginInfo:(UserAccount *)userAccount;

#pragma mark 解档
- (UserAccount *)getUserLoginInfo;

#pragma mark 提供类方法供外部调用
+ (UserAccount *)getUserLoginInfo;
@end
