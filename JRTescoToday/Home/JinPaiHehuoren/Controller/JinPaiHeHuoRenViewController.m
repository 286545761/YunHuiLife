//
//  JinPaiHeHuoRenViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JinPaiHeHuoRenViewController.h"
#import "JinPaiHenHuoView.h"
#import "MeAmontViewController.h"
#import "JinPanHeHuoRenModel.h"
#import "JinPaiHeHuoTableViewCell.h"
#import "ChanPingXiangQing12ViewController.h"
#import "BusinessUserViewController.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
@interface JinPaiHeHuoRenViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
     UIAlertView *alert;
     UITableView *_homeTableView;
    JinPanHeHuoRenModel  *mode;
    NSMutableArray *marray;
    NSString *string;
    int  pageNum;
    int total;
}
@property (weak, nonatomic) IBOutlet UILabel *jee;
@property (weak, nonatomic) IBOutlet UIButton *denglu;
@end

@implementation JinPaiHeHuoRenViewController
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    if ([[NSString stringWithFormat:@"%@",[FNUserDefaults objectForKey:@"dengluren"]] isEqualToString:@"merchant"]        ) {
        BusinessUserViewController *bus=[[BusinessUserViewController alloc] init];;
        [self.navigationController pushViewController:bus animated:YES];
    } if (![FNUserDefaults objectForKey:@"usersid"]) {
        _bror.hidden=YES;
        _yuan.hidden=YES;
        _yanjing.hidden=YES;
        
    }else
    {
        _denglu.hidden=YES;
        
        [self downLoad12];
    }
  [self downLoad];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    marray=[[NSMutableArray alloc] init];
    _Viewq.backgroundColor=[UIColor colorWithHexString:BunRed];
    _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 200, ScreenW, ScreenH-200) style:UITableViewStylePlain];
    _homeTableView.delegate=self;
    _homeTableView.dataSource=self;
    _homeTableView.backgroundColor=[UIColor clearColor];
    _homeTableView.showsVerticalScrollIndicator =
    NO;
    pageNum=1;
    total=0;
       _homeTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_homeTableView];

    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    _homeTableView.header = header;
    // 上拉
    _homeTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    _homeTableView.footer = footer;
}
- (IBAction)libtn:(id)sender {
    
    MeAmontViewController *mi=[[MeAmontViewController alloc] init];
    [self.navigationController pushViewController:mi animated:YES];
}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=1;
    
    //strxuaxin=@"fost";
    [self downLoad];
   // [self DownLoadView];
    
}
#pragma mark 上拉刷新
- (void)upPullloadData
{
    pageNum = ++pageNum;
     [self downLoad];
   // strxuaxin=@"ture";
   // [self DownLoadView];;
    
}

-(void)btn:(UIButton *)btn
{
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;

    }else
    {
        MeAmontViewController *mi=[[MeAmontViewController alloc] init];
        [self.navigationController pushViewController:mi animated:YES];
    }
   
}
- (IBAction)back:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
//    [self  dismissViewControllerAnimated:YES completion:^{
//        
//        
//        
//    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return marray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (iPhone6p) {
        
        return 117;
    }
    else{
        return 117;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cell";
    mode=marray[indexPath.row];
    JinPaiHeHuoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"JinPaiHeHuoTableViewCell" owner:self options:nil] lastObject];
    }
 
     cell.selectionStyle=UITableViewCellAccessoryNone;
    [cell.name setTitle:mode.name forState:UIControlStateNormal];
    cell.lilu.text=[NSString stringWithFormat:@"%@~%@",mode.minRate,mode.maxRate];
    cell.day.text=[NSString stringWithFormat:@"%@个月",mode.day];
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {

    JinPanHeHuoRenModel *ma=[[JinPanHeHuoRenModel alloc] init];
    ma=marray[indexPath.row];
    ChanPingXiangQing12ViewController *mi=[[ ChanPingXiangQing12ViewController alloc] init];
    mi.idp=ma.idn;
    mi.name=ma.name;
    mi.rate1=ma.minRate;
    mi.rate2=ma.maxRate;
        mi.qqAmount=ma.itAmount;
        mi.increaseAmount=ma.increaseAmount;
    mi.day=ma.day;
   [self.navigationController pushViewController:mi animated:YES];

    }
   
}

-(void)downLoad
{
//    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
//                                                                                    
//                                                                                    
//                                                                                    }];
    NSMutableArray *maarray=[[NSMutableArray alloc] init];
    
    if(total==0||(pageNum-1)*10<total) {
    [HttpTool getWithBaseURL:kBaseURL path:@"/invest/getFixedProjects" params:nil success:^(id data) {
        
        
        for (NSMutableDictionary *dict in data[@"list"]) {
            mode=[[JinPanHeHuoRenModel alloc] initWithDict:dict];
            [maarray addObject:mode];
        } if (pageNum == 1) {
            [marray removeAllObjects];
        }
         total =[data[@"total"]  intValue];
        [_homeTableView.header endRefreshing];
        [_homeTableView.footer endRefreshing];
        [marray removeAllObjects];
        [marray addObjectsFromArray:maarray];
        NSLog(@"%@",data);
        
        [_homeTableView reloadData];
        
    } failure:^(NSError *error) {
        [_homeTableView.header endRefreshing];
        [_homeTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [_homeTableView.header endRefreshing];
        [_homeTableView.footer endRefreshing];
    }];
    }else
    {
        [_homeTableView.header endRefreshing];
        [_homeTableView.footer endRefreshing];
    }
}
-(void)downLoad12
{
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                        @"pageSize":@"10",
                                                                                        @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
    
                                                                                        }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"/invest/getInvestFixedAccount" params:paramDic success:^(id data) {
        
        
//        for (NSMutableDictionary *dict in data[@"list"]) {
//            mode=[[JinPanHeHuoRenModel alloc] initWithDict:dict];
//            [marray addObject:mode];
//        }
//        
//        NSLog(@"%@",data);
//        
//        [_homeTableView reloadData];
        _jee.text=[NSString stringWithFormat:@"¥%@",data[@"amount"]];
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}

- (IBAction)xiangqing:(id)sender {
    MeAmontViewController *mi=[[MeAmontViewController alloc] init];
    [self.navigationController pushViewController:mi animated:YES];
    }
- (IBAction)denglu:(id)sender {
    LoginController *rigiste = [[LoginController alloc] init];
    rigiste.shouYe=@"shouye";
    
    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
    [self presentViewController:avc animated:YES completion:^{
        
    }];;
   }
@end
