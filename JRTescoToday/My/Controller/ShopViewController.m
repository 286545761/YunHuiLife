//
//  ShopViewController.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/16.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "ShopViewController.h"
#import "HomeTabTableViewCell.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
#import "ShouCahngModel.h"
#import "ShopshouchangTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ShopshouchangTableViewCell.h"
#import "BusinessController.h"
@interface ShopViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_shopTableView;
    NSMutableArray *_items1;
    NSArray *_item;
    UIButton *_btnShop;
    UIButton *switchBtn;
    UIButton *switchBtn2;
    UIView *view;
    UIView *share;//分类筛选
    UILabel *label;//a分类标题
    NSMutableArray *array;
    NSString *strxuaxin;//判断是否刷新
    int             pageNum;//页数
    int total;
    UIView *lineView;
      int statut;
      NSString *mau;
    NSMutableArray *da;
    ShopshouchangTableViewCell *_cell;
    NSMutableArray *totalArray;
}

@end

@implementation ShopViewController
-(void)viewWillAppear:(BOOL)animated
{

     self.navigationController.navigationBarHidden=NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"收藏的店铺";
    _shopTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _shopTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _shopTableView.delegate=self;
    _shopTableView.dataSource=self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    _shopTableView.header = header;
    // 上拉
    total=0;
    pageNum=1;
    _shopTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    _shopTableView.footer = footer;
    da=[[NSMutableArray alloc] init];
    _items1=[[NSMutableArray alloc] init];
    [self.view addSubview:_shopTableView];
    _item=@[@"全部",@"贵点",@"古典",@"寒风",@"韩风",@"欧美",@"中国风",@"海边"];
    //    _items1 = @[@"http://kickstart.bikeexif.com/wp-content/uploads/2014/01/ducati-999.jpg",
    //                @"https://upload.wikimedia.org/wikipedia/commons/c/cc/2008_Ducati_848_Showroom.jpg",
    //                @"http://siliconangle.com/files/2012/03/github_logo.jpg",
    //                @"http://a.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=7e1de35dcf1b9d168a929267c3ee98b7/8644ebf81a4c510fd12293986159252dd52aa549.jpg"];
    //     shop=[[ShopListView alloc] init];
    //    _shopTableView.tableHeaderView=shop;
    //    _btnShop=shop.shopBtn;
    //    _btnShop.tag=1001;
    //    [_btnShop addTarget:self action:@selector(backShop:) forControlEvents:UIControlEventTouchUpInside];
    //      _shopTableView.separatorStyle = UITableViewCellAccessoryNone;
    //      share=[[UIView alloc] init];
    array=[[NSMutableArray alloc] init];
    [self DownLoadView];
}
#pragma mark 分类
-(void)backShop:(UIButton *)btn
{
  
    
}

#pragma mark 设置每个组中有几行
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_items1 count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"ShopshouchangTableViewCell" owner:self options:nil] lastObject];
    }
    _cell.selectionStyle=UITableViewCellAccessoryNone;
       ShouCahngModel *na=[[ShouCahngModel alloc] init];
        na=_items1[indexPath.section];
    _cell.name.text=na.merchantName;
     _cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    _cell.leibie.text=na.merchantCategoryName;
    _cell.diqu.text=na.merchantAddress;
    [_cell.tupian sd_setImageWithURL:[NSURL URLWithString:na.merchantImg] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [_cell.tupian sd_setImageWithURL:[NSURL URLWithString:na.merchantImg] placeholderImage:nil options:SDWebImageProgressiveDownload];

    //[(DBImageView *)[cell viewWithTag:101] setImageWithPath:sting.refImage];
    return _cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 90;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   ShouCahngModel* sting=_items1[indexPath.row];
    BusinessController *business=[[BusinessController alloc] init];
    business.idn=sting.merchantId;
    [self.navigationController  pushViewController:business animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
   
}
-(void)DownLoadView
{
    if ([strxuaxin isEqualToString:@"fost"])
    {
        [_items1  removeAllObjects];
    }
    NSString *str = [FNUserDefaults objectForKey:@"usersid"];
    NSLog(@"======%@",str);
    
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"pageSize":@"10",
                                                                                    @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                                                                    
                                                                                    }];
    NSMutableArray *ma=[[NSMutableArray alloc] init];
    
     if(total==0||(pageNum-1)*10<total) {
    [HttpTool getWithBaseURL:kBaseURL  path:@"/person/collects" params:paramDic success:^(id data) {
        for (NSDictionary *dict in data[@"list"]) {
            ShouCahngModel *na=[[ShouCahngModel alloc] initWithDict:dict];
            [ma addObject:na];
            
        }
        if (pageNum == 1) {
            [_items1 removeAllObjects];
        }
        total =[data[@"total"]  intValue];
        [_items1 addObjectsFromArray:ma];
        [_shopTableView reloadData];
        NSLog(@"%@",data);
        [_shopTableView.header endRefreshing];
        [_shopTableView.footer endRefreshing];
    } failure:^(NSError *error) {
        [_shopTableView.header endRefreshing];
        [_shopTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [_shopTableView.header endRefreshing];
        [_shopTableView.footer endRefreshing];
    }];
     }else
     {
         [_shopTableView.header endRefreshing];
         [_shopTableView.footer endRefreshing];
     }
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete ) {
        [self downLoad1:indexPath.section];
    }
    
}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=0;
    
    strxuaxin=@"fost";
    
    [self DownLoadView];
    
}
#pragma mark 上拉刷新
- (void)upPullloadData
{
    pageNum = ++pageNum;
    strxuaxin=@"ture";
    [self DownLoadView];;
    
}
#pragma mark ---------网络删除收藏----------
-(void)downLoad1:(NSInteger)idnn
{
    ShouCahngModel *na = _items1[idnn];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"ids":na.idn,
                                                                                   
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring = [NSString stringWithFormat:@"%@/merchants/%@/collect?access_token=%@",kBaseURL,na.idn,[FNUserDefaults objectForKey:@"usersid"]];;
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"DELETE"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
//    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
//        NSLog(@"%@",dict);
        //5.回到主线程,进行更新页面
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
            {

                    [_items1 removeObjectAtIndex:idnn];
                
                [_shopTableView deleteSections:[NSIndexSet indexSetWithIndex:idnn] withRowAnimation:UITableViewRowAnimationNone];
                
                
                [MBProgressHUD showError:@"删除商品成功"];
              
     
            }else{
                  [MBProgressHUD showError:[NSString stringWithFormat:@"%@",dict[@"msg"]]];
                
                
            }
        });
        
        
        
        
        
        
    }];
    
    
}

@end
