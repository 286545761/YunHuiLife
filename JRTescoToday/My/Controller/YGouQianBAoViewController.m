//
//  YGouQianBAoViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/23.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "YGouQianBAoViewController.h"
#import "YinhangkaguanliViewController.h"
#import "ZhangDanController.h"
#import "CongZhiViewController.h"
#import "SheZhiZhiFuViewController.h"
#import "TiXianViewController.h"
#import "ChangeLoginPwdController.h"
#import "ShiNameBngKaViewController.h"
#import "ShiNameViewController.h"
#import "YinhangkaWeiViewController.h"
@interface YGouQianBAoViewController ()
{
    UIButton *yaopingBtn;
    UIButton *zongbtn;
    UIButton *jifenBtn;
    UIButton *keyongBtn;
    UIButton *jiLingBtn;
    UIButton *fengxianBtn;
    NSString *ammont;
}
@property (weak, nonatomic) IBOutlet UILabel *zhhifumima;
@end

@implementation YGouQianBAoViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    [self downLoad];
    [self downLoad23];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"云惠钱包";
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
     _lele.hidden=YES;
    if ([_zhufumima isEqualToString:@"0"]) {
      
        _zhhifumima.text=@"设置支付密码";
      
    }
    else{
        _zhhifumima.text=@"修改支付密码";
     
    }
    

    //[self downLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 实名
- (IBAction)ShiNameBtn:(id)sender {
    
    if ([_nameRernzheng isEqualToString:@"0"]) {
        ShiNameViewController *shi=[[ShiNameViewController alloc] init];
        
        [self.navigationController pushViewController:shi animated:YES];
    }else
    {
         [MBProgressHUD showError:@"您已经实名"];
    }
  
}

#pragma mark 银行卡管理
- (IBAction)YinHangKanGuanLi:(id)sender {
    if ([_nameRernzheng isEqualToString:@"0"])
    {
        [MBProgressHUD showError:@"绑卡前，请先实名"];
        ShiNameViewController *shi=[[ShiNameViewController alloc] init];
        
        [self.navigationController pushViewController:shi animated:YES];
    }
    else{
    if (![_zhufumima isEqualToString:@"0"]) {
        
        YinhangkaguanliViewController*make=[[YinhangkaguanliViewController alloc] init];
        [self.navigationController pushViewController:make animated:YES];
        
    }
    
    else{
        
        YinhangkaWeiViewController *shinamebangka=[[YinhangkaWeiViewController alloc ] init];
        [self.navigationController pushViewController:shinamebangka animated:YES];
    }
    }
}

#pragma mark 账单
- (IBAction)ZhangDan:(id)sender {
    ZhangDanController*make=[[ZhangDanController alloc] init];
    [self.navigationController pushViewController:make animated:YES];

//    if ([_nameRernzheng isEqualToString:@"0"])
//    {
//        [MBProgressHUD showError:@"请先实名"];
//        ShiNameViewController *shi=[[ShiNameViewController alloc] init];
//        
//        [self.navigationController pushViewController:shi animated:YES];
//    }
//    else
//    {
//       
//        if ([_passWord isEqualToString:@""]) {
//            
//            YinhangkaWeiViewController*make=[[YinhangkaWeiViewController alloc] init];
//            [self.navigationController pushViewController:make animated:YES];
//            
//        }
//        else{
//       ZhangDanController*make=[[ZhangDanController alloc] init];
//      [self.navigationController pushViewController:make animated:YES];
//        }
//    }
}

#pragma mark 修改支付密码
- (IBAction)XiuGaiZhifuMima:(id)sender {
    if ([_zhufumima isEqualToString:@"0"]) {
        SheZhiZhiFuViewController*nihao=[[SheZhiZhiFuViewController alloc] init];
        _zhhifumima.text=@"设置支付密码";
        nihao.title=@"设置支付密码";
        [self.navigationController pushViewController:nihao animated:YES];
    }
    else{
        _zhhifumima.text=@"修改支付密码";
        ChangeLoginPwdController*nihao=[[ChangeLoginPwdController alloc] init];
        nihao.title=@"修改支付密码";
        [self.navigationController pushViewController:nihao animated:YES];
    }
    

}
#pragma mark 充值
- (IBAction)Congzhi:(id)sender {
//    CongZhiViewController*make=[[CongZhiViewController alloc] init];
//    [self.navigationController pushViewController:make animated:YES];
    if ([_nameRernzheng isEqualToString:@"0"])
    {
        [MBProgressHUD showError:@"请先实名"];
        ShiNameViewController *shi=[[ShiNameViewController alloc] init];
        
        [self.navigationController pushViewController:shi animated:YES];
    }
    else
    {
        
        if ([_zhufumima isEqualToString:@"0"]) {
         
           YinhangkaWeiViewController*make=[[YinhangkaWeiViewController alloc] init];
            [self.navigationController pushViewController:make animated:YES];
            
        }
        
        else{
    CongZhiViewController*make=[[CongZhiViewController alloc] init];
    [self.navigationController pushViewController:make animated:YES];
        }}
}
#pragma mark 提现
- (IBAction)TiXian:(id)sender {
    if ([_nameRernzheng isEqualToString:@"0"])
    {
        [MBProgressHUD showError:@"请先实名"];
        ShiNameViewController *shi=[[ShiNameViewController alloc] init];
        
        [self.navigationController pushViewController:shi animated:YES];
    }
    else
    {
        if ([_zhufumima isEqualToString:@"0"]) {
            
            YinhangkaWeiViewController*make=[[YinhangkaWeiViewController alloc] init];
            [self.navigationController pushViewController:make animated:YES];
            
        }
        
        else{
            TiXianViewController*make=[[TiXianViewController alloc] init];
            make.shangjia=_shangjia;
           [self.navigationController pushViewController:make animated:YES];
        }}
}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"wallet" params:paramDic success:^(id data) {
        
        
        NSLog(@"%@",data);
        
        ammont=data[@"balance"];
        _zhufumima=[NSString stringWithFormat:@"%@",data[@"isBindCard"]];
        _nameRernzheng=[NSString stringWithFormat:@"%@",data[@"isRealName"]];
//        _QianBaoYuE.text=[NSString stringWithFormat:@"￥%@",ammont];
        _QianBaoYuE.attributedText=[self moneyNumber:[NSString stringWithFormat:@"%@",ammont]];
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)downLoad23
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
   // [Login loginRenZengPhone:nil andPwdnum:nil];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"user_center/get_account" params:paramDic success:^(id data) {
        
        // _yuyujine.text=[NSString stringWithFormat:@"%@",data[@"amount"]];;
         _zhufumima=[NSString stringWithFormat:@"%@",data[@"payPassword"]];
        _passWord=[NSString stringWithFormat:@"%@",data[@"bankCard"]];
       // [FNUserDefaults setObject:bankCard forKey:@"bankCard"];
        NSLog(@"%@",data);
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(NSAttributedString*)moneyNumber:(NSString*)money{
    
     NSMutableAttributedString *attring=[[ NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥ %@",money]];
    NSRange range = NSMakeRange(0, 1);
    // 设置字体大小
[attring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:range];

      NSRange Mrange = NSMakeRange(1, money.length+1);
    [attring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:40] range:Mrange];
      NSRange allrange = NSMakeRange(0,attring.length);
        [attring addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:254/255.f green:201/255.f blue:46/255.f alpha:1.000] range:allrange];
    
    
    
    return attring;
    
    
    
}
- (IBAction)buaa:(id)sender {
    NSLog(@"QWQWQW");
}

@end
