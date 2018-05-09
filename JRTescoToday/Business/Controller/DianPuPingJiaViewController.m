//
//  DianPuPingJiaViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "DianPuPingJiaViewController.h"
#import "PingLunDianPuTableViewCell.h"
#import "PingLunModel.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
@interface DianPuPingJiaViewController ()<UITableViewDataSource,UITableViewDelegate>
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
    int statut;
    UIView *makeView;
    UIView *makeView1;
    NSString *mau;
    NSString *str;
     int total;
     int total1;
     int total2;
     int total3;
    NSMutableArray *TotalArray;
     PingLunDianPuTableViewCell *cell;
  
}
@end

@implementation DianPuPingJiaViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
//    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_return_all"
//                                                           higlightedImage:nil target:self action:@selector(back)];
//    
}
//- (void)back
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"店铺评价";
    TotalArray=[[NSMutableArray alloc] init];
     //str=@"￥ 这就是人民币符号，首先我们应弄明白这个符号怎么读，然后再根据你安装的输入法来打出来，下面小编就和大家一起学习人民币符号怎么打吧。";
    mau=@"0";
    amontTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height) style:UITableViewStylePlain];
    amontTableView.delegate=self;
    amontTableView.dataSource=self;
    amontTableView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
    [self.view addSubview:amontTableView];
    pageNum=1;
    total=0;
     total=0;
     total1=0;
     total2=0;
     total3=0;
    switchView=[[UIView alloc] init];
    switchView.backgroundColor=[UIColor whiteColor];
    switchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn setTitle:@"全部(0)"forState:UIControlStateNormal];
    switchBtn.tag=2000;
    switchBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    switchBtn.titleLabel.textColor=[UIColor colorWithHexString:BunRed];
    [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
    [switchBtn addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    switchBtn.frame=CGRectMake(0,0, kScreenSize.width/4 ,  50);
    [switchView addSubview:switchBtn];
    
    switchBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn1 setTitle:@"好评（0）"forState:UIControlStateNormal];
    switchBtn1.tag=2001;
    switchBtn1.titleLabel.font=[UIFont systemFontOfSize:15];
    [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    [switchBtn1 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    switchBtn1.frame=CGRectMake( kScreenSize.width/4,0, kScreenSize.width/4 ,50 );
    [switchView addSubview:switchBtn1];
    
    switchBtn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn2 setTitle:@"中评（0）"forState:UIControlStateNormal];
    switchBtn2.tag=2002;
    switchBtn2.titleLabel.font=[UIFont systemFontOfSize:15];
    [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    [switchBtn2 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    switchBtn2.frame=CGRectMake(2*kScreenSize.width/4,0, kScreenSize.width/4 ,50 );
    [switchView addSubview:switchBtn2];
    
    switchBtn3=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn3 setTitle:@"差评（0）"forState:UIControlStateNormal];
    switchBtn3.tag=2003;
    switchBtn3.titleLabel.font=[UIFont systemFontOfSize:15];
    [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    [switchBtn3 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    switchBtn3.frame=CGRectMake(3*kScreenSize.width/4,0, kScreenSize.width/4 ,50 );
    [switchView addSubview:switchBtn3];
    switchBtn.selected=YES;
    lineView=[[UIView alloc] init];
    switchView.frame=CGRectMake(0,10, kScreenSize.width , 50);
    lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame)-1, switchBtn.frame.size.width, 1);
    lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
    [switchView addSubview:lineView];
    amontTableView.tableHeaderView=switchView;
 
    [self downLoad3];
    [self downLoad2];
    [self downLoad1];
   [self downLoad23];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
   amontTableView.header = header;
    // 上拉
    amontTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    amontTableView.footer = footer;

}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=1;
    
    if ([mau isEqualToString:@"0"]) {
        [self downLoad23];
    }
    else if([mau isEqualToString:@"1"])
    {
        [self downLoad1];
    }else if ([mau isEqualToString:@"2"])
    {
        [self downLoad2];
    }else
    {
        [self downLoad3];
    }
    
}
#pragma mark 上拉刷新
- (void)upPullloadData
{
    pageNum = ++pageNum;
    
    if ([mau isEqualToString:@"0"]) {
       [self downLoad23];
    }
    else if([mau isEqualToString:@"1"])
    {
         [self downLoad1];
    }else if ([mau isEqualToString:@"2"])
    {
         [self downLoad2];
    }else
    {
       [self downLoad3];
    }
  
    // strxuaxin=@"ture";
    // [self DownLoadView];;
    
}


-(void)switchButton:(UIButton *)btn
{
    //    if (![self checkNet]) {
    //        [MBProgressHUD showError:NO_CONNECT_NET];
    //        return;
    //    }
    if (btn.tag==2000) {
        pageNum = 1;
        statut=1;
        
        [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        mau=@"0";
         [self downLoad23];
        // [amontTableView reloadData];
    }
    else if(btn.tag==2001)
    {
        statut=2;
        pageNum = 1;
        
        [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn1 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        switchBtn1.selected=YES;
        switchBtn.selected=NO;
        switchBtn2.selected=NO;
        mau=@"1";
        [self downLoad1];
        // [cell removeFromSuperview];
        
        
        
    }
    
    
    else
        if(btn.tag==2002)
        {
            statut=2;
            pageNum = 1;
            [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn2 setTitleColor:[UIColor colorWithHexString:BunRed] forState:
             UIControlStateNormal];
            
            switchBtn1.selected=YES;
            switchBtn.selected=NO;
            switchBtn2.selected=NO;
            mau=@"2";
           [self downLoad2];
            // [cell removeFromSuperview];
            
            
            
        }
        else
        {
            pageNum = 1;
            statut=3;
            
            [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn3 setTitleColor:[UIColor colorWithHexString:BunRed] forState:
             UIControlStateNormal];
            [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            switchBtn2.selected=YES;
            switchBtn.selected=NO;
            switchBtn1.selected=NO;
            mau=@"3";
           [self downLoad3];
            // [amontTableView reloadData];
        }
    [UIView animateWithDuration:0.3 animations:^{
        lineView.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame)-1, switchBtn.frame.size.width, 1);
    }];
    //[amontTableView reloadData];
    
}
#pragma mark 切换

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellName=@"cell";
    cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"PingLunDianPuTableViewCell" owner:self options:nil] lastObject];
    }
    
     PingLunModel *ma=[[PingLunModel alloc] init];
    ma=TotalArray[indexPath.row];
    str=ma.commentInfo;
    cell.selectionStyle = UITableViewCellAccessoryNone;
    cell.label.text=ma.commentInfo;
    //cell.label.backgroundColor=[UIColor blueColor];
    cell.label.frame=CGRectMake(0, 0,kScreenSize.width/3 , 20*ma.commentInfo.length/20+10);
    //cell.touZiJinE.text=[NSString stringWithFormat:@"%@元",hom.investmentAmount];
    cell.shouji.text=ma.userName;
    cell.shijian.text=ma.commentTimeStr;
    
    
  float num=[ma.commentGrade  floatValue];
    makeView=[[UIView alloc] init];
    makeView1=[[UIView alloc] init];
    //int num=[heat.fenshu.text intValue];
    makeView.frame=CGRectMake(80, 60, 12*5, 15);
    makeView1.frame=CGRectMake(80,60, 12*num, 15);
    makeView1.clipsToBounds=YES;
    
    [cell addSubview:makeView];
    [cell addSubview:makeView1];
    
    for (int i=0; i<5; i++) {
        UIImageView *image1=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"huxingxing"]];
        
        image1.frame=CGRectMake(i*12, 0,12,13);
        [makeView addSubview:image1];
        
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
        
        image.frame=CGRectMake(i*12,0,12,13);
        [makeView1 addSubview:image];
        
        
        
    }

    return cell;
    
    
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120+20*str.length/20+10;
    
    
    
}
///* 这个函数是显示tableview的章节数*/
//-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
//{
//    return 2;
//}
///*设置标题头的宽度*/
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return TotalArray.count;
    
    
    
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
-(void)downLoad23
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"pageNum":[NSString stringWithFormat:@"%d",pageNum]     ,@"pageSize":@"10",}];
  ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
     if(total==0||(pageNum-1)*10<total) {
    [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/comment/findCommentByShopIdPage/%@" ,_idn] params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
            [maqq addObject:ma];
        }
        
           total=[data[@"total"]   intValue]        ;
         [switchBtn setTitle:[NSString stringWithFormat:@"全部(%@)",data[@"total"]]forState:UIControlStateNormal];
         [TotalArray removeAllObjects];
        [TotalArray addObjectsFromArray:maqq];
        [amontTableView reloadData];
    
        NSLog(@"%@",data);
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } failure:^(NSError *error) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }];
     }else
     {
         [amontTableView.header endRefreshing];
         [amontTableView.footer endRefreshing];
     }
}
-(void)downLoad1
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"pageNum":[NSString stringWithFormat:@"%d",pageNum]     ,@"pageSize":@"10",}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
     if(total1==0||(pageNum-1)*10<total1) {
    [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/comment/findGoodCommentByShopIdPage/%@" ,_idn] params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
            [maqq addObject:ma];
        }
           total1=[data[@"total"]   intValue]        ;
          [switchBtn1 setTitle:[NSString stringWithFormat:@"好评(%@)",data[@"total"]]forState:UIControlStateNormal];
         [TotalArray removeAllObjects];
        [TotalArray addObjectsFromArray:maqq];
        [amontTableView reloadData];
        
        NSLog(@"%@",data);
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } failure:^(NSError *error) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }];}
    else
    {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }
}

-(void)downLoad2
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"pageNum":[NSString stringWithFormat:@"%d",pageNum]     ,@"pageSize":@"10",}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
     if(total2==0||(pageNum-1)*10<total2) {
    [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/comment/findMediumCommentByShopIdPage/%@" ,_idn] params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
            [maqq addObject:ma];
        }
        total2=[data[@"total"]   intValue]        ;
         [TotalArray removeAllObjects];
        [TotalArray addObjectsFromArray:maqq];
        [amontTableView reloadData];
         [switchBtn2 setTitle:[NSString stringWithFormat:@"中评(%@)",data[@"total"]]forState:UIControlStateNormal];
        NSLog(@"%@",data);
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } failure:^(NSError *error) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }];
     }else
     {
         [amontTableView.header endRefreshing];
         [amontTableView.footer endRefreshing];
     }
}
-(void)downLoad3
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"pageNum":[NSString stringWithFormat:@"%d",pageNum]     ,@"pageSize":@"10",}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
     if(total3==0||(pageNum-1)*10<total3) {
    [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/comment/findBadCommentByShopIdPage/%@" ,_idn] params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
            PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
            [maqq addObject:ma];
        }
         total3=[data[@"total"]   intValue]        ;
        [TotalArray removeAllObjects];
        [TotalArray addObjectsFromArray:maqq];
        [amontTableView reloadData];
         [switchBtn3 setTitle:[NSString stringWithFormat:@"差评(%@)",data[@"total"]]forState:UIControlStateNormal];
        NSLog(@"%@",data);
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } failure:^(NSError *error) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }];
     }else
     {
         [amontTableView.header endRefreshing];
         [amontTableView.footer endRefreshing];
     }
}

@end
