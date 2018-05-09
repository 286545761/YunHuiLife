//
//  PingJiaXiangQing1ViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "PingJiaXiangQing1ViewController.h"
#import "PingLuXiangQing1TableViewCell.h"
#import "pingjiaXiangqingModel.h"
#import "UIImageView+WebCache.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
#import "BusinessController.h"
@interface PingJiaXiangQing1ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     UITableView *_homeTableView;
    UIView *makeView;
    UIView *makeView1;
     UIView *makeView2;
    NSMutableArray *totalMarray;
    int  pageNum;
    int total;
    int nextPage;

}
@end

@implementation PingJiaXiangQing1ViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.title=@"评价";
 
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    nextPage=0;
    pageNum=0;
    _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) style:UITableViewStylePlain];
    _homeTableView.delegate=self;
    _homeTableView.dataSource=self;
    _homeTableView.showsVerticalScrollIndicator =
    NO;
//    total=0;
    _homeTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_homeTableView];
    totalMarray=[[NSMutableArray alloc] init];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
     _homeTableView.header = header;
    // 上拉
     _homeTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    _homeTableView.footer = footer;
     [self downLoad1:nil];
    _homeTableView.separatorStyle = UITableViewCellAccessoryNone;
   
}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=0;
    nextPage=0;
    //strxuaxin=@"fost";
    [self downLoad1:nil];
    // [self DownLoadView];
    
}
#pragma mark 上拉刷新
- (void)upPullloadData
{
    pageNum = ++pageNum;
    [self downLoad1:nil];
    // strxuaxin=@"ture";
    // [self DownLoadView];;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return totalMarray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (iPhone6p) {
        
        return kScreenSize.width*0.56;
    }
    else{
        return 210;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cell";
    PingLuXiangQing1TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"PingLuXiangQing1TableViewCell" owner:self options:nil] lastObject];
    }
    pingjiaXiangqingModel *na=[[pingjiaXiangqingModel alloc] init];
    na=totalMarray[indexPath.row];
    makeView=[[UIView alloc] init];
    makeView1=[[UIView alloc] init];
    float num=[na.commentGrade intValue];
    
    makeView.frame=CGRectMake(10, 90, 12*5, 15);
    makeView1.frame=CGRectMake(10, 90, 12*num, 15);
    makeView1.clipsToBounds=YES;
    [cell.Viewas addSubview:makeView];
    [cell.Viewas addSubview:makeView1];
    
   cell.selectionStyle = UITableViewCellAccessoryNone;
    cell.name.text=na.shopName;
    cell.time.text=na.commentTimeStr;
    cell.pinglun.text=na.commentInfo;
     
    [cell.imageViewhear sd_setImageWithURL:[NSURL URLWithString:na.shopImg] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [cell.imageViewhear sd_setImageWithURL:[NSURL URLWithString:na.shopImg] placeholderImage:nil options:SDWebImageProgressiveDownload];


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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    pingjiaXiangqingModel *na=[[pingjiaXiangqingModel alloc] init];
    na=totalMarray[indexPath.row];
//
   
    BusinessController *pro=[[BusinessController alloc] init];
     pro.idn=na.shopId;
    [self.navigationController pushViewController:pro animated:YES];
}
-(void)downLoad1:(NSString *)idnn
{
    
    if ( pageNum <=nextPage) {
        
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                                                                    @"pageSize":@"10",
                                                                                    
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/person/comments?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    //[request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
  
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError) {
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        NSLog(@"%@",dict);
        //5.回到主线程,进行更新页面
        
        nextPage=[dict[@"data"][@"nextPage"]   intValue];

        NSMutableArray *ma=[[NSMutableArray alloc] init];
        dispatch_sync(dispatch_get_main_queue(), ^{
            
                for (NSDictionary *dict11 in  dict[@"data"][@"list"]) {
                    pingjiaXiangqingModel *mama=[[pingjiaXiangqingModel alloc] initWithDict:dict11];
                    [ma addObject:mama];
                    
                }
            [_homeTableView.header endRefreshing];
            [_homeTableView.footer endRefreshing];
            total=[dict[@"data"][@"total"]   intValue]        ;
            if (pageNum==0) {
                [totalMarray removeAllObjects];
            }
                [totalMarray addObjectsFromArray:ma];
                [_homeTableView reloadData];
            
        });
    }];
    }else{
        [_homeTableView.header endRefreshing];
        [_homeTableView.footer endRefreshing];
    }

    
}
@end
