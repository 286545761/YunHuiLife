//
//  UserAccount.m
//  DHInvestment
//
//  Created by JJS on 15/9/11.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "UserAccount.h"

@implementation UserAccount

- (instancetype)init
{
    if (self == nil) {
        self = [[UserAccount alloc] init];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)enCoder
{
    [enCoder encodeObject:self.userMobile forKey:@"userMobile"];
    [enCoder encodeObject:self.userPassword forKey:@"userPassword"];
}

- (id)initWithCoder:(NSCoder *)deCoder
{
    if (self = [super init]) {
        self.userMobile = [deCoder decodeObjectForKey:@"userMobile"];
        self.userPassword = [deCoder decodeObjectForKey:@"userPassword"];
    }
    return self;
}

#pragma mark 归档
- (void)saveUserLoginInfo:(UserAccount *)userAccount
{
    _userAccount = userAccount;
    [NSKeyedArchiver archiveRootObject:userAccount toFile:kFilePath];
}

#pragma mark 解档
- (UserAccount *)getUserLoginInfo
{
    _userAccount = [NSKeyedUnarchiver unarchiveObjectWithFile:kFilePath];
    
    return _userAccount;
}

#pragma mark 提供类方法供外部调用
+ (UserAccount *)getUserLoginInfo
{
    return [[[self alloc] init] getUserLoginInfo];
}
@end
