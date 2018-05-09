//
//  OtherWaysLoginController.h
//  DHInvestment
//
//  Created by JJS on 15/9/23.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherWaysLoginController : BaseController
@property (weak, nonatomic) IBOutlet UIButton *longinBtn;
@property (weak, nonatomic) IBOutlet UIButton *sentBtn;
@property (nonatomic,strong)NSString *inviter;
/*
 *
 */
@property(copy,nonatomic)void (^logoBackBlock)();
@end
