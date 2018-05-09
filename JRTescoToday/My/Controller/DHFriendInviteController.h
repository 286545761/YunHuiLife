//
//  DHFriendInviteController.h
//  DHInvestment
//
//  Created by Andy on 16/6/13.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHFriendInviteModel.h"
#import "DHFriendInviteListModel.h"

@interface DHFriendInviteController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView* friendInviteTableView;
@property(nonatomic,strong)NSString *type;
@property (nonatomic,strong)DHFriendInviteModel* friendInviteModel;


@end
