//
//  DHMyInviteController.m
//  DHInvestment
//
//  Created by Andy on 16/6/13.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "DHMyInviteController.h"
#import "MJRefresh.h"
#import "DHMyInviteCell.h"
#import "UserAccount.h"
#import "MyFriendModel.h"
@interface DHMyInviteController ()
{
    NSMutableArray  *totalDataMuArray;
    
    NSInteger pageNum;
    int total;
    NSDictionary*datas ;
    
}

@end

@implementation DHMyInviteController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    pageNum = 1;
    total=0;
    self.navigationController.navigationBarHidden = NO;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.97f alpha:1.00f];
    
    totalDataMuArray = [[NSMutableArray alloc] init];
    [self downLoad];
    [self setUpMyInviteTableView];
    
    [self loadMyInviteData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-  (void)loadMyInviteData
{

    
}

-(NSString *)bs64:(NSData *)data
{
    NSData  *str2=[data  base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    NSString *str=[[NSString alloc] initWithData:str2  encoding:NSUTF8StringEncoding];
    return str;
}


- (void)setUpMyInviteTableView
{
    
    _myInviteTableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height) style:UITableViewStylePlain];
    
    _myInviteTableView.delegate = self;
    
    _myInviteTableView.dataSource = self;
    
    _myInviteTableView.backgroundColor = [UIColor clearColor];
    
    _myInviteTableView.separatorColor = [UIColor clearColor];
    
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
    _myInviteTableView.header = header;
    
    //上拉加载
    //
    //设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //
    //禁止自动加载
    //footer.automaticallyRefresh = NO;
    //
    // 设置footer
    _myInviteTableView.footer = footer;
    //
    
    [self.view addSubview:_myInviteTableView];
    
    
}

- (void)loadNewData
{
    pageNum=1;
    [self downLoad];
    
    [_myInviteTableView.header endRefreshing];
    
}

- (void)loadMoreData
{
    pageNum=++pageNum;
    [self downLoad];
    [_myInviteTableView.footer endRefreshing];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return totalDataMuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      MyFriendModel *ma=[[MyFriendModel alloc] init];
     ma= [totalDataMuArray objectAtIndex:indexPath.row];
    
    static NSString *cellStr = @"DHMyInviteCell";
    
    DHMyInviteCell *myInviteCell =  [tableView dequeueReusableCellWithIdentifier:cellStr];
    myInviteCell.titleLable.hidden=YES;
    myInviteCell.dateLable.hidden=YES;
    myInviteCell.moneyLable.hidden=YES;
    if (myInviteCell == nil)
    {
        
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"DHMyInviteCell" owner:nil options:nil];
        
        myInviteCell = [array lastObject];
        
        
    }
    
    
  
        

        
        myInviteCell.phoneLable.text =[NSString  stringWithFormat:@"%@",ma.phone];;
        
        
        
        
        myInviteCell.dateLable.text = ma.time;
        
        
        
        
 
    
    
    
    myInviteCell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    return myInviteCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [_myInviteTableView deselectRowAtIndexPath:[_myInviteTableView indexPathForSelectedRow] animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 0)];
    
    headerView.backgroundColor =[UIColor whiteColor];
    
    UIView* view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 60)];
    UILabel* numLable21 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,kScreenSize.width,60)];
    if ([_mq isEqualToString:@"1"]) {
       numLable21.text = [NSString stringWithFormat:@"累计邀请个人数:%@",_ge];
    }else
    {
        numLable21.text = [NSString stringWithFormat:@"累计邀请店铺数:%@",_ge];  
    }
  
    
    numLable21.textAlignment = 1;
    
    numLable21.textColor = [UIColor colorWithHexString:BunRed];;
    
    numLable21.font = [UIFont systemFontOfSize:17];
    
    [view1 addSubview:numLable21];

    view1.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
    [headerView addSubview:view1];
    
    UILabel* numLable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 60,kScreenSize.width/4,44)];
    
    numLable1.text =@"邀请用户";
    
    numLable1.textAlignment = 1;
    
    numLable1.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    numLable1.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:numLable1];
    
    
    UILabel* numLable3 = [[UILabel alloc]initWithFrame:CGRectMake(kScreenSize.width/4*3, 60,kScreenSize.width/4,44)];
    
    numLable3.text =@"注册时间";
    
    numLable3.textAlignment = 1;
    
    numLable3.textColor = [UIColor colorWithRed:0.44f green:0.44f blue:0.44f alpha:1.00f];;
    
    numLable3.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:numLable3];
    return headerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 104;
}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"role":_mq,@"pageSize":@"10",
                                                                                    @"pageNum":[NSString stringWithFormat:@"%ld",pageNum],
                                                                                    
                                                                                }];
    
    NSMutableArray *marray=[[NSMutableArray alloc] init];
       if(total==0||(pageNum)*10<total) {
    [HttpTool getWithBaseURL:kBaseURL  path:@"person/invitation/records" params:paramDic success:^(id data) {
        
        for (NSMutableDictionary *dict in data[@"list"]) {
             MyFriendModel *ma=[[MyFriendModel alloc] initWithDict:dict];
            [marray addObject:ma];
        }
        total =[data[@"total"]  intValue];
        if (pageNum == 1) {
            [totalDataMuArray removeAllObjects];
        }
        [totalDataMuArray addObjectsFromArray:marray];
        [_myInviteTableView reloadData];
    
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
       }else
       {
           
       }
}

@end
