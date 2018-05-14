//
//  CongZhiViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/31.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CongZhiViewController.h"
//#import "LLPaySdk.h"

@interface CongZhiViewController ()

{
     __block int timeout; //倒计时时间
    NSString *strii;
}
@property (weak, nonatomic) IBOutlet UILabel *QianBaoYue;
@property (weak, nonatomic) IBOutlet UITextField *yanZhenMa;
@property (weak, nonatomic) IBOutlet UIButton *huQuYanZhenMaBtn;
@property (weak, nonatomic) IBOutlet UITextField *congZhi;
@property (weak, nonatomic) IBOutlet UITextField *shhoujihao;
/*
 *连连支付
 */
//@property(strong,nonatomic)LLPaySdk *llPay;

@end

@implementation CongZhiViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"用户充值";
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    timeout=60;
    strii=@"";
    if ([[FNUserDefaults  objectForKey:@"otheryanzengma"] isEqualToString:@"2"]) {
        timeout=[[FNUserDefaults objectForKey:@"othertimeyanzeng"] intValue];
        [self startTime];
    } [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [self downLoad];
    
}
//-(LLPaySdk *)llPay{
//    if (!_llPay) {
//        _llPay =[[LLPaySdk alloc]init];
//        _llPay.sdkDelegate=self;
//    }
//
//    return _llPay;
//}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"wallet" params:paramDic success:^(id data) {
        
        
        NSLog(@"%@",data);
        
        //ammont=data[@"amount"];
        _QianBaoYue.text=[NSString stringWithFormat:@"%@",data[@"balance"]];
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
- (IBAction)huQuYanZengMa:(id)sender {
    
    [self downLoad1:nil];
   
    
    
    
}

#pragma mark 倒计时
- (void)startTime
{
       // __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_huQuYanZhenMaBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                _huQuYanZhenMaBtn.userInteractionEnabled = YES;
                timeout=60;
                [FNUserDefaults setObject:@"1" forKey:@"otheryanzengma"];
                if (IOS_7) {
                    _huQuYanZhenMaBtn.enabled = YES;
                }
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_huQuYanZhenMaBtn setTitle:[NSString stringWithFormat:@"重新发送(%@)",strTime] forState:UIControlStateNormal];
                [FNUserDefaults setObject:strTime forKey:@"othertimeyanzeng"];
                [FNUserDefaults setObject:@"2" forKey:@"otheryanzengma"];
                _huQuYanZhenMaBtn.userInteractionEnabled = NO;
                if (IOS_7) {
                    _huQuYanZhenMaBtn.enabled = NO;
                }
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
-(void)downLoad1:(NSString *)idnn
{
    

    if ([_congZhi.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"金额不能为空"];
        return;
    }
    if ([_congZhi.text intValue]<1) {
        [MBProgressHUD showError:@"金额不能小于1"];
        return;
    }

    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"amount":_congZhi.text,
                                                                                    //@"phone": _shhoujihao.text,
                                                                                    @"type": @"1",
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    //POST /pay/recharge_create
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:100 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@wallet/recharge?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSLog(@"%@",data);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
            {
                  [self startTime];
               // strii=[NSString stringWithFormat:dict[@"data"]];
              //  [self downLoad12:[NSString stringWithFormat:@"%@",dict[@"data"][@"orderid"]]];
                strii=[NSString stringWithFormat:@"%@",dict[@"data"][@"orderid"]];
            }
            NSLog(@"%@",dict[@"msg"]);
        });
        
        
        

        
        
        
        
        
    }];
    
    
}
-(void)downLoad12:(NSString *)idnn12
{
    

}
- (IBAction)chongzhi:(id)sender {
    
    
    [self downLoad123:nil];
    
}
-(void)downLoad123:(NSString *)idnn12
{
//    if ([_yanZhenMa.text isEqualToString:@""]) {
//        [MBProgressHUD showError:@"验证码不能为空"];
//        return;
//    }
    if ([_congZhi.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"金额不能为空"];
        return;
    }
    if ([_congZhi.text intValue]<1) {
        [MBProgressHUD showError:@"金额不能小于1"];
        return;
    }
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"amount":_congZhi.text,
                                                                                    @"source":@"app"                                              //@"phone": _shhoujihao.text,
//                                                                                    @"type": @"1",
                                                                                    }];
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@wallet/recharge?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        [self setValue:@"1111" forKey:@"ssss"];
        

        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"_+_+%@",dict[@"data"]);

//        //5.回到主线程,进行更新页面
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
//            {
//                [MBProgressHUD showError:@"充值成功"];
//                [self.navigationController  popViewControllerAnimated:YES];
//            }
//            NSLog(@"%@",dict[@"msg"]);
//        });
//
        NSData *inFoData=[dict[@"data"][@"respObject"] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *infoDict=[NSJSONSerialization JSONObjectWithData:inFoData options:NSJSONReadingAllowFragments error:nil];
//
//
//        [self.llPay  presentLLPaySDKInViewController:self withPayType:LLPayTypeQuick andTraderInfo:infoDict];
       
        
        
        
        
    }];
    
    
}
//- (void)paymentEnd:(LLPayResult)resultCode withResultDic:(NSDictionary*)dic{
//    NSString *result_pay=[NSString stringWithFormat:@"%@",dic[@"result_pay"]];
//    if ([result_pay isEqualToString:@"SUCCESS"]) {
//
//        [MBProgressHUD showSuccess:@"充值成功"];
//
//        [self.navigationController popViewControllerAnimated:YES];
//
//
//    }else{
//        NSString *result_Message=[NSString stringWithFormat:@"%@",dic[@"ret_msg"]];
//
//        [MBProgressHUD showError:result_Message];
//    }
//
//
//}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}
@end
