//
//  ChanPingXiangQing12ViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ChanPingXiangQing12ViewController.h"
#import "JiaoYiJiLuViewController.h"
#import "ChanPingXiangQingView.h"
#import "HomeTabTableViewCell.h"
#import "JinPaiHenHuoView.h"
#import "ZhangDanController.h"
#import "CongZhiViewController.h"
#import "TouZiChengGongViewController.h"
@interface ChanPingXiangQing12ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_homeTableView;
    UIButton *switchBtn;
    UIButton *switchBtn1;
    UIButton *switchBtn2;
     UIView *switchView;
      UIView *lineView;
    JinPaiHenHuoView *maa;
    UIButton *btncc;
    UIImageView *image;
    ChanPingXiangQingView *mak;
}
@end

@implementation ChanPingXiangQing12ViewController
-(void)viewWillAppear:(BOOL)animated{
     self.navigationController.navigationBarHidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-75) style:UITableViewStylePlain];
    _homeTableView.delegate=self;
    _homeTableView.dataSource=self;
    _homeTableView.showsVerticalScrollIndicator =
    NO;
      [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    self.title=@"产品详情";
   maa=[[JinPaiHenHuoView alloc] init];
    maa.rate.text=[NSString stringWithFormat:@"%@~%@",_rate1,_rate2];
    maa.day.text=[NSString stringWithFormat:@"%@个月",_day];
    maa.backgroundColor=[UIColor blueColor];
    [maa.name setTitle:_name forState:UIControlStateNormal];
    _homeTableView.backgroundColor=[UIColor colorWithHexString:@"#f6f6f6"];
    mak=[[ChanPingXiangQingView alloc] init];
  mak.frame=CGRectMake(0, 0, kScreenSize.width, 346);
    btncc=mak.confZhiBtn;
    [btncc addTarget:self action:@selector(btncc) forControlEvents:UIControlEventTouchUpInside];
    maa.frame=CGRectMake(15, 10, kScreenSize.width-30, 117);
    [mak addSubview:maa];
    _homeTableView.tableHeaderView=mak;
    [self downLoad2];
    UIButton *quebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [quebtn setBackgroundImage:[ UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [quebtn setTitle:@"确定购买" forState:UIControlStateNormal];
    quebtn.frame=CGRectMake(0, kScreenSize.height-50, kScreenSize.width, 50);
    [quebtn addTarget:self action:@selector(quebing) forControlEvents:UIControlEventTouchUpInside];
   
    switchView=[[UIView alloc] init];
    switchView.backgroundColor=[UIColor whiteColor];
    switchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn setTitle:@"合伙说明"forState:UIControlStateNormal];
    switchBtn.tag=2000;
    switchBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    switchBtn.titleLabel.textColor=[UIColor colorWithHexString:BunRed];
    [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
    [switchBtn addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    switchBtn.frame=CGRectMake(0,10, kScreenSize.width/2 ,  50);
    [switchView addSubview:switchBtn];
    
    switchBtn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [switchBtn2 setTitle:@"产品详情"forState:UIControlStateNormal];
    switchBtn2.tag=2002;
    switchBtn2.titleLabel.font=[UIFont systemFontOfSize:15];
    [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
    [switchBtn2 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
    switchBtn2.frame=CGRectMake(kScreenSize.width/2,10, kScreenSize.width/2 ,50 );
    [switchView addSubview:switchBtn2];
    
    switchBtn.selected=YES;
    lineView=[[UIView alloc] init];
    switchView.frame=CGRectMake(0,248, kScreenSize.width , 60);
    lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame), switchBtn.frame.size.width, 1);
    lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
    [switchView addSubview:lineView];
    [mak addSubview:switchView];
    _homeTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_homeTableView];
    [self downLoad];
   
  
     [self.view addSubview:quebtn];
    
    image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hehuojieshao"]];
    
    if (iPhone6p) {
          image.frame=CGRectMake(0, 1500, kScreenSize.width, 243);
        
    }else if(iPhone6)
    {
           image.frame=CGRectMake(0, 400, kScreenSize.width, 243);
    }
    else{
           image.frame=CGRectMake(0, 400, kScreenSize.width, 243);
    }
    

    _homeTableView.tableFooterView=image;
   // [_homeTableView addSubview:image];
    
}
-(void)btncc
{
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {    

        CongZhiViewController *nam=[[CongZhiViewController alloc] init];
        
        [self.navigationController pushViewController:nam animated:YES];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (iPhone6p) {
        
        return kScreenSize.width*0.341;
    }
    else{
        return 128;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cell";
    HomeTabTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"HomeTabTableViewCell" owner:self options:nil] lastObject];
    }
    
    
    
    return cell;
}

-(void)guiZeBtn
{
    
}
- (IBAction)fanhui:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)jioyijilu:(id)sender {
    
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
        ZhangDanController *nam=[[ZhangDanController alloc] init];
        [self.navigationController pushViewController:nam animated:YES];
     
    }
 
}
-(void)switchButton:(UIButton *)btn
{
   
    if (btn.tag==2000) {
   
        
        [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        image.image=[UIImage imageNamed:@"hehuojieshao"];
        image.frame=CGRectMake(0, 320, kScreenSize.width, 243);
         _homeTableView.tableFooterView=image;
      
    }
    else if(btn.tag==2001)
    {
        
        
        [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn1 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        switchBtn1.selected=YES;
        switchBtn.selected=NO;
        switchBtn2.selected=NO;
       
  
        
        
        
    }else
    {
       
        
        [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        switchBtn2.selected=YES;
        switchBtn.selected=NO;
        switchBtn1.selected=NO;
        //_homeTableView.frame=CGRectMake(0, 0, kScreenSize.width, 1447+kScreenSize.height/2);
        image.image=[UIImage imageNamed:@"hehuoshuoming"];
        image.frame=CGRectMake(0, 320, kScreenSize.width, 1477);
        _homeTableView.tableFooterView=image;
    }
    [UIView animateWithDuration:0.3 animations:^{
        lineView.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame), switchBtn.frame.size.width, 1);
    }];
   
    
}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"projectId":_idp,
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL path:@"/invest/getFixedProject" params:paramDic success:^(id data) {
        [maa.name setTitle:data[@"name"] forState:UIControlStateNormal];
        maa.rate.text=[NSString stringWithFormat:@"%@~%@",data[@"minRate"],data[@"maxRate"]];
        maa.day.text=[NSString stringWithFormat:@"%@个月",data[@"day"]];
        mak.mory.text=[NSString stringWithFormat:@"%@",data[@"balance"]];
          mak.MakeText.placeholder=[NSString stringWithFormat:@"请输入投资金额，%@起投%@.",data[@"initAmount"]  ,[NSString stringWithFormat:@"%@递增", data[@"increaseAmount"]]];
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)quebing
{
    
    if ([mak.MakeText.text isEqualToString:@""]) {
           [MBProgressHUD showError:@"金额不能为空"];
        return;
    }
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                        
                                                                                        @"productId":_idp,
                                                                                        @"realAmount":mak.MakeText.text,
                                                                                        }];
        
        
        // uid
        [FNUserDefaults objectForKey:@"MD5Pwd"];
        
        
        
        NSDictionary *headers = @{ @"content-Type": @"application/json",
                                   };
        
        
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
        NSString *urlstring=[NSString  stringWithFormat:@"%@/invest/createInvestFixed?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
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
                   // [MBProgressHUD showError:dict[@"msg"]];
                    TouZiChengGongViewController *nam=[[TouZiChengGongViewController alloc] init];
                    [self.navigationController pushViewController:nam animated:YES];
                }
                else
                {
                     [MBProgressHUD showError:dict[@"msg"]];
                }
            });
            
            
            
            
            
            
        }];

    }
    
}
-(void)downLoad2
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"/wallet" params:paramDic success:^(id data) {
        
        
        NSLog(@"%@",data);
        mak.mory.text=data[@"amount"];
       //_ =data[@"amount"];
        //_QianBaoYuE.text=ammont;
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
@end
