//
//  ZhangDanController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ZhangDanController.h"
#import "ZhangDanTableViewCell.h"
#import "ZahngdanModel.h"
#import "ZhangDanXainfqing1ViewController.h"
#import "ZhangDanXaingQing2ViewController.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
@interface ZhangDanController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *amontTableView;
    UIView *switchView;
    UIButton *switchBtn;
    UIButton *switchBtn1;
    UIButton *switchBtn2;
     UIButton *switchBtn3;
    UIButton *dingDingBtn;
    UIButton *sheYuBtn;
    UIButton *huoQiBtn;
    UIButton *tiYanBtn;
     UIView *lineView;
        int pageNum;
    int total;
    int statut;
    NSString *mau;
    ZhangDanTableViewCell *cell;
    NSMutableArray *totalArray;
}
@end

@implementation ZhangDanController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad]; self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    // Do any additional setup after loading the view from its nib.
    amontTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height-64) style:UITableViewStylePlain];
    totalArray=[[NSMutableArray alloc] init];
    amontTableView.delegate=self;
    amontTableView.dataSource=self;
    self.title=@"账单";
    [self.view addSubview:amontTableView];
    [self downLoad];
    total=0;
    pageNum=1;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    amontTableView.header = header;
    
    // 上拉
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    amontTableView.footer = footer;


}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=1;
    
    
 
        [self downLoad];
  
}

#pragma mark 上拉刷新
- (void)upPullloadData
{
    pageNum = ++pageNum;
    ;
    [self downLoad];
   
    
    
}

#pragma mark 切换

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  
        static NSString *cellName=@"cell";
        cell=[tableView dequeueReusableCellWithIdentifier:cellName];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"ZhangDanTableViewCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellAccessoryNone;
       
    ZahngdanModel *ma=[[ZahngdanModel alloc] init];
    ma=totalArray[indexPath.row];
    cell.time.text=ma.tradeTime;
    if ([ma.tradeCategory isEqualToString:@"-1"]) {
        cell.qian.text=[NSString  stringWithFormat:@"-￥%@",ma.tradeAmount];
        cell.qian.textColor=[UIColor blueColor];
    }
    else
    {
        cell.qian.textColor=[UIColor colorWithHexString:BunRed];
        cell.qian.text=[NSString  stringWithFormat:@"+￥%@",ma.tradeAmount];
    }
   
    cell.name.text=ma.tradeRemark;
    
        return cell;
    
    
   
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        return 80;
    
    
    
}
///* 这个函数是显示tableview的章节数*/
//-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
//{
//    return 2;
//}
///*设置标题头的宽度*/

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
        
        return totalArray.count;
  
    
    
}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        UILabel *name=[[UILabel alloc] init];
//        name.text=@"我是头一";
//        name.textColor=[UIColor redColor];
//        return name;
//    }
//    else
//        return @"都是头二";
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    
//    
//    if (section == 0)
//        
//    {
//        
//        UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//        
//        label1.text=@"我是好人";
//        
//        label1.backgroundColor=[UIColor yellowColor];
//        
//        return label1 ;
//        
//    }
//    
//    
//    else
//        
//    {
//        
//        UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
//        
//        label2.text=@"我是程序员";
//        
//        label2.backgroundColor =[UIColor blueColor];
//        
//        return label2 ;
//        
//    }
//    
//}

-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                  @"pageNum":[NSString stringWithFormat:@"%d",pageNum],@"pageSize":@"10",
                                                                                }];
    
    NSMutableArray *ma=[[NSMutableArray alloc] init];
    if(total==0||(pageNum-1)*10<total) {
        
    [HttpTool getWithBaseURL:kBaseURL  path:@"/wallet/bills" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            ZahngdanModel *zhang=[[ZahngdanModel alloc] initWithDict:dict];
//            if ([zhang.month isEqualToString:@""]) {
//                
//            }else
//            {
//                
//            }
            [ma addObject:zhang];
        }
        NSLog(@"%@",data);
         total =[data[@"total"]  intValue];
        if (pageNum == 1) {
            [totalArray removeAllObjects];
        }
         [totalArray addObjectsFromArray:ma];
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
       
        [amontTableView reloadData];
        
    } failure:^(NSError *error) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }];
    }
    else{
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZahngdanModel *ma=[[ZahngdanModel alloc] init];
    ma=totalArray[indexPath.row];
    if ([ma.tradeCategory isEqualToString:@"-1"]) {
        ZhangDanXainfqing1ViewController *zang=[[ZhangDanXainfqing1ViewController alloc] init];
        zang.idn=ma.idn;
        zang.title=@"账单详情";
        [self.navigationController pushViewController:zang animated:YES];
    }else
    {
        ZhangDanXaingQing2ViewController *zangf=[[ZhangDanXaingQing2ViewController alloc] init];
        zangf.idn=ma.idn;
         zangf.title=@"账单详情";
        [self.navigationController pushViewController:zangf animated:YES];
  
    }
   
    
    
}
@end
