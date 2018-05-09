//
//  SetPassWordController.h
//  DHInvestment
//
//  Created by JJS on 15/9/22.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPassWordController : BaseController

// 接收从忘记密码页面用户输入的手机号码
@property (nonatomic,copy) NSString *phoneNum;

@property(nonatomic,assign) int indexSource;

@end
