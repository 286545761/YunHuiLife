//
//  LoginController.h
//  DHInvestment
//
//  Created by JJS on 15/9/9.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : BaseController

@property (weak, nonatomic) IBOutlet UIButton *zhuceshanjiaBtn;
@property (nonatomic,copy) NSString *phoneNumFromForgot;
@property(nonatomic,strong)NSString *shouYe;
@property(nonatomic,strong)NSString *dianjihuodong;
@property (weak, nonatomic) IBOutlet UIButton *logbtn;
@property (weak, nonatomic) IBOutlet UIButton *UserBtn;
@property (weak, nonatomic) IBOutlet UIButton *userzhuce;
@property (weak, nonatomic) IBOutlet UIView *line;
@end
