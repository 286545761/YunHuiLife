//
//  MyPingJiaViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/24.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "MyPingJiaViewController.h"
#import "MyPingJiaTableViewCell.h"
#import "PingModel.h"
#import "UIImageView+WebCache.h"
#import "DingDanXiangQingViewController.h"
#import "DingDanGuanLiTableViewCell.h"
#import "FeedBackVC.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
#import "BusinessController.h"
@interface MyPingJiaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
     UITableView *_mineTableView;
    MyPingJiaTableViewCell *_cell;
    DingDanGuanLiTableViewCell *_cell1;
    NSMutableArray *totalArray;
    NSString *nuhaiCell;
    int  pageNum;
   int total;
}
@end

@implementation MyPingJiaViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    totalArray=[[NSMutableArray alloc] init];
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) style:UITableViewStylePlain];
    if ([_nunn isEqualToString:@"sj"]) {
          self.title=@"订单管理";
       nuhaiCell=@"DingDanGuanLiTableViewCell";
        [self downLoad1];
    }
    else{
          self.title=@"我的订单";
        nuhaiCell=@"MyPingJiaTableViewCell";
        [self downLoad];
    }
     pageNum=1;
    total=0;
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    _mineTableView.header = header;
    // 上拉
    _mineTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    _mineTableView.footer = footer;
    [self.view addSubview:_mineTableView];
    
}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=1;
    if ([_nunn isEqualToString:@"sj"]) {
       
        [self downLoad1];
    }
    else{
       
        [self downLoad];
    }

    //strxuaxin=@"fost";
 
    // [self DownLoadView];
    
}
#pragma mark 上拉刷新
- (void)upPullloadData
{
    pageNum = ++pageNum;
    if ([_nunn isEqualToString:@"sj"]) {
        
        [self downLoad1];
    }
    else{
        
        [self downLoad];
    }

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    if ([_nunn isEqualToString:@"sj"]) {
        _cell1 = [tableView dequeueReusableCellWithIdentifier:cellName];
        if(_cell1 == nil)
        {
            _cell1 = [[[NSBundle mainBundle] loadNibNamed:nuhaiCell owner:self options:nil] lastObject];
        }
         if (totalArray .count!=0) {
        PingModel *ping=[[PingModel alloc] init];
        ping=totalArray[indexPath.row];
        [_cell1.name  setTitle:[NSString stringWithFormat:@" %@",ping.orderCode]      forState:UIControlStateNormal];
        _cell1.qian.text=[NSString stringWithFormat:@"￥%@", ping.realAmount];
        _cell1.time.text=[NSString stringWithFormat:@"%@", ping.time]; ;
       // [_cell1.sahngjianame  setTitle:ping.userPhone forState:UIControlStateNormal];
        _cell1.shouji.text=[NSString stringWithFormat:@"%@", ping.userPhone];
//        [_cell1.touxiang  sd_setImageWithURL:[NSURL URLWithString:ping.userImg] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
//        [_cell1.touxiang sd_setImageWithURL:[NSURL URLWithString:ping.userImg] placeholderImage:nil options:SDWebImageProgressiveDownload];
        _cell1.selectionStyle = UITableViewCellAccessoryNone;
         }
        return _cell1;

    }
    else{
        _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if(_cell == nil)
        {
            _cell = [[[NSBundle mainBundle] loadNibNamed:nuhaiCell owner:self options:nil] lastObject];
        }
        if (totalArray .count!=0) {
            PingModel *ping=[[PingModel alloc] init];
            ping=totalArray[indexPath.row];
            _cell.DaiPingjia.tag=indexPath.row;
            
            if ([ping.isComment isEqualToString:@"0"]) {
                _cell.tui.hidden=YES;
                [_cell.zaici setImage:[UIImage imageNamed:@"pingjia"] forState:UIControlStateNormal];
                [_cell.zaici addTarget:self action:@selector(amontBtn1:) forControlEvents:
                 UIControlEventTouchUpInside];
                _cell.zaici.tag=indexPath.row;
            }else
            {
                
                _cell.tui.image=[UIImage imageNamed:@"icon_finish"];
                //[_cell.zaici setImage:[UIImage imageNamed:@"zaicigoumai"] forState:UIControlStateNormal];
                _cell.zaici.tag=indexPath.row;
                // [_cell.zaici addTarget:self action:@selector(amontBtn111:) forControlEvents:
                // UIControlEventTouchUpInside];
                _cell.DaiPingjia.hidden=YES;
                //_cell.name.hidden=YES;
                _cell.DaiPingjia.hidden=YES;
                _cell.daipingjia.hidden=YES;
                [_cell.name  setTitle:[NSString stringWithFormat:@" %@",ping.merchantName] forState:UIControlStateNormal];
                
            }
            [_cell.name setTitle:[NSString stringWithFormat:@" %@",ping.merchantName] forState:UIControlStateNormal];
            _cell.qian.text=[NSString stringWithFormat:@"￥%@",ping.realAmount];
            _cell.time.text=ping.time;
            [_cell.ima sd_setImageWithURL:[NSURL URLWithString:ping.merchantImg] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
            [_cell.ima sd_setImageWithURL:[NSURL URLWithString:ping.merchantImg] placeholderImage:nil options:SDWebImageProgressiveDownload];
            
            _cell.selectionStyle = UITableViewCellAccessoryNone;
        }
        
       
        return _cell;

    }
    
    }

-(void)amontBtn1:(UIButton *)btn
{
    FeedBackVC *fe=[[FeedBackVC alloc] init];
    PingModel *ping=[[PingModel alloc] init];
    ping=totalArray[btn.tag];
    fe.idnn= ping.merchantId;
    fe.orderCode=ping.orderCode;
    fe.imageString=ping.merchantImg;
    fe.name =ping.merchantName;
    fe.jiaQian=ping.realAmount;
    [self.navigationController pushViewController:fe animated:YES];
    
}
-(void)amontBtn111:(UIButton *)btn
{
    BusinessController *fe=[[BusinessController alloc] init];
    PingModel *ping=[[PingModel alloc] init];
    ping=totalArray[btn.tag];
    fe.idn= ping.merchantId;
 
    [self.navigationController pushViewController:fe animated:YES];
    
}

// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (iPhone6p) {
       return kScreenSize.width *0.48;
    }else
    {
         return 180;
    }
    
}
#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return totalArray.count;
}

-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"], @"pageNum":[NSString stringWithFormat:@"%d",pageNum]     ,@"pageSize":@"10"
                                                                                    
                                                                                    
                                                                                    }];
    NSMutableArray *array=[[NSMutableArray alloc] init];
       if(total==0||(pageNum-1)*10<total) {
    [HttpTool getWithBaseURL:kBaseURL  path:@"person/comments" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            PingModel *ping=[[PingModel alloc] initWithDict:dict];
            [array addObject:ping];
        }
        total=[data[@"total"]   intValue];
        if (pageNum == 1) {
            [totalArray removeAllObjects];
        };
        [_mineTableView.header endRefreshing];
        [_mineTableView.footer endRefreshing];
        NSLog(@"%@",data);
        [totalArray addObjectsFromArray:array];
        [_mineTableView reloadData];
        
    } failure:^(NSError *error) {
        [_mineTableView.header endRefreshing];
        [_mineTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [_mineTableView.header endRefreshing];
        [_mineTableView.footer endRefreshing];
    }];
       }else
       {
           [_mineTableView.header endRefreshing];
           [_mineTableView.footer endRefreshing];
       }

}
-(void)downLoad1
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"], @"pageNum":[NSString stringWithFormat:@"%d",pageNum] ,@"pageSize":@"10"
                                                                                    
        }];
    if(total==0||(pageNum-1)*10<total) {
    NSMutableArray *array=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"person/comments" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            PingModel *ping=[[PingModel alloc] initWithDict:dict];
            [array addObject:ping];
        }
         total=[data[@"total"]   intValue]        ;
        if (pageNum==1) {
            [totalArray removeAllObjects];
        }
        NSLog(@"%@",data);
        [totalArray addObjectsFromArray:array];
        [_mineTableView reloadData];
        [_mineTableView.header endRefreshing];
        [_mineTableView.footer endRefreshing];
    } failure:^(NSError *error) {
        [_mineTableView.header endRefreshing];
        [_mineTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [_mineTableView.header endRefreshing];
        [_mineTableView.footer endRefreshing];
    }];
                                                                                   
    }else
    {
        [_mineTableView.header endRefreshing];
        [_mineTableView.footer endRefreshing];
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DingDanXiangQingViewController *ding=[[DingDanXiangQingViewController alloc] init];
    PingModel *ping=[[PingModel alloc] init];
    ping=totalArray[indexPath.row];
     ding.idn= ping.idn;
    ding.idnm=_nunn;
    [self.navigationController pushViewController:ding animated:YES];
   
}
@end
