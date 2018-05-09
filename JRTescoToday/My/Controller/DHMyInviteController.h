//
//  DHMyInviteController.h
//  DHInvestment
//
//  Created by Andy on 16/6/13.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHMyInviteModel.h"
#import "DHMyInviteListModel.h"

@interface DHMyInviteController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView* myInviteTableView;
@property (nonatomic,strong)NSString* mq;
@property (nonatomic,strong)NSString* ge;
@property (nonatomic,strong)DHMyInviteModel* myInviteModel;

@end
