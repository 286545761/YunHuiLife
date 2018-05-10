//
//  TiXianViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/25.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "TiXianViewController.h"
#import "Tianhear.h"
#import "TiXianTableViewCell.h"
#import "TiXianListModel.h"
#import "TiXianView.h"
@interface TiXianViewController ()<UITableViewDataSource,UITableViewDelegate>
{
     UITableView *_mineTableView;
    TiXianTableViewCell*_cell;
     NSMutableArray *_arrayid;
    UIButton *tixianjiluj1;
    UIButton *zhanghutixian1;
    UIButton *querentixian1;
    TiXianView *tiXian;
    
}
@property (weak, nonatomic) IBOutlet UILabel *yuyujine;
@property (weak, nonatomic) IBOutlet UITextField *tianxinjine;

@end

@implementation TiXianViewController
-(void)viewWillAppear:(BOOL)animated
{
   // self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"提现";
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.view .frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
     [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    
    if (![_shangjia isEqualToString:@"商家"]) {
        _viewshangjia.hidden=YES;
    }
    if (iPhone5) {
      tiXian=[[TiXianView alloc] init];
        tiXian.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
       zhanghutixian1 =tiXian.zhanghuTiXian;
        zhanghutixian1.tag=1001;
        if (![_shangjia isEqualToString:@"商家"]) {
            tiXian.nihhha.hidden=YES;
        }
        [zhanghutixian1 addTarget:self action:@selector(btnzhanghu:) forControlEvents:UIControlEventTouchUpInside];
       tixianjiluj1 =tiXian.tiu;
        tixianjiluj1.tag=1000;
        [tixianjiluj1 addTarget:self action:@selector(btnzhanghu:) forControlEvents:UIControlEventTouchUpInside];
        querentixian1 =tiXian.querentixian;
       querentixian1.tag=1002;
        [querentixian1 addTarget:self action:@selector(btnzhanghu:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tiXian];
    }
    [self downLoad];
}
-(void)btnzhanghu:(UIButton *)btn
{
    if (btn.tag==1000) {
        [_mineTableView removeFromSuperview];
        _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 60, kScreenSize.width, kScreenSize.height-124) style:UITableViewStylePlain];
        _mineTableView.delegate=self;
        Tianhear *ma=[[Tianhear  alloc] init];
        ma.frame=CGRectMake(0, 0, kScreenSize.width, 60);
        _mineTableView.tableHeaderView=ma;
        _arrayid=[[NSMutableArray alloc] init];
        _mineTableView.dataSource=self;
        _mineTableView.backgroundColor=[UIColor  whiteColor];
        
        
        //_mineTableView.alpha=0.5;
        //_tianxinBtnLine.backgroundColor=[UIColor clearColor];
        // _tianxianjiluLine.backgroundColor=[UIColor colorWithHexString:BunRed];
        [tiXian.querentixian setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tiXian.tiu setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        
        _mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_mineTableView];
        
        [self downLoad14];
 
        
    } else if (btn.tag==1001)
    {
        [_mineTableView removeFromSuperview];
        [tiXian.querentixian setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        [tiXian.tiu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 
    }else{
        [self downLoad1:nil];
    }
}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
   
    [HttpTool getWithBaseURL:kBaseURL  path:@"wallet/withdraw" params:paramDic success:^(id data) {
        
      
        _BankCord.text=data[@"bankCardModel"][@"cardNo"];;
        _BankName.text=data[@"bankCardModel"][@"bankName"];
        _BankView.layer.cornerRadius=15;
        _yuyujine.text=[NSString stringWithFormat:@"￥%@",data[@"balance"]];;
        if (iPhone5) {
            tiXian.dangqianyue.text=[NSString stringWithFormat:@"￥%@",data[@"balance"]];;
            tiXian.bankCard.text=data[@"bankCardModel"][@"bankIcon"];
            tiXian.BankName.text=data[@"bankCardModel"][@"bankName"];
             tiXian.bankView.layer.cornerRadius=15;
        }
        [[NSNotificationCenter defaultCenter] addObserverForName:@"" object:nil queue:[NSOperationQueue mainQueue ] usingBlock:^(NSNotification * _Nonnull note) {
            
            
            
        }];

        NSLog(@"%@",data);
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
- (IBAction)tixianjilu:(id)sender {
    
    [_mineTableView removeFromSuperview];
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 60, kScreenSize.width, kScreenSize.height-124) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    Tianhear *ma=[[Tianhear  alloc] init];
    ma.frame=CGRectMake(0, 0, kScreenSize.width, 60);
    _mineTableView.tableHeaderView=ma;
    _arrayid=[[NSMutableArray alloc] init];
    _mineTableView.dataSource=self;
    _mineTableView.backgroundColor=[UIColor  whiteColor];
    _mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //_mineTableView.alpha=0.5;
    //_tianxinBtnLine.backgroundColor=[UIColor clearColor];
    // _tianxianjiluLine.backgroundColor=[UIColor colorWithHexString:BunRed];
    [_tixianBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_tixianjiluBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];

    [self.view addSubview:_mineTableView];
    
    [self downLoad14];
    // _tianxinBtnLine.backgroundColor=[UIColor colorWithHexString:BunRed];
    // _tianxianjiluLine.backgroundColor=[UIColor clearColor];
}


- (IBAction)querentixian:(id)sender {
    
    [self downLoad1:nil];
    
}


- (IBAction)yonghutixian:(id)sender {
    
    [_mineTableView removeFromSuperview];
    [_tixianBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
    [_tixianjiluBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
}


-(void)downLoad1:(NSString *)idnn
{
    if (iPhone5) {
       _tianxinjine.text =tiXian.tixinajine.text;;
        
    }
    
    if ([_tianxinjine.text isEqualToString:@""]) {
         [MBProgressHUD showError:@"提现金额不能为空"];
        return;
    }
    if ([_tianxinjine.text intValue]<100) {
        [MBProgressHUD showError:@"提现金额大于100"];
        return;
    }
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"amount":_tianxinjine.text,
                                                                                    
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@wallet/withdraw?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
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
              [MBProgressHUD showError:@"提现完成"];
//                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [MBProgressHUD showError:dict[@"msg"]];
            }
        });
        
        
        
        
        
        
    }];
    
    
}

// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
    
}
#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayid.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"TiXianTableViewCell" owner:self options:nil] lastObject];
    }
    TiXianListModel *na=[[TiXianListModel alloc] init];
    na=_arrayid[indexPath.row];
    _cell.tixian.text=na.amount;
    _cell.zhangtai.text=na.status;
    _cell.time.text=na.time;
    _cell.selectionStyle = UITableViewCellAccessoryNone;
    return _cell;
}
-(void)downLoad14
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    NSMutableArray *array=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"wallet/get_withdrawal_record" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data) {
            TiXianListModel *ma=[[TiXianListModel alloc] initWithDict:dict];
            [array addObject:ma];
            
        }
        [_arrayid addObjectsFromArray:array];
        [_mineTableView reloadData];
        NSLog(@"%@",data);
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
@end
