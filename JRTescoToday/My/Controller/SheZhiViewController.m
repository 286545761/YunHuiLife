//
//  SheZhiViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/23.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "SheZhiViewController.h"
#import "ShiNameBngKaViewController.h"
#import "ChangeLoginPwdController.h"
#import "SheZhiZhiFuViewController.h"
#import "DHMainController.h"
#import "ShiNameViewController.h"
#import "YinhangkaguanliViewController.h"
#import "YinhangkaWeiViewController.h"
@interface SheZhiViewController ()
{
      UIAlertView *alert;
    UIAlertView *alertView2;
    UIAlertView *alertView1;
}
@property (weak, nonatomic) IBOutlet UIButton *zhifumiam;
@property (weak, nonatomic) IBOutlet UILabel *zhufumimsLabel;
@end

@implementation SheZhiViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self downLoad];
    self.navigationController.navigationBarHidden=NO;
    
}
- (void)viewDidLoad {
    self.title=@"设置";
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
     if ([_zhufumima isEqualToString:@"0"]) {
  _zhufumimsLabel.text=@"设置支付密码";
     }
    else
    {
            _zhufumimsLabel.text=@"修改支付密码"; 
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)XiuGaiZhiFu:(id)sender {
    
    if ([_zhufumima isEqualToString:@"0"]) {
        
        SheZhiZhiFuViewController*nihao=[[SheZhiZhiFuViewController alloc] init];
       
        nihao.title=@"设置支付密码";
        [self.navigationController pushViewController:nihao animated:YES];
    }
    else{
         //_zhufumimsLabel.text=@"修改支付密码";
        ChangeLoginPwdController*nihao=[[ChangeLoginPwdController alloc] init];
        nihao.title=@"修改支付密码";
         nihao.code123=@"2";
        [self.navigationController pushViewController:nihao animated:YES];
    }

}

- (IBAction)xiugaiDenglu:(id)sender {
    ChangeLoginPwdController*nihao=[[ChangeLoginPwdController alloc] init];
    nihao.title=@"修改登录密码";
    nihao.code123=@"1";
  //  nihao.zhangtai=_zhangtai;
    [self.navigationController pushViewController:nihao animated:YES];
}

- (IBAction)yinhangkanguanli:(id)sender {
    
    if ([_nameRernzheng isEqualToString:@"0"])
    {
//        YinhangkaWeiViewController *shinamebangka=[[YinhangkaWeiViewController alloc ] init];
//        [self.navigationController pushViewController:shinamebangka animated:YES];
         [MBProgressHUD showError:@"绑卡前，请先实名"];
        ShiNameViewController *shi=[[ShiNameViewController alloc] init];
        
        [self.navigationController pushViewController:shi animated:YES];
    }
    else{
        if (![_zhufumima isEqualToString:@"0"]) {
            
            YinhangkaWeiViewController *shinamebangka=[[YinhangkaWeiViewController alloc ] init];
            [self.navigationController pushViewController:shinamebangka animated:YES];
//            YinhangkaguanliViewController*make=[[YinhangkaguanliViewController alloc] init];
//            [self.navigationController pushViewController:make animated:YES];
            
        }
        
        else{
            
            YinhangkaWeiViewController *shinamebangka=[[YinhangkaWeiViewController alloc ] init];
            [self.navigationController pushViewController:shinamebangka animated:YES];
         
        }
        
 
    }
    
    
}
- (IBAction)tichudenglu:(id)sender {
    NSString *str = [NSString stringWithFormat:@"您确定要退出登录吗？"];
    alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                      message:str
                                     delegate:self
                            cancelButtonTitle:@"取消"
                            otherButtonTitles:@"确定", nil];
    
    
    [alert show];

}
#pragma mark alertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    // 6FE649BA-EDB8-4EAA-A815-1BE64DB6774A
  
        // 取消
            if (buttonIndex == 0)
            {
                     return;
               
               
            }else{
                // 删除已登录页面
                
                // 删除归档
                NSFileManager *fileManager = [NSFileManager defaultManager];
                
                if ([fileManager isDeletableFileAtPath:kFilePath]) {
                    [fileManager removeItemAtPath:kFilePath error:nil];
                    
                }
                [FNUserDefaults removeObjectForKey:@"usersid"];
                // [FNUserDefaults removeObjectForKey:@"usersid"];
                
                [FNUserDefaults setObject:@"2" forKey:@"guimijihuaguanggao"];
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults removeObjectForKey:@"renzheng1234"];
                [FNUserDefaults removeObjectForKey:@"status123"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"vipMakeBtn11" object:nil];
                if ([_zhangtai isEqualToString:@"1"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"My" object:nil];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"123" object:nil];
                    [self.navigationController popViewControllerAnimated:YES];
                    [FNUserDefaults removeObjectForKey:@"dengluren"];
                }
                else
                {
                    // self.view.window.rootViewController = [[DHMainController alloc] init];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"My" object:nil];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                
           
            }
        
    
    
}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"wallet" params:paramDic success:^(id data) {
        
        
        NSLog(@"%@",data);
        
       // ammont=data[@"balance"];
        _zhufumima=[NSString stringWithFormat:@"%@",data[@"isBindCard"]];
       _nameRernzheng=[NSString stringWithFormat:@"%@",data[@"isRealName"]];
        _passWord=[NSString stringWithFormat:@"%@",data[@"isSetupPayPassword"]];
       // _QianBaoYuE.text=[NSString stringWithFormat:@"￥%@",ammont];
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
@end
