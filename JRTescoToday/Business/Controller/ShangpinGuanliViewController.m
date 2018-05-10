//
//  ShangpinGuanliViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShangpinGuanliViewController.h"
#import "ShangpinGuanLiTableViewCell.h"
#import "CommSpotViewController.h"
#import "BianJiShangpinController.h"
#import "ShangpingModel.h"
#import "UIImageView+WebCache.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"

@interface ShangpinGuanliViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mineTableView;
    ShangpinGuanLiTableViewCell*_cell;
    NSMutableArray *_arrayid;
    NSInteger num;
    NSInteger rowNum;
    NSMutableArray *totalArray;
    NSString *idn;
    int  pageNum;
    int total;
}
@end

@implementation ShangpinGuanliViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    pageNum=1;
    total=0;
      [self downLoad];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商品管理";
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    rowNum=5;
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-64) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_mineTableView];
    pageNum=1;
    total=0;
    totalArray=[[NSMutableArray alloc] init];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, kScreenSize.height-114, kScreenSize.width, 50);
    btn.backgroundColor=[UIColor colorWithHexString:BunRed];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"+ 添加新商品" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(banjiii) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    _mineTableView.header = header;
    // 上拉
    _mineTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    _mineTableView.footer = footer;

  
     
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

-(void)banjiii
{
    BianJiShangpinController *nihao=[[BianJiShangpinController alloc] init];
    nihao.bianji=@"添加";
    [self.navigationController pushViewController:nihao animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"ShangpinGuanLiTableViewCell" owner:self options:nil] lastObject];
    }
       ShangpingModel *ma=[[ShangpingModel alloc] init];
       ma=totalArray[indexPath.row];
//    @property (weak, nonatomic) IBOutlet UIImageView *hearimage;
//    @property (weak, nonatomic) IBOutlet UILabel *name;
//    @property (weak, nonatomic) IBOutlet UILabel *guige;
//    @property (weak, nonatomic) IBOutlet UILabel *jiaqian;
//    @property (weak, nonatomic) IBOutlet UIButton *banjiBtn;
//    @property (weak, nonatomic) IBOutlet UIButton *shanchu;
//    @property (weak, nonatomic) IBOutlet UILabel *geshu;
    _cell.name.text=[NSString stringWithFormat:@"%@",ma.goodsName];
     _cell.guige.text=[NSString stringWithFormat:@"%@",ma.standard];
     _cell.jiaqian.text=[NSString stringWithFormat:@"%@",ma.goodsPrice];
     _cell.name.text=[NSString stringWithFormat:@"%@",ma.goodsName]; _cell.name.text=[NSString stringWithFormat:@"%@",ma.goodsName];
    idn=ma.idn;
    [_cell.hearimage sd_setImageWithURL:[NSURL URLWithString:ma.mainImage] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [_cell.hearimage sd_setImageWithURL:[NSURL URLWithString:ma.mainImage] placeholderImage:nil options:SDWebImageProgressiveDownload];

    [_cell.banjiBtn addTarget:self action:@selector(banjiBtn:) forControlEvents:UIControlEventTouchUpInside];
      [_cell.shanchu addTarget:self action:@selector(banjiBtn1:) forControlEvents:UIControlEventTouchUpInside];
    _cell.shanchu.tag=indexPath.row;
    _cell.banjiBtn.tag=indexPath.row;
    _cell.selectionStyle = UITableViewCellAccessoryNone;
    return _cell;
}
-(void)banjiBtn:(UIButton *)btn
{
    ShangpingModel *ma=[[ShangpingModel alloc] init];
    ma=totalArray[btn.tag];
    BianJiShangpinController *nihao=[[BianJiShangpinController alloc] init];
     nihao.bianji=@"编辑";
     nihao.mingcheng=ma.goodsName;
     nihao.miaoshu123=ma.descp;
     nihao.danjia=ma.goodsPrice;
     nihao.guie1=ma.standard;
     nihao.imagecc=ma.mainImage;
    nihao.idn=ma.idn;
    nihao.categoryId=ma.categoryId;
    nihao.fengleiName=ma.categoryName;
    // nihao.fengleiName=@"编辑";
    
    [self.navigationController pushViewController:nihao animated:YES];
}

-(void)banjiBtn1:(UIButton *)btn
{
     ShangpingModel *ma=[[ShangpingModel alloc] init];
    ma=totalArray[btn.tag];
    [self downLoad1:ma.idn];
}
// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 181;
    
    
}
#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return totalArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShangpingModel *ma=[[ShangpingModel alloc] init];
    ma=totalArray[indexPath.row];
    CommSpotViewController *rigiste = [[CommSpotViewController alloc] init];
    //rigiste.shouYe=@"shouye";
//    rigiste.acModel=self.
    rigiste.strbtn=ma.idn;
    
    rigiste.strname=ma.goodsName;
    [self.navigationController pushViewController:rigiste animated:YES];
    //  [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
    //    LoginController *rigiste = [[LoginController alloc] init];
    //    rigiste.shouYe=@"shouye";
    //
    //    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
    //    [self presentViewController:avc animated:YES completion:^{
    //
    //    }];;
}

-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"pageSize":@"10",
                                                                                    @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                                                                    }];
    
    NSMutableArray *marray=[[NSMutableArray alloc] init];

     if(total==0||(pageNum-1)*10<total) {
    [HttpTool getWithBaseURL:kBaseURL  path:@"goods/findGoodsBymid/" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data[@"list"]) {
           ShangpingModel *ma=[[ShangpingModel alloc] initWithDict:dict];
            [marray addObject:ma];
        }
        total =[data[@"total"]  intValue];
        if (pageNum == 1) {
            [totalArray removeAllObjects];
        }
       
        [totalArray addObjectsFromArray:marray];
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
     }else{
         [_mineTableView.header endRefreshing];
         [_mineTableView.footer endRefreshing];
     }
}
-(void)downLoad1:(NSString *)idns
{
    
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"goodsId":idns,
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                              };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@goods/deleteGoodsById?access_token=%@&goodsId=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"],idns];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"PUT"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        NSLog(@"%@",dict);
        //5.回到主线程,进行更新页面
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
            {
               
                [self downLoad];
            
            }
        });
        
        
        
        
        
        
    }];
    
    
}

@end
