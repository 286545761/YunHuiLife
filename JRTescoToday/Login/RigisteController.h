//
//  RigisteController.h
//  DHInvestment
//
//  Created by JJS on 15/9/8.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RigisteController : BaseController
@property (weak, nonatomic) IBOutlet UIButton *rigistBtn;
@property (weak, nonatomic) IBOutlet UIView *viewname;
@property (weak, nonatomic) IBOutlet UILabel *shangjai;
@property (weak, nonatomic) IBOutlet UITextField *shangjiatext;
@property(weak,nonatomic)NSString *nihao;
@property(strong,nonatomic)NSString *inviter;
@property (weak, nonatomic) IBOutlet UITextField *Tui;
@property (weak, nonatomic) IBOutlet UIButton *shangjiazhuce;

@end
