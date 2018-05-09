//
//  CommodityController.m
//  TescoToday
//
//  Created by 123 on 2017/8/18.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CommodityController.h"
#import "UIBarButtonItem+DCBarButtonItem.h"
#import "HomeTabTableViewCell.h"
#import "DHNavigationController.h"
#import "DCNavSearchBarView.h"
#import "CommodityTableViewCell.h"
#import "CommHear.h"
#import "BusinessController.h"
#import "PLContentViewController.h"
#import "commodle.h"
#import <CoreLocation/CoreLocation.h>
#import "UIImageView+WebCache.h"
#import "Search.h"
#import "ShrinkViewController.h"
#import "BusinessUserViewController.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
#import "AllCategoriesController.h"
#import "CategoriesModel2.h"
#import "fenleiRengZhengModel.h"
#import "GoodsLabelModel.h"
#import "makeview123456.h"
#import "homeTheStoreListTableViewCell.h"
static NSString *homeListCell=@"homeTheStoreListTableViewCell";
@interface CommodityController ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate,UITextFieldDelegate>
{
    UIView *strhome;
    UITableView *_homeTableView;
    UIView *makeView;
    UIView *makeView1;
    UIView *makeView2;
    NSMutableArray *make;
    UIButton *QianChen;
    UIButton *shineng;
    UIButton *shuaxin;
    NSString *makk;
    NSString *makk1;
    UIScrollView *makeView12;
     UIScrollView *makeView123;
    NSArray *array;
    NSMutableArray *totalArray123;
    NSString *namerr;
    NSString *cityaa;
    NSString *numn;
    UIButton *suanxin;
    CommHear *ma;
     UIButton*SearchBtn;
    UIButton *qubufenlei;
    Search *search;
    int pageNum;
    int total;
    NSString *lat;
    NSString *log;
    NSString *lat1;
    NSString *log1;
    NSString *categoryId;
    NSString *makeFenLei;
    UIScrollView *makeFenleiView;
    UIScrollView *makeFenleiView1;
    UIView *fenLeiView;
    NSMutableArray *BtnAaarray;
     NSMutableArray *BtnAaarray2;
    NSMutableArray *categoryCountList;
    NSMutableArray *maqq;
}
@property(nonatomic ,strong)CLLocationManager *mgr;
/*
 *
 */
@property(strong,nonatomic)UIButton *locationButton;
@end

@implementation CommodityController
- (void)viewWillAppear:(BOOL)animated
{
   // self.navigationController.navigationBarHidden=YES;
    if ([[NSString stringWithFormat:@"%@",[FNUserDefaults objectForKey:@"dengluren"]] isEqualToString:@"merchant"]        ) {
        BusinessUserViewController* nav=  [[BusinessUserViewController alloc] init];
        
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:nav];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
    }

    [super viewWillAppear:animated];
       cityaa=@"";
           namerr=[FNUserDefaults objectForKey:@"namenihao"];
    if (namerr.length<=0) {
        namerr=@"";
    }else{
        [FNUserDefaults removeObjectForKey:@"namenihao"];
        
    }
    NSString *CategoriesnameString=[FNUserDefaults objectForKey:@"Categoriesname"];
    if (CategoriesnameString.length>0) {
               [ma.quanbufenlei setTitle:[FNUserDefaults objectForKey:@"Categoriesname"] forState:UIControlStateNormal];
         [FNUserDefaults removeObjectForKey:@"Categoriesname"];
    }else{
        
        [ma.quanbufenlei setTitle:@"全部分类" forState:UIControlStateNormal];
        
    }
    

    
    categoryId=[FNUserDefaults objectForKey:@"Categories"];
    if (categoryId.length<=0) {
        categoryId=@"";
    }else{
          [FNUserDefaults removeObjectForKey:@"Categories"];
        
    }
    
 
   
    
    
//    if ([FNUserDefaults objectForKey:@"namenihao"]) {
//         numn=@"";
//         namerr=@"";
//
//    }
//
//  else//Categories Categoriesname
//  {
//      //[ma.quanbufenlei setTitle:[FNUserDefaults objectForKey:@"Categoriesname"] forState:UIControlStateNormal];
//     // categoryId=[FNUserDefaults objectForKey:@"Categories"];;
//      namerr=[FNUserDefaults objectForKey:@"namenihao"];
//       [FNUserDefaults removeObjectForKey:@"namenihao"];
//    //  [FNUserDefaults removeObjectForKey:@"Categories"];
//      //[FNUserDefaults removeObjectForKey:@"Categoriesname"];
//  }
//    if ([FNUserDefaults objectForKey:@"Categoriesname"]) {
//        numn=@"";
//        namerr=@"";
//
//    }
//    else//Categories Categoriesname
//    {
//
//        categoryId=[FNUserDefaults objectForKey:@"Categories"];;
//        [FNUserDefaults removeObjectForKey:@"Categories"];
//        [FNUserDefaults removeObjectForKey:@"Categoriesname"];
//    }

     [self downLoad];

//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#ff2d48"];;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
   // [self setUpNav];
    total=0;
    pageNum=1;
    self.mgr=[CLLocationManager new];
    // 用户请求授权
    if ([self.mgr respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.mgr requestWhenInUseAuthorization];
    }
    //设置代理
    self.mgr.delegate=self;
    // 调用定位方法
    [self.mgr startUpdatingLocation];
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
  
    _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,64, ScreenW, ScreenH-120) style:UITableViewStylePlain];
    if (ScreenH==812) {
          _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,88, ScreenW, ScreenH-120-44) style:UITableViewStylePlain];
    }
//    if (@available(iOS 11.0, *))
//    {
//        _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,64, ScreenW, ScreenH-120) style:UITableViewStylePlain];
//    }
//    if (iPhone6p) {
//       _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,44, ScreenW, ScreenH-120) style:UITableViewStylePlain];
//        if (@available(iOS 11.0, *))
//        {
//            _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,64, ScreenW, ScreenH-120) style:UITableViewStylePlain];
//        }
//    }
    BtnAaarray=[[NSMutableArray alloc] init];
    BtnAaarray2=[[NSMutableArray alloc] init];
    _homeTableView.delegate=self;
    _homeTableView.dataSource=self;
    [_homeTableView registerClass:[homeTheStoreListTableViewCell class] forCellReuseIdentifier: homeListCell];
    _homeTableView.showsVerticalScrollIndicator =NO;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    _homeTableView.header = header;
    
    // 上拉
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData12)];
    _homeTableView.footer = footer;

   
    numn=@"";
    namerr=@"";
    cityaa=@"";
    categoryId=@"";
     [self downLoad];
    ///MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    /// _homeTableView.header = header;
    //dataMakeArray=[[NSMutableArray alloc] init];
    
    strhome=[[UIView alloc] init];
    _homeTableView.backgroundColor=[UIColor colorWithHexString:@"#f6f6f6"];
    strhome.frame=CGRectMake(0, 0,ScreenW, 50);
    strhome.backgroundColor=[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];;
    _homeTableView.tableHeaderView=strhome;
    _homeTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    ma=[[CommHear alloc] init];
    qubufenlei=ma.quanbufenlei;
    qubufenlei.tag=1003;
     [qubufenlei addTarget:self action:@selector(btnQuanc:) forControlEvents:UIControlEventTouchUpInside];
    QianChen=ma.QuanCheng;
    suanxin=ma.shuaxin;
    QianChen.tag=1000;
    suanxin.tag=1002;
     [suanxin addTarget:self action:@selector(btnQuanc:) forControlEvents:UIControlEventTouchUpInside];
    makk=@"1";
    makeFenLei=@"1";
    makk1=@"1";
    [QianChen addTarget:self action:@selector(btnQuanc:) forControlEvents:UIControlEventTouchUpInside];
    shineng=ma.zhinengpaixu;
    shineng.tag=1001;
    [ shineng addTarget:self action:@selector(btnQuanc:) forControlEvents:UIControlEventTouchUpInside];
    shuaxin=ma.shuaxin;
    [shuaxin addTarget:self action:@selector(btnQuanc:) forControlEvents:UIControlEventTouchUpInside];
    ma.frame=CGRectMake(0, 0, ScreenW, 50);
    [strhome addSubview:ma];
//    _homeTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_homeTableView];
    //paramDic=[[NSMutableDictionary alloc] init];
    self.view.backgroundColor=[UIColor colorWithHexString:@"#f6f6f6"];
    [self MakeUi];
    _homeTableView.rowHeight = UITableViewAutomaticDimension;
    _homeTableView.estimatedRowHeight = 170.f;
    [self  setUpNav];
     fenLeiView=[[UIView alloc] init];
}
#pragma mark - 导航栏处理
- (void)setUpNav
{
    search=[[Search alloc] init];
    search.frame=CGRectMake(0,0,ScreenW ,64);
    
    if (ScreenH==812) {
           search.frame=CGRectMake(0,0,ScreenW ,88);
    }
    
      search.backgroundColor=[UIColor colorWithHexString : BunRed];
//    search.backgroundColor=[UIColor blackColor];
    //[self.view addSubview:search];
    SearchBtn=search.SearchBtn;
    search.diQu.hidden=YES;
    search.xiaoXiBtn.hidden=YES;
    search.shouCangBtn.hidden=YES;
    search.shouWoText.delegate=self;
    search.jiao.hidden=YES;
    [SearchBtn addTarget:self action:@selector(btnDiQu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: search];
    [search addSubview:self.locationButton];
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.equalTo(search);
        make.left.equalTo(search.mas_left).offset(10);
        make.height.equalTo(@50);
        make.right.mas_equalTo(search.shouWoText.mas_left).offset(-20);
    }];
 
    
}
#pragma mark ---------定位懒加载----------
-(UIButton*)locationButton{
    if (!_locationButton) {
       _locationButton =[[UIButton alloc]init];
        [_locationButton setTitle:@"获取定位" forState:UIControlStateNormal];
        [_locationButton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];

       _locationButton.titleLabel.font=[UIFont systemFontOfSize:16 weight:UIFontWeightBold];
        [_locationButton addTarget:self action:@selector(upLocation) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _locationButton;
}
#pragma mark ---------更新地址----------
-(void)upLocation{
        [_locationButton setTitle:@"获取定位" forState:UIControlStateNormal];
    [self.mgr startUpdatingLocation];
    
    
}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=1;
    
    
    
    [self downLoad];
    [_homeTableView.header endRefreshing];
    [_homeTableView.footer endRefreshing];
}

//#pragma mark 上拉刷新
- (void)upPullloadData12
{
    pageNum = ++pageNum;
    ;
[self downLoad];

    [_homeTableView.header endRefreshing];
    [_homeTableView.footer endRefreshing];

}

-(void)btnDiQu
{
    [self toSearch];
    
    
//    ShrinkViewController *nsaa=[[ShrinkViewController alloc] init];
//    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:nsaa];
//    [self presentViewController:avc animated:YES completion:^{
//
//    }];
}
-(void)btnQuanc:(UIButton *)btn
{
    if (btn.tag==1000) {
        
        makk1=@"1";
        [ma.btnZhiNengpaixun setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeView123 removeFromSuperview];
        makeFenLei=@"1";
        [ma.QuanbuFenLei setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeFenleiView removeFromSuperview];
        [makeFenleiView1 removeFromSuperview];
        if ([makk isEqualToString:@"1"]) {
            makeView12=[[UIScrollView alloc] init];
         
             makeView12.frame=CGRectMake(0,35, kScreenSize.width, kScreenSize.height-130);
            if (iPhone6p) {
               makeView12.frame=CGRectMake(0, 35, kScreenSize.width, kScreenSize.height-130);
            }
                 [ma.btnQuanCheng setImage:[UIImage imageNamed:@"nav_pressed"] forState:UIControlStateNormal];
            fenLeiView.frame=CGRectMake(0, 40, kScreenSize.width,10000);
            fenLeiView.backgroundColor=[UIColor blackColor];
            fenLeiView.alpha=0.3;
            [_homeTableView addSubview:fenLeiView];
            makeView12.contentSize=CGSizeMake(kScreenSize.width, make.count *44+78);
            makeView12.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
            [_homeTableView addSubview:makeView12];
            int  im=0;
            makk=@"2";
            UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
            btnn.frame=CGRectMake(0, 5, kScreenSize.width, 43);
            btnn.tag=1000;
            btnn.titleLabel.font=[UIFont systemFontOfSize:13];
            btnn.contentHorizontalAlignment=1;
            btnn.backgroundColor=[UIColor whiteColor];
            [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btnn addTarget:self action:@selector(btnnnaaaaaa:) forControlEvents:UIControlEventTouchUpInside];
            NSString *sre=@"全城";
            [btnn setTitle:[NSString stringWithFormat:@"    %@",sre]forState:UIControlStateNormal];
            //[btnn setTitle:sre forState:UIControlStateNormal];
            [makeView12 addSubview:btnn];
            
            for (NSString *sre in make) {
                
                
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 44+im*44, kScreenSize.width, 43);
                btnn.tag=im;
                  btnn.titleLabel.font=[UIFont systemFontOfSize:13];
                btnn.contentHorizontalAlignment=1;
                btnn.backgroundColor=[UIColor whiteColor];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaa:) forControlEvents:UIControlEventTouchUpInside];
                 [btnn setTitle:[NSString stringWithFormat:@"    %@",sre]  forState:UIControlStateNormal];
                //[btnn setTitle:sre forState:UIControlStateNormal];
                [makeView12 addSubview:btnn];
                im++;
                
                
            }
  
        }else
        {
              makk=@"1";
            [ma.btnQuanCheng setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
            [fenLeiView removeFromSuperview];
            [makeView12 removeFromSuperview];
        }
            }
    
    else if(btn.tag==1001)
    {
        makeFenLei=@"1";
        [ma.QuanbuFenLei setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeFenleiView removeFromSuperview];
        [makeFenleiView1 removeFromSuperview];
        makk=@"1";
        [ma.btnQuanCheng setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeView12 removeFromSuperview];
        
        if ([makk1 isEqualToString:@"1"]) {
            makeView123=[[UIScrollView alloc] init];
              makeView123.frame=CGRectMake(0, 35, kScreenSize.width,44*3);
            if (iPhone6p) {
                 makeView123.frame=CGRectMake(0, 35, kScreenSize.width,44*3);
            }
            fenLeiView.frame=CGRectMake(0, 40, kScreenSize.width,10000);
            fenLeiView.backgroundColor=[UIColor blackColor];
            fenLeiView.alpha=0.3;
            [_homeTableView addSubview:fenLeiView];
            makeView123.contentSize=CGSizeMake(kScreenSize.width/3, 44*3+10);
            makeView123.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];;
            [_homeTableView addSubview:makeView123];
            int  im=0;
            makk1=@"2";
            [ma.btnZhiNengpaixun setImage:[UIImage imageNamed:@"nav_pressed"] forState:UIControlStateNormal];
            array=@[@"智能排序",@"好评优先",@"离我最近"];
            for (int y=0; y<3; y++) {
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 5+im*44, kScreenSize.width, 43);
                btnn.tag=im;
                //btnn.titleLabel.font=[UIFont systemFontOfSize:13];
                btnn.titleLabel.font=[UIFont systemFontOfSize:13];
                btnn.contentHorizontalAlignment=1;
                btnn.backgroundColor=[UIColor whiteColor];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaabtn:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:[NSString stringWithFormat:@"    %@",array[y]]  forState:UIControlStateNormal];
                [makeView123 addSubview:btnn];
                im++;
            }
            
                
            
            
            
        }else
        {
            makk1=@"1";
            [ma.btnZhiNengpaixun setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
            [fenLeiView removeFromSuperview];
            [makeView123 removeFromSuperview];
        }
    }
    else if(btn.tag==1002){
     
          [self.mgr startUpdatingLocation];
    }
    else{
      
        makk=@"1";
        [ma.btnQuanCheng setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeView12 removeFromSuperview];
        makk1=@"1";
        [ma.btnZhiNengpaixun setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeView123 removeFromSuperview];
        [ma.QuanbuFenLei setImage:[UIImage imageNamed:@"nav_pressed"] forState:UIControlStateNormal];
        fenLeiView.frame=CGRectMake(0, 40, kScreenSize.width,10000);
        fenLeiView.backgroundColor=[UIColor blackColor];
        fenLeiView.alpha=0.3;
        UITapGestureRecognizer *tapCancel=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelView)];
        
        fenLeiView.userInteractionEnabled=YES;
        [fenLeiView addGestureRecognizer:tapCancel];
        

        [_homeTableView addSubview:fenLeiView];
        if ([makeFenLei isEqualToString:@"1"]) {
            makeFenleiView=[[UIScrollView alloc] init];
            makeFenleiView.frame=CGRectMake(0,40, kScreenSize.width/2,43*(categoryCountList.count+1));
            if (iPhone6p) {
                makeFenleiView.frame=CGRectMake(0, 40, kScreenSize.width/2,44*(categoryCountList.count+1)+10);
            }
            
            makeFenleiView.contentSize=CGSizeMake(kScreenSize.width/2, 44*(categoryCountList.count+3)+64+44+10);
             makeFenleiView.alpha=1;
            makeFenleiView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
            [_homeTableView addSubview:makeFenleiView];
            int  im=0;
            makeFenLei=@"2";
            
            UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
            btnn.frame=CGRectMake(0, 1, kScreenSize.width/2, 43);
            btnn.tag=1000;
//            CategoriesModel2 *make=[[CategoriesModel2 alloc] init];
//            make=categoryCountList[y];
            //btnn.titleLabel.font=[UIFont systemFontOfSize:13];
            btnn.titleLabel.font=[UIFont systemFontOfSize:13];
            [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btnn.backgroundColor=[UIColor whiteColor];
            [btnn addTarget:self action:@selector(btnnnaaaaaabtnfenlei:) forControlEvents:UIControlEventTouchUpInside];
            [btnn setTitle:@"全部分类"forState:UIControlStateNormal];
            [makeFenleiView addSubview:btnn];
             [BtnAaarray addObject:btnn];
            array=@[@"全部分类",@"美食频道",@"酒店娱乐",@"生活服务",@"家装频道",@"运动健身",@"亲子母婴"];
            for (int y=0; y<categoryCountList.count; y++) {
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 1+im*43.5+43.5, kScreenSize.width/2, 43);
                btnn.tag=im;
                CategoriesModel2 *make=[[CategoriesModel2 alloc] init];
                make=categoryCountList[y];
                //btnn.titleLabel.font=[UIFont systemFontOfSize:13];
                btnn.titleLabel.font=[UIFont systemFontOfSize:13];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                btnn.backgroundColor=[UIColor whiteColor];
                [btnn addTarget:self action:@selector(btnnnaaaaaabtnfenlei:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:[NSString  stringWithFormat:@"%@(%@)",make.name,make.count]     forState:UIControlStateNormal];
                [makeFenleiView addSubview:btnn];
                [BtnAaarray addObject:btnn];
                if (y==0) {
                    [btnn setTitleColor:[UIColor colorWithHexString:@"#f1314a"] forState:UIControlStateNormal];
                    btnn.backgroundColor=[UIColor  colorWithHexString:kAllViewBgColor];

                    [self downLoad123456:make.twoCategoryList];
                }
                im++;
            }

            
            
        }else
        {
           makeFenLei=@"1";
            [ma.QuanbuFenLei setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
            [fenLeiView removeFromSuperview];
            [makeFenleiView removeFromSuperview];
            [makeFenleiView1 removeFromSuperview];
        }
       // [self downLoad];
        
        

        
        
    }
}

// 没有分类 点击隐藏页面
-(void)cancelView{
    [ma.QuanbuFenLei setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];

    [fenLeiView removeFromSuperview];
    [makeFenleiView removeFromSuperview];
    [makeFenleiView1 removeFromSuperview];
    categoryId=@"";
    
    
}
-(void)btnnnaaaaaabtnfenlei:(UIButton *)btn
{
    if (btn.tag==1000) {
        makeFenLei=@"1";
        [ma.QuanbuFenLei setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [ma.quanbufenlei setTitle:@"全部分类" forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeFenleiView removeFromSuperview];
        [makeFenleiView1 removeFromSuperview];
        categoryId=@"";
        [self downLoad];
        
    }
    else
    {
        for (UIButton *btnrest in BtnAaarray) {
            [btnrest setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btnrest.backgroundColor=[UIColor  whiteColor];
        }
        //    UIButton *btrr=BtnAaarray[btn.tag] ;
        [btn setTitleColor:[UIColor colorWithHexString:@"#f1314a"] forState:UIControlStateNormal];
        btn.backgroundColor=[UIColor  colorWithHexString:kAllViewBgColor];
        CategoriesModel2 *make=[[CategoriesModel2 alloc] init];
        make=categoryCountList[btn.tag];
        if (make.twoCategoryList.count>0) {
            [self downLoad123456:make.twoCategoryList];
        }else{
            
            [makeFenleiView1 removeFromSuperview];
        }
        
    }
    
    
        
        
        
        
        
    
}
//  二级分类页面
-(void)downLoad123456:(NSArray *)parentId
{
    
    
//    if ([nuid isEqualToString:@""]) {
//        [MBProgressHUD showError:@"请选择上级分类"];
//        return;
//    }
//    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"parentId":parentId}];
//    ;
    //NSString *srrrr=@"";
      maqq=[[NSMutableArray alloc] init];
    
        
        for (NSDictionary *dict in parentId) {
            if (![dict isEqual:[NSNull null]]) {
                
                fenleiRengZhengModel *ma23=[[fenleiRengZhengModel alloc] initWithDict:dict];
                [maqq addObject:ma23];
            }
    }
    if (maqq.count==0) {
        return;
    }
    
    
        [makeFenleiView1 removeFromSuperview];
        makeFenleiView1=[[UIScrollView alloc] init];
    
        makeFenleiView1.frame=CGRectMake(kScreenSize.width/2,40, kScreenSize.width/2,43*(categoryCountList.count+1));
    
    
    
    UITapGestureRecognizer *tapCancel=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelView)];
    makeFenleiView1.userInteractionEnabled=YES;
    [makeFenleiView1 addGestureRecognizer:tapCancel];
    
    
        if (iPhone6p) {
            makeFenleiView1.frame=CGRectMake(kScreenSize.width/2, 40, kScreenSize.width/2,44*(categoryCountList.count+1));
        }
        
        makeFenleiView1.contentSize=CGSizeMake(kScreenSize.width/2, 44*(maqq.count+1)+10);
        makeFenleiView1.alpha=1;
        makeFenleiView1.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
        [_homeTableView addSubview:makeFenleiView1];
        int  im=0;
        
        //array=@[@"全部分类",@"美食频道",@"酒店娱乐",@"生活服务",@"家装频道",@"运动健身",@"亲子母婴"];
        for (int y=0; y<maqq.count; y++) {
            UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
            btnn.frame=CGRectMake(0, 1+im*43.5, kScreenSize.width/2, 43);
            btnn.tag=im;
            fenleiRengZhengModel *ma23=[[fenleiRengZhengModel alloc] init];
            ma23=maqq[y];
            //btnn.titleLabel.font=[UIFont systemFontOfSize:13];
            btnn.titleLabel.font=[UIFont systemFontOfSize:13];
            [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btnn.backgroundColor=[UIColor colorWithHexString:  kAllViewBgColor];
            [btnn addTarget:self action:@selector(btnnnaaaaaabtnfenleierji:) forControlEvents:UIControlEventTouchUpInside];
            [btnn setTitle:ma23.shopName forState:UIControlStateNormal];
            [makeFenleiView1 addSubview:btnn];
            [BtnAaarray2 addObject:btnn];
            im++;
        }
        
        
}
-(void)btnnnaaaaaabtnfenleierji:(UIButton *)btn
{
    fenleiRengZhengModel *ma23=[[fenleiRengZhengModel alloc] init];
    ma23=maqq[btn.tag];
    [ma.quanbufenlei setTitle:ma23.shopName forState:UIControlStateNormal];
    for (UIButton *btnrest in BtnAaarray2) {
        [btnrest setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnrest.backgroundColor=[UIColor  colorWithHexString:kAllViewBgColor];
    }
    //    UIButton *btrr=BtnAaarray[btn.tag] ;
    [btn setTitleColor:[UIColor colorWithHexString:@"#f1314a"] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor  colorWithHexString:kAllViewBgColor];
  
     [btn setTitle:[NSString stringWithFormat:@"  %@",ma23.shopName]   forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"duigou"] forState:UIControlStateNormal];
    categoryId=ma23.shopid;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        makeFenLei=@"1";
        [ma.QuanbuFenLei setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [makeFenleiView removeFromSuperview];
        [makeFenleiView1 removeFromSuperview];
    });
    [self downLoad];

    
}
-(void)btnnnaaaaaa:(UIButton *)btn
{
    
    if (btn.tag==1000) {
          numn=@"";
          cityaa=@"";
         namerr=@"";
        NSString *sre=@"全城";
          [QianChen setTitle:[NSString stringWithFormat:@"%@",sre]          forState:UIControlStateNormal];
        makk=@"1";
        [makeView12 removeFromSuperview];
        [ma.btnQuanCheng setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        [self downLoad];
    }
    else
    {
        [QianChen setTitle:make[btn.tag] forState:UIControlStateNormal];
        cityaa=make[btn.tag];
        makk=@"1";
        [makeView12 removeFromSuperview];
        [ma.btnQuanCheng setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
        [fenLeiView removeFromSuperview];
        //[self downLoadandname:@"" andcity:cityaa andtype:@""];
        [self downLoad];
    }
    
   
}
-(void)btnnnaaaaaabtn:(UIButton* )btn
{
     [shineng setTitle:array[btn.tag] forState:UIControlStateNormal];
    if ([array[btn.tag] isEqualToString:@"离我最近"]) {
        numn=@"3";
        [self downLoad];
        //[self downLoadandname:nil andcity:cityaa andtype:numn];
        
    }else if([array[btn.tag] isEqualToString:@"好评优先"]){
       numn=@"2";
        [self downLoad];
        // [self downLoadandname:nil andcity:cityaa andtype:numn];
    }else
    {
        numn=@"1";
        [self downLoad];
       //  [self downLoadandname:nil andcity:cityaa andtype:numn];
    }
    makk1=@"1";
    [ma.btnZhiNengpaixun setImage:[UIImage imageNamed:@"nav_rolled-leaf"] forState:UIControlStateNormal];
    [fenLeiView removeFromSuperview];
    [makeView123 removeFromSuperview];
}
#pragma mark - 导航栏处理
//- (void)setUpNav
//{
//  
////    DCNavSearchBarView *searchBarVc = [[DCNavSearchBarView alloc] init];
////    searchBarVc.placeholdLabel.text = @"618 100元红包等你来抢";
////    searchBarVc.placeholdLabel.textColor=[UIColor colorWithHexString:@"#999999"];
////    searchBarVc.layer.cornerRadius=15;
////    searchBarVc. clipsToBounds=YES;
////    // searchBarVc. layer.borderWidth = 4;
////    searchBarVc.frame = CGRectMake(60, 33, ScreenW-120, 30);
////    searchBarVc.voiceButtonClickBlock = ^{
////        NSLog(@"语音点击回调");
////    };
////    searchBarVc.searchViewBlock = ^{
////        NSLog(@"搜索");
////    };
////    
////    self.navigationItem.titleView = searchBarVc;
//}

#pragma mark - 二维码扫码
- (void)richScanItemClick
{
    //    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    //    style.centerUpOffset = 44;
    //    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    //    style.photoframeLineW = 6;
    //    style.photoframeAngleW = 24;
    //    style.photoframeAngleH = 24;
    //    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    //    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    //    SubLBXScanViewController *vc = [[SubLBXScanViewController alloc]init];
    //    vc.title = @"扫一扫";
    //    vc.style = style;
    //    vc.isQQSimulator = YES;
    //
    //    JRNavigationController *nav = [[JRNavigationController alloc]initWithRootViewController:vc];
    //    [self presentViewController:nav animated:YES completion:nil];
    //
    //    vc.scanResult = ^(NSString *strScanned){
    //        NSLog(@"扫码结果");
    //    };
}
#pragma mark - 消息
- (void)messageItemClick
{
    //   JRNavigationController *messageVc = [[JRNavigationController alloc] init];
    //    messageVc.title = @"消息中心";
    //    [self.navigationController pushViewController:messageVc animated:YES];
}

#pragma makeui
-(void)MakeUi
{
  
    
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return totalArray123.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat cellHeight=100;
    
    commodle *mid=[[commodle alloc] init];
    mid= totalArray123[indexPath.row];
    
    if (![mid.acModel.atDiscounttypeString isEqualToString:@"-1"]) {
        cellHeight+=25;
    }
    
    if (![mid.acModel.fullReductiontypeString isEqualToString:@"-1"]) {
        cellHeight+=25;
    }
    return cellHeight;
    
//    if (iPhone6p) {
//
//        return 118;
//    }
//    else{
//        return 118;
//    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellName=@"cell";
//    CommodityTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
//    if (cell==nil) {
//        cell=[[[NSBundle mainBundle] loadNibNamed:@"CommodityTableViewCell" owner:self options:nil] lastObject];
//    }
//    
//    makeView=[[UIView alloc] init];
//    makeView1=[[UIView alloc] init];
//    // makeView2=[[UIView alloc] init];
//    // makeView2.backgroundColor=[UIColor whiteColor];
//    
//    commodle *makeddd=[[commodle alloc] init];
//    makeddd=totalArray123[indexPath.row];
//    cell.name.text=[ NSString stringWithFormat:@"%@" ,makeddd.name];
//    [cell.tuxiang sd_setImageWithURL:[NSURL URLWithString:makeddd.mainImageUrl] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
//    [cell.tuxiang sd_setImageWithURL:[NSURL URLWithString:makeddd.mainImageUrl] placeholderImage:nil options:SDWebImageProgressiveDownload];
//    cell.mi.text=[ NSString stringWithFormat:@"%.2fkm" ,[makeddd.distance floatValue]/1000];;
//    float nn=[makeddd.praise floatValue];
//    
//    
//    makeView.frame=CGRectMake(130, 36, 12*5, 15);
//    makeView1.frame=CGRectMake(130,36, 12*nn, 15);
//    if (@available(iOS 11.0, *))
//    {
//        makeView.frame=CGRectMake(135, 36, 12*5, 15);
//        makeView1.frame=CGRectMake(135,36, 12*nn, 15);
//    }
//    makeView1.clipsToBounds=YES;
//    cell.pinlei.text=makeddd.category;
//    [cell.weizhi setTitle:[NSString stringWithFormat:@" %@",makeddd.streetName]   forState:UIControlStateNormal];
//    // makeView2.frame=CGRectMake(10+12*5, 90, kScreenSize.width, 15);
////    makeView.backgroundColor=[UIColor yellowColor];
////    makeView1.backgroundColor=[UIColor redColor];
//    [cell.viewas addSubview:makeView];
//    [cell.viewas addSubview:makeView1];
//    //[cell.Viewas addSubview:makeView2];
//    cell.selectionStyle=UITableViewCellAccessoryNone;
//    // makeView.frame=CGRectMake(0, 100, kScreenSize.width/3, 30);
//    
//    NSString *imageNameString;
//        for (int i=0; i<5; i++) {
//            if (i>[makeddd.grade intValue]-1) {
//                imageNameString=@"huxingxing";
//            }else{
//                imageNameString=@"icon_star";
//            }
//            UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:imageNameString]];
//            image.frame=CGRectMake(i*12,0,12,13);
//            [makeView addSubview:image];
//    
//        }
    commodle *mid=[[commodle alloc] init];
    mid=totalArray123[indexPath.row];
    homeTheStoreListTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:homeListCell];
    cell.typeString=@"2";
    cell.model=mid;
    cell.selectionStyle=UITableViewCellAccessoryNone;

    
    return cell;
}

//-(void)makeWuJiaoXing:(int)num{
//    //    _scoreShowsLabel.text=[NSString stringWithFormat:@"%d分",num];
//
//    NSString *imageNameString;
//    for (int i=0; i<5; i++) {
//        if (i>num-1) {
//            imageNameString=@"huxingxing";
//        }else{
//            imageNameString=@"icon_star";
//        }
//        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:imageNameString]];
//        image.frame=CGRectMake(i*12,0,12,13);
//        [self.theStarImageView addSubview:image];
//
//    }
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    commodle *makeddd=[[commodle alloc] init];
    makeddd=totalArray123[indexPath.row];
    
    BusinessController *pro=[[BusinessController alloc] init];
    pro.idn=makeddd.idn;
    pro.model=makeddd;
    [self.navigationController pushViewController:pro animated:YES];
}
/*
 
 countyName = "\U5317\U4eac";
 lat = "39.890832";
 log = "116.317414";
 name = "";
 pageNum = 1;
 pageSize = 10;
 type = "";
 */
-(void)downLoad
{
    if (![FNUserDefaults objectForKey:@"latitude"]) {
        lat=  @"39.889334";
        log= @"116.313911";
        //cityaa=@"北京市";
    }
    else
    {
      lat= [FNUserDefaults objectForKey:@"latitude"];
        log= [FNUserDefaults objectForKey:@"longitude"];
    }

    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"lat": lat,@"log":log, @"pageNum":@"1",@"pageSize":@"10",
                                                                                    
                                                                                    @"type":numn,@"name":namerr,@"countyName":cityaa,@"categoryId":categoryId
                                                                                    }];
//    NSLog(@"dfdgfd%@",paramDic);
  
    if(total==0||(pageNum-1)*10<total) {
        
    [HttpTool getWithBaseURL:kBaseURL  path:@"/merchants" params:paramDic success:^(id data) {
        
                NSLog(@"%@",data);
        categoryCountList=[[NSMutableArray alloc] init];
        totalArray123=[[NSMutableArray alloc] init];
        make=[[NSMutableArray alloc] init];
       [ make addObjectsFromArray:data[@"araList"]];
        NSMutableArray *nihao=[[NSMutableArray alloc] init];
        for (NSDictionary *sre in data[@"merchantList"][@"list"]) {
            commodle *makdd=[[commodle alloc]  initWithDict:sre];
            [nihao addObject:makdd];
            
            
        }
        for (NSDictionary *sre1 in data[@"categoryCountList"]) {
            CategoriesModel2 *makdd=[[CategoriesModel2 alloc]  initWithDict:sre1];
            [categoryCountList addObject:makdd];
            
            
        }
        total =[data[@"total"]  intValue];
        if (pageNum == 1) {
            [totalArray123 removeAllObjects];
           
        }
        [totalArray123 addObjectsFromArray:nihao];
        if (totalArray123.count>25) {
            [totalArray123 removeAllObjects];
             [makeview123456 m];
        }
        namerr=@"";
        [_homeTableView reloadData];
        
        [_homeTableView.header endRefreshing];
        [_homeTableView.footer endRefreshing];
        NSLog(@"%@",totalArray123);
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

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"longitude = %f", ((CLLocation *)[locations
                                             lastObject]).coordinate.longitude);
    NSLog(@"latitude = %f", ((CLLocation *)[locations lastObject]).coordinate.latitude);
//    [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",((CLLocation *)[locations lastObject]).coordinate.latitude] forKey:@"latitude"];
//    [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",((CLLocation *)[locations
//                                                                               lastObject]).coordinate.longitude] forKey:@"longitude"];
    NSLog(@"我在定位");
    
    
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:[locations
                                      lastObject] completionHandler:^(NSArray *array, NSError *error)
     {
         if (array.count > 0)
         {
             CLPlacemark *placemark = [array objectAtIndex:0];
             
             
             //获取城市
             NSString *city = placemark.locality;
             NSString*shi=placemark.thoroughfare;
             if (!city) {
                 //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市
                 city = placemark.administrativeArea;
                 
             }
             NSLog(@"city = %@", city);
             [self.locationButton setTitle:placemark.subLocality forState:UIControlStateNormal];
//             ma.weizhi.text=[NSString stringWithFormat:@"当前位置：%@%@%@",city,placemark.subLocality,shi];
             //self.cityName = city;
            // [DiQu setTitle:self.cityName forState:UIControlStateNormal];
         }
         else if (error == nil && [array count] == 0)
         {
               [self.locationButton setTitle:@"获取地址" forState:UIControlStateNormal];
             NSLog(@"No results were returned.");
         }
         else if (error != nil)
         {
                  [self.locationButton setTitle:@"获取地址" forState:UIControlStateNormal];
             NSLog(@"An error occurred = %@", error);
         }
     }];

   
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//          [ma stopAnimation];
//    });

    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新    [manager stopUpdatingLocation];
    
}
#pragma mark ---------textFeledDelegate----------


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 收起键盘(取消第一响应者)
    //    self.needSearchString=textField.text;
    //    [textField resignFirstResponder];
    if (textField.text.length>0) {
        [self toSearch];
   
        
        
    }
    
    return YES;
}
-(void)toSearch{
        namerr=search.shouWoText.text;
        [search.shouWoText resignFirstResponder];
        search.shouWoText.text=@"";
        
     [self downLoad];
    
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //变化后的字符串
    
    return YES;
}


@end
