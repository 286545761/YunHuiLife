//
//  FeedBackVC.h
//  DHInvestment
//
//  Created by Andy on 15/9/5.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedBackView.h"

@interface FeedBackVC : BaseController<UITextViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong)FeedBackView* feedBackView;
@property(nonatomic,strong)NSString* idnn;
@property(nonatomic,strong)NSString* orderCode;
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSString* imageString;
@property(nonatomic,strong)NSString* jiaQian;
@end
