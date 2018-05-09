//
//  DHFriendInviteController.m
//  DHInvestment
//  Created by Andy on 16/6/13.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "DHFriendInviteController.h"
#import "MJRefresh.h"
#import "DHFriendInviteCell.h"
#import "UserAccount.h"
#import "FenLunModel.h"
@interface DHFriendInviteController ()
{
   // NSMutableArray  *totalDataMuArray;
    NSMutableArray  *totalDataMuArray21;
    NSInteger pageNum;
    int total;
    NSDictionary*datas ;
    UIView *switchView;
    UIButton *switchBtn;
    UIButton *switchBtn1;
    UIButton *switchBtn2;
    UIView *lineView;
    NSString *maked;
    UIView* headerView;
}

@end

@implementation DHFriendInviteController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"奖励明细";
    
    self.navigationController.navigationBarHidden = NO;
    
    pageNum = 1;
    total=0;
    maked=@"2";
    self.view.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.97f alpha:1.00f];
    
    totalDataMuArray21 = [[NSMutableArray alloc] init];
   
    [self setUpFriendInviteTableView];
   // headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 0)];
    lineView=[[UIView alloc] init];
  
    lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame), switchBtn.frame.size.width, 1);
    lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
    [switchView addSubview:lineView];
   // [self loadFriendInviteData];
     [self downLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpFriendInviteTableView
{
    
    _friendInviteTableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height) style:UITableViewStylePlain];
    
    _friendInviteTableView.delegate = self;
    
    _friendInviteTableView.dataSource = self;
    
    _friendInviteTableView.backgroundColor = [UIColor clearColor];
    
    _friendInviteTableView.separatorColor = [UIColor clearColor];
    switchView=[[UIView alloc] init];
    switchView.backgroundColor=[UIColor whiteColor];
    switchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [switchBtn setTitle:@"全部"forState:UIControlStateNormal];
//    switchBtn.tag=2000;
//    switchBtn.titleLabel.font=[UIFont systemFontOfSize:15];
//    switchBtn.titleLabel.textColor=[UIColor colorWithHexString:BunRed];
//    [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
//    [switchBtn addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
//    switchBtn.frame=CGRectMake(0,0, kScreenSize.width/3 , 40);
//    [switchView addSubview:switchBtn];
    
    switchBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn1 setTitle:@"店铺奖励"forState:UIControlStateNormal];
    switchBtn1.tag=2001;
    switchBtn1.titleLabel.font=[UIFont systemFontOfSize:15];
//    [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    [switchBtn1 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];

    [switchBtn1 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
    switchBtn1.selected=YES;
    switchBtn1.frame=CGRectMake( 0,0, kScreenSize.width/2 ,40 );
    [switchView addSubview:switchBtn1];
    
    switchBtn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn2 setTitle:@"个人奖励"forState:UIControlStateNormal];
    switchBtn2.tag=2002;
    switchBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    switchBtn1.titleLabel.font=[UIFont systemFontOfSize:12];
    switchBtn2.titleLabel.font=[UIFont systemFontOfSize:12];
    
    [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    [switchBtn2 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    switchBtn2.frame=CGRectMake(kScreenSize.width/2,0, kScreenSize.width/2 ,40 );
    //    viewimage.frame=CGRectMake(0, 0, kScreenSize.width, 10);
    //    viewimage.backgroundColor=[UIColor colorWithHexString:@"f5f5f9"];
    //    [switchView addSubview:viewimage];
    [switchView addSubview:switchBtn2];
    
    
    switchBtn.selected=YES;
    //    lineView=[[UIView alloc] init];
    switchView.frame=CGRectMake(0,0, kScreenSize.width , 41);
        lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame), switchBtn.frame.size.width, 1);
        lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
        [switchView addSubview:lineView];
    _friendInviteTableView.tableHeaderView=switchView;

    //下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //
    //设置自动切换透明度(在导航栏下面自动隐藏)
    //_investCashTabView .automaticallyChangeAlpha = YES;
    //
    //隐藏时间
    //_investCashTabView .lastUpdatedTimeLabel.hidden = YES;
    //
    //马上进入刷新状态
    //[header beginRefreshing];
    //
    //设置header
    _friendInviteTableView.header = header;
    
    //上拉加载
    //
    //设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //
    //禁止自动加载
    //footer.automaticallyRefresh = NO;
    //
    // 设置footer
    _friendInviteTableView.footer = footer;
    //
    
    [self.view addSubview:_friendInviteTableView];
    
    
}

-  (void)loadFriendInviteData
{
    
    
    
////    [FNUserDefaults objectForKey:@"MD5Pwd"];
////    NSLog(@"%@",[FNUserDefaults objectForKey:@"MD5Pwd"]);
////    //NSString*str=@"18311467990:8fcbc4997fa16e6394079085f7bd6ecb";
////    NSString* str = [NSString stringWithFormat:@"%@:%@",[UserAccount getUserLoginInfo].userMobile,[FNUserDefaults objectForKey:@"MD5Pwd"]];
////    NSLog(@"%@",str);
////    NSData *data= [str dataUsingEncoding:NSUTF8StringEncoding];
////    NSString *str2=[self bs64:data];
////    NSString*str1=[NSString stringWithFormat:@"Basic %@",str2];
////    NSLog(@"%@",str1);
//    
//    // NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
//    NSString *urlstring=[NSString  stringWithFormat:@"%@/v3.1/invite/invite_reward_send_record?type=%@&pageNum=%@",kBaseURL,_type,[NSString stringWithFormat:@"%ld",pageNum]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstring]
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:10.0];
//    [request setHTTPMethod:@"GET"];
//     [request  setValue:[FNUserDefaults objectForKey:@"usersid"] forHTTPHeaderField:@"x-auth-token"];
//    if (total==0||(pageNum-1)*10<total) {
//        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//            
//            if (!data) {
//                [_friendInviteTableView.header endRefreshing];
//                [_friendInviteTableView.footer endRefreshing];
//                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//                return ;
//            }
//            if (connectionError==nil) {
//                
//                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//                
//                
//                NSLog(@"%@",dict);
//                //5.回到主线程,进行更新页面
//                _friendInviteModel = [[DHFriendInviteModel alloc]init];
//                dispatch_sync(dispatch_get_main_queue(), ^{
//                    if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"]) {
//                        [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//                        datas = [dict objectForKey:@"data"];
//                        total=[datas[@"total"] intValue];
//                        for (NSDictionary* dic in [datas objectForKey:@"list"]) {
//                            
//                            
//                            //        userId：用户id
//                            //        phone：手机号
//                            //        amount：奖励金额
//                            //        isInvest：是否投资
//                            //        time：邀请时间
//                            
//                            
//                            
//                            //  NSNumber* userId =  dic [@"userId"];
//                            //NSNumber* phone =  dic [@"phone"];
//                            // boo* isInvest =  dic [@"isInvest"];
//                            //                           // NSNumber* time =  dic [@"time"];
//                            
//                            
//                            DHFriendInviteListModel* investCashListModel = [[DHFriendInviteListModel alloc]init];
//                            
//                            //                            NSString *str=[NSString stringWithFormat:@"%@",[time stringValue]];
//                            //                            NSDate *timeDate = [[NSDate alloc]initWithTimeIntervalSince1970:[str longLongValue]/1000.0];
//                            //                            NSDateFormatter *dateTime=[[NSDateFormatter alloc] init];
//                            //                            dateTime.dateFormat=@"yyyy-MM-dd";
//                            investCashListModel.time =  dic [@"time"];
//                            NSString *str21 = [  [NSString stringWithFormat:@"%@",[dic objectForKey:@"amount"]  ] stringByReplacingOccurrencesOfString:@"," withString:@""];
//                            investCashListModel.amount = [NSString stringWithFormat:@"%.2f",[str21 floatValue] ];
//                            investCashListModel.frientIn=  [NSString stringWithFormat:@"%@", dic[@"userLevel"]  ]          ;
//                            investCashListModel.phone = dic [@"phone"];
//                            ;
//                            investCashListModel.isInvest = [NSString  stringWithFormat:@"%@",dic [@"invest"] ];
//                            
//                            // investCashListModel.userId = [userId stringValue];
//                            
//                            [_friendInviteModel.list addObject:investCashListModel];
//                            
//                            
//                        }
//                        
//                        // 如果是下拉清空数组
//                        if (pageNum == 1) {
//                            [totalDataMuArray removeAllObjects];
//                        }
//                        
//                        // 存储每次刷新请求的数据
//                        [totalDataMuArray addObjectsFromArray:_friendInviteModel.list];
//                        [_friendInviteTableView reloadData];
//                        [_friendInviteTableView.header endRefreshing];
//                        [_friendInviteTableView.footer endRefreshing];
//                    }
//                    [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//                    if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
//                        [MBProgressHUD showError:dict[@"msg"]];
//                    }
//                    
//                });
//                
//                
//            }
//            else{
//                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//                [_friendInviteTableView.header endRefreshing];
//                [_friendInviteTableView.footer endRefreshing];
//            }
//            
//            
//            //4.解析
//            
//            
//        }];
//        
//    }
    
    
    
}

-(NSString *)bs64:(NSData *)data
{
    
    NSData  *str2=[data  base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    NSString *str=[[NSString alloc] initWithData:str2  encoding:NSUTF8StringEncoding];
    return str;
}

- (void)loadNewData
{
    pageNum=1;
    [self downLoad];
    [_friendInviteTableView.header endRefreshing];
    
}

- (void)loadMoreData
{
    pageNum=++pageNum;
    [self downLoad];
    [_friendInviteTableView.footer endRefreshing];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return totalDataMuArray21.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // DHFriendInviteListModel* model= [totalDataMuArray objectAtIndex:indexPath.row];
    
    static NSString *cellStr = @"DHFriendInviteCell";
    
    DHFriendInviteCell *friendInviteCell =  [tableView dequeueReusableCellWithIdentifier:cellStr];
    
    if (friendInviteCell == nil)
    {
        
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DHFriendInviteCell" owner:nil options:nil];
        
        friendInviteCell = [array lastObject];
        
        
    }
    FenLunModel *ma=[[FenLunModel alloc] init];
    ma=totalDataMuArray21[indexPath.row];
    NSLog(@"%@dfdgd@",ma.userType);
    friendInviteCell.numLable.text=ma.userType;
    friendInviteCell.numLable1.text=ma.inviteName;
    friendInviteCell.numLable2.text=[NSString stringWithFormat:@"￥%@",ma.balance];
    friendInviteCell.numLable4.text=[NSString stringWithFormat:@"￥%@",ma.amount];
    friendInviteCell.numLable3.text=ma.time;
//
       
    
    friendInviteCell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    return friendInviteCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [_friendInviteTableView deselectRowAtIndexPath:[_friendInviteTableView indexPathForSelectedRow] animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
     headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 0)];
    if ([maked isEqualToString:@"0"]) {
        
    }
    
    
    headerView.backgroundColor =[UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    
    UIView* view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 5, SCREEN_SIZE.width, 114)];
    
    view1.backgroundColor = [UIColor colorWithHexString:@"ffa103"];
    
    UILabel* numLable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,0,kScreenSize.width/5,44)];
    
    numLable1.text =@"邀请用户";
    
    numLable1.textAlignment = 1;
    
    numLable1.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    numLable1.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:numLable1];
    
    UILabel* numLable = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5, 0,kScreenSize.width/5,44)];
    
    numLable.text =@"用户性质";
    
    numLable.textAlignment = 1;
    
    numLable.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    numLable.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:numLable];
    UILabel* numLable2 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5*2, 0,kScreenSize.width/5,44)];
    
    numLable2.text =@"流水金额";
    
    numLable2.textAlignment = 1;
    
    numLable2.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    numLable2.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:numLable2];
    UILabel* numLable3 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5*3, 0,kScreenSize.width/5,44)];
    
    numLable3.text =@"分润金额";
    
    numLable3.textAlignment = 1;
    
    numLable3.textColor =[UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    numLable3.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:numLable3];
    
    UILabel* numLable4 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/5*4, 0,kScreenSize.width/5,44)];
    
    numLable4.text =@"发放时间";
    
    numLable4.textAlignment = 1;
    
    numLable4.textColor =[UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    numLable4.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:numLable4];
//    lineView=[[UIView alloc] init];
//   
//    lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame), switchBtn.frame.size.width, 1);
//    lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
//    [switchView addSubview:lineView];
    return headerView;
}

-(void)switchButton:(UIButton *)btn
{
//    if (![self checkNet]) {
//        [MBProgressHUD showError:NO_CONNECT_NET];
//        return;
//    }
    if (btn.tag==2000) {
//        pageNum = 1;
//       // //statut=1;
//           maked=@"0";
//        [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
//        [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
//        [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
//       // mau=@"1";
//        [self downLoad];
        //[amontTableView reloadData];
    }
    else if(btn.tag==2001)
    {
        //statut=2;
        pageNum = 1;
        maked=@"2";
//        [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn1 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        switchBtn1.selected=YES;
//        switchBtn.selected=NO;
        switchBtn2.selected=NO;
       // mau=@"2";
        [self downLoad];
        // [cell removeFromSuperview];
        
        
        
    }else
    {
       // pageNum = 1;
       // statut=3;
        maked=@"1";
//        [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        switchBtn2.selected=YES;
//        switchBtn.selected=NO;
        switchBtn1.selected=NO;
       // mau=@"1";
        [self downLoad];
        // [amontTableView reloadData];
    }
    [UIView animateWithDuration:0.3 animations:^{
        lineView.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame), switchBtn.frame.size.width, 1);
    }];
    //[amontTableView reloadData];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 44;
}


-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"role":maked,
                                                                                    @"pageSize":@"10",
                                                                                    @"pageNum":[NSString stringWithFormat:@"%ld",pageNum],

                                                                                    }];
    NSMutableArray *array=[[NSMutableArray alloc] init];
       if(total==0||(pageNum-1)*10<total) {
    [HttpTool getWithBaseURL:kBaseURL  path:@"/person/invitation/rewards" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            FenLunModel *ma=[[FenLunModel alloc] initWithDict:dict];
            [array addObject:ma];
            NSLog(@"%@",data);
        }
         total =[data[@"total"]  intValue];
        if (pageNum == 1) {
            [totalDataMuArray21 removeAllObjects];
        }
        //[totalDataMuArray21 removeAllObjects];
        [totalDataMuArray21 addObjectsFromArray:array];
        [_friendInviteTableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
       }else
       {
           
       }
}

@end
