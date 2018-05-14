//
//  ShiNameBngKaViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShiNameBngKaViewController.h"
#import "TuXingView.h"
#import "ShiNameBankList.h"
//#import "LLPaySdk.h"
@interface ShiNameBngKaViewController ()


{
    UIButton *_guiZeBtn;
    UIView *guiZeView;
    int pageNum;
    
    int total;
    UIButton*makejopBtn;
    UILabel *labelee;
    TuXingView *make;
    UIButton *makeche;
    NSMutableArray *make12;
     NSMutableArray *make123;
    NSString *makk;
    UIScrollView *makeView12;
    NSString *strings;
      NSString *strings1;
    
    NSString *realNameString;//用户真实名字
    NSString *IdNumberString;//身份证号
    
    
}
@property (weak, nonatomic) IBOutlet UIButton *yinhanka;
/*
 *连连支付
 */
//@property(strong,nonatomic)LLPaySdk *llPay;
@end

@implementation ShiNameBngKaViewController
-(void)viewWillAppear:(BOOL)animated{
//       self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];;
}




- (void)viewDidLoad {
    self.title=@"实名绑卡";
    [super viewDidLoad];
    [self loadRealName];
    guiZeView=[[UIView alloc] init];
    make=[[TuXingView  alloc] init];
    makk=@"1";
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    make12=[[NSMutableArray alloc] init];
    make123=[[NSMutableArray alloc] init];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
}
//-(LLPaySdk *)llPay{
//    if (!_llPay) {
//        _llPay =[[LLPaySdk alloc]init];
//        _llPay.sdkDelegate=self;
//    }
//
//    return _llPay;
//}
-(void)loadRealName{
    
//    GET /wallet/auth
    
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"]
                                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL path:[NSString stringWithFormat:@"wallet/auth"] params:paramDic success:^(id data) {
        realNameString=[NSString stringWithFormat:@"%@",data[@"name"]];
        IdNumberString=[NSString stringWithFormat:@"%@",data[@"identity"]];
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
    
}

- (IBAction)yanzengma:(id)sender {
    
    guiZeView.backgroundColor=[UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:0.3f];
    
    guiZeView.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    make.frame=CGRectMake((kScreenSize.width-280)/2, kScreenSize.height/5-5,280, 190);
    make.Views.  layer.cornerRadius=10;
    [self.tabBarController.view addSubview:guiZeView];
    [guiZeView addSubview:make];
    
    
    if (iPhone6p) {
        makejopBtn.frame=CGRectMake(50, 0, 30, 30);
    }
    else if(iPhone6)
    {
        makejopBtn.frame=CGRectMake(30, 0, 30, 30);
    }
    else
    {
        makejopBtn.frame=CGRectMake(10, 0, 30, 30);
    }
    makeche=make.QuXaio;
    [ makeche addTarget:self action:@selector(AdvertisingBtn) forControlEvents:UIControlEventTouchUpInside];
    

}
-(void)AdvertisingBtn
{
    [guiZeView removeFromSuperview];
    [make removeFromSuperview];
    
}
- (IBAction)lijidangka:(id)sender {
    
    
    
    
    

    
    
    
    
    
    
}

-(void)downLoad1:(NSString *)idnn
{
    if ([_BankNo.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"银行卡号不能为空"];
        return;
    }
    if ([_bankPhone.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"电话不能为空"];
        return;
    }
    if ([strings isEqualToString:@""]) {
        [MBProgressHUD showError:@"银行名字不能为空"];
        return;
    }

    
    NSDictionary *paramDic = @{
//                               @"bankName":strings,
                               @"bankCard":_BankNo.text,
                               @"phone":_bankPhone.text,
                               @"bankCode":strings1,
                               @"name":realNameString,
//                               @"source":@"app",
                              @"identity":IdNumberString};
    NSLog(@"paradic = %@",paramDic);
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    NSDictionary *headers = @{ @"content-Type": @"application/json"};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@wallet/cards?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    //    NSLog(@"baseUrl =  %@",kNewBaseURL1);
    NSLog(@"path = %@",@"wallet/cards");
    NSLog(@"paramsDict = %@",paramDic);
    
 
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setAllHTTPHeaderFields:headers];
        [request setHTTPBody:postData];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
            dispatch_sync(dispatch_get_main_queue(), ^{
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
                {
                    
//                    dispatch_async(dispatch_get_main_queue(), ^{
                                [MBProgressHUD showSuccess:@"绑卡成功"];
                        
                                [self.navigationController popViewControllerAnimated:NO];
                                  [[NSNotificationCenter defaultCenter]postNotificationName:@"maketou1267" object:nil];
//                    });
                    
//                    NSDictionary *dataDict = dict[@"data"];
//                    NSString *signOrder = dataDict[@"respObject"];
//                    NSData *da = [signOrder dataUsingEncoding:NSUTF8StringEncoding];
//                    NSDictionary *orderDict = [NSJSONSerialization JSONObjectWithData:da options:0 error:nil];
//                    NSLog(@"服务器 = %@",orderDict);
//                    [self.llPay  presentLLPaySDKInViewController:self withPayType:LLPayTypeQuick andTraderInfo:orderDict];
                }
                else
                {
                    [MBProgressHUD showError:dict[@"msg"]];
                }
            });
        }];
    
    
    
    
    
    
    
}
- (IBAction)QueDingBaiKa:(id)sender {
    [self downLoad1:nil];
    
    
    
    
}
- (IBAction)XuanZheYinHang:(id)sender {
     [self downLoad23];
}

-(void)downLoad23
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
     // NSMutableArray *maqq=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"wallet/banks" params:paramDic success:^(id data) {
         [make12 removeAllObjects];
        [make123 removeAllObjects];
        for (NSDictionary *data1 in data) {
            ShiNameBankList *BankList=[[ShiNameBankList alloc] initWithDict:data1];
            
           //
             [make123 addObject:BankList.bankCode];
            [make12 addObject:BankList.bankName];
        }
    
        if ([makk isEqualToString:@"1"]) {
            makeView12=[[UIScrollView alloc] init];
            makeView12.frame=CGRectMake(_shimingyinhang.frame.origin.x, _shimingyinhang.frame.origin.y+_shimingyinhang.frame.size.height+10, _shimingyinhang.frame.size.width/2,make12.count *44);
            makeView12.contentSize=CGSizeMake(_shimingyinhang.frame.size.width/2, make12.count *70);
            makeView12.backgroundColor=[UIColor whiteColor];
            [self.view addSubview:makeView12];
            int  im=0;
            makk=@"2";
            for (NSString *sre in make12) {
                
                //btn 文字在左
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(5, 5+im*44, _shimingyinhang.frame.size.width, 20);
                btnn.tag=im;
                btnn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                btnn.titleLabel.font=[UIFont systemFontOfSize:15];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaa:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:sre forState:UIControlStateNormal];
                [makeView12 addSubview:btnn];
                im++;
                
             
            }
            
        }else
        {
            [make12 removeAllObjects];
            makk=@"1";
            [makeView12 removeFromSuperview];
        }

        NSLog(@"%@",data);
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)btnnnaaaaaa:(UIButton *)btn
{
    makk=@"1";
    strings1=make123[btn.tag];
    strings=make12[btn.tag];
    _shimingyinhang.text=make12[btn.tag];
   // [_yinhanka setTitle: forState:UIControlStateNormal];
    [makeView12 removeFromSuperview];
    
}
//- (void)paymentEnd:(LLPayResult)resultCode withResultDic:(NSDictionary*)dic{
//    NSString *result_pay=[NSString stringWithFormat:@"%@",dic[@"result_pay"]];
//    if ([result_pay isEqualToString:@"SUCCESS"]) {
//
//        [MBProgressHUD showSuccess:@"绑卡成功"];
//
//        [self.navigationController popViewControllerAnimated:NO];
//          [[NSNotificationCenter defaultCenter]postNotificationName:@"maketou1267" object:nil];
//
//    }else{
//        NSString *result_Message=[NSString stringWithFormat:@"%@",dic[@"ret_msg"]];
//
//        [MBProgressHUD showError:result_Message];
//    }
//
//
//}
@end
