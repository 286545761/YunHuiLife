//
//  ConsumptionController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/25.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ConsumptionController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "PopPasswordView.h"
#import "TTConst.h"
#import "zhifushibaixxViewController.h"
#import "ZhiFuChengGongViewController.h"
#import "youhuishuomingViewController.h"
#import "SheZhiZhiFuViewController.h"
#import "WXApiObject.h"
#import "WXApi.h"
#import "ShiNameViewController.h"

#import "YinhangkaWeiViewController.h"
//#import "PayReq.h"
#import "JRCountDownView.h"
@interface ConsumptionController ()<UITextFieldDelegate,WXApiDelegate>
{
    NSString *num;
    NSString *orderStringyuser;
    NSDictionary *makedict;
    NSString *payPassword;
    UIButton *btn;
    NSString *idnn;
    NSString *bankCard;
     NSString *theBalanceMoneyString;
}
@property (nonatomic,assign)BOOL isTabBar;
@property (weak, nonatomic) IBOutlet UILabel *keyongyue;
@property (weak, nonatomic) IBOutlet UITextField *zhifuText;
@property (weak, nonatomic) IBOutlet UILabel *zhekou;
@property (weak, nonatomic) IBOutlet UILabel *qian;
@property (weak, nonatomic) IBOutlet UILabel *shifu;


@property (copy, nonatomic) NSString* theDiscountPriceString;
/*
 *原价
 */
@property(copy,nonatomic)NSString *theOrPrice;
/*
 *打折后的价格
 */
//@property(copy,nonatomic)NSString *theNewPrice;
@end

@implementation ConsumptionController
-(void)viewWillAppear:(BOOL)animated
{
        // [FNUserDefaults removeObjectForKey:@"zhifubao"];
    self.navigationController.navigationBarHidden=NO;
       [self downLoad];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayResult:) name:@"WXPay" object:nil];
}
-(void)setTheOrderNumberString:(NSString *)theOrderNumberString{
    _theOrderNumberString=theOrderNumberString;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"云惠付";
    _shifu.text=_nnnnn;
//    _zhifuText.text=_nnnnn;
//    _shifu.backgroundColor=[UIColor redColor];
//    _zhifuText.backgroundColor=[UIColor yellowColor];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    // Do any additional setup after loading the view from its nib.
    num=@"3";
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
      [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:_zhifuText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tiaozhan) name:@"SET_HAND_PWD1111" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"SET_HAND_PWD123" object:nil];
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame=CGRectMake(kScreenSize.width-70, 10, 60, 60);
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tuchengBaitiao-0.png"]forBarMetrics:UIBarMetricsDefault];
    [settingBtn addTarget:self action:@selector(enterTeamCard) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setTitle:@"优惠说明" forState:UIControlStateNormal];
    [settingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    settingBtn.titleLabel.font=[UIFont systemFontOfSize:12];
   // [settingBtn setImage:[UIImage imageNamed:@"nav_btn_share"] forState:UIControlStateNormal];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];
    //[self downLoad];
   // [self downLoad23];
    if (![_nnnnn isEqualToString:@"0"]) {
        JRCountDownView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JRCountDownView class]) owner:self options:nil] lastObject];
        [view countTimeWithEndTime:@"1800"];
        view.frame = CGRectMake(0, 0, kScreenSize.width, 100);
        [_ssssss addSubview:view];
    }

}
// 加载打折后的价格
-(void)loadtheDiscountPrice{
////    http://p.jryunhui.com/api/merchants/activity/optimal/9365f35d-30ba-11e8-a215-702084e1f310?amount=20&access_token=8b79c24d-7394-4ed8-8122-b9e8ad1a8eca
    NSString *pathString=[NSString stringWithFormat:@"/merchants/activity/optimal/%@?amount=%@",_theStoreID,_zhifuText.text];
    [HttpTool getWithBaseURL:kBaseURL  path:pathString params:nil success:^(id data) {

        _nnnnn=[NSString stringWithFormat:@"%@",data];
            _shifu.text=[NSString stringWithFormat:@"￥%.2f",[data floatValue]];
    } failure:^(NSError *error) {

    } alertInfo:^(NSString *alertInfo) {

    }];
    
    
}
-(void)enterTeamCard
{
    youhuishuomingViewController *nn=[[youhuishuomingViewController alloc] init];
    nn.title=@"优惠说明";
    [self.navigationController pushViewController:nn animated:YES];
}
-(void)downLoadFinish
{
  
}
-(void)tiaozhan
{
   [self removeFromParentViewController];
}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//    if (textField==_fistPwdTextField)
//    {
//        if (range.location<18)
//            return YES;
//        
//        else
//            return NO;
//    }else if(textField==_confirmPwdTextField){
//        if (range.location<18)
//            return YES;
//        
//        else
//            return NO;
//        
//    }else{
//        return YES;
//    }
//}
-(void)textFieldChange
{
  ;
    self.theOrPrice=_zhifuText.text;
//    _qian.backgroundColor=[UIColor redColor];
        _qian.text=[NSString stringWithFormat:@"-￥%.2f",[ _zhifuText.text floatValue]];

    [self loadtheDiscountPrice];
}

-(void)downLoad123:(NSString *)idnn12 ands:(NSString *)code
{
   
  
    
    
    
   


    
    
    
//    orderCode (string),
//    payType (integer),
//    payPassword (string),
//    openId (string)
       NSString *urlstring;
    NSDictionary *paramDic;
    if ([_OrderType isEqualToString:@"2"]) {
        
    
        
        // 优惠买单// 支付订单   //    //    type (integer): 1,易购钱包 2,微信公众账号支付 3,微信支付APP个人版 4,微信支付APP商家版 5,支付宝支付APP）
       urlstring=[NSString  stringWithFormat:@"%@/merchants/orders/pay?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
        paramDic=@{
                   @"orderCode":self.theOrderNumberString,
                   @"payType":num,
                   @"payPassword":code
//                   ,
//                   @"openId":@""
                   };
        
        
    }else{// 团购
//        PayDiscountOrderRequest {
//            amount (number): 支付金额 ,
//            merchantCode (string): 商铺编码 ,
//            oamount (number): 原价 ,
//            openid (string): openid ,
//            payPassword (string): 支付密码 ,
//            type (integer): 支付类型
//        }
        //    //    type (integer): 1,易购钱包 2,微信公众账号支付 3,微信支付APP个人版 4,微信支付APP商家版 5,支付宝支付APP）
        
        
//        POST /merchants/orders/discount/pay
        urlstring=[NSString  stringWithFormat:@"%@/merchants/orders/discount/pay?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
        paramDic=@{
                   @"amount":_nnnnn,
                   @"merchantCode":self.theStoreCode,
                   @"oamount":self.theOrPrice,
                   @"openid":@"",
                   @"payPassword":code,
                   @"type":num
                   
                   };
        
        
    }
    

        [FNUserDefaults objectForKey:@"MD5Pwd"];
    
 NSDictionary *headers = @{ @"content-Type": @"application/json"};
        NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    
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
              // [MBProgressHUD showError:dict[@"msg"]];
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
                {
                    idnn =dict[@"data"][@"orderNo"];
                     [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
    
                    if ([num isEqualToString:@"5"]) {
    //                    orderStringyuser=
                        NSString *appScheme = @"alisdkdemo";
    //                    NSDictionary *apPayDic=dict[@"data"][@"respObject"];
                        NSString *orderString = dict[@"data"][@"respObject"];
    
                        NSData * orderInfoData=[orderString dataUsingEncoding:NSUTF8StringEncoding];
                        NSDictionary *orderDic=[NSJSONSerialization JSONObjectWithData:orderInfoData options:NSJSONReadingMutableLeaves error:nil];
    
    //
    
                        // NOTE: 调用支付结果开始支付
                        [[AlipaySDK defaultService] payOrder:orderDic[@"orderInfo"] fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                            NSLog(@"reslut = %@",resultDic);
                            if ([[NSString stringWithFormat:@"%@",resultDic[@"resultStatus"]] isEqualToString:@"9000"]) {
                                ZhiFuChengGongViewController *ma=[[ZhiFuChengGongViewController alloc] init];
                                NSString *resultDicString=[NSString stringWithFormat:@"%@",resultDic[@"memo"]];
                                if (resultDicString.length>0) {
                                          [MBProgressHUD showError:resultDicString];
                                }
    
                                ma.dingdan=[NSString stringWithFormat:@"%@",dict[@"data"][@"orderNo"]];
                                ma.qian=_shifu.text;
                                ma.zhifubao=@"支付宝";
    
                                [FNUserDefaults removeObjectForKey:@"zhifubao"];
                                [self.navigationController pushViewController:ma animated:YES];
    
                            }else{
                                // [MBProgressHUD showError:[NSString stringWithFormat:@"%@",resultDic[@"memo"]]];
                                zhifushibaixxViewController *ma=[[zhifushibaixxViewController alloc] init];
    
                                 [self.navigationController pushViewController:ma animated:YES];
                                [FNUserDefaults removeObjectForKey:@"zhifubao"];
    
                            }
    
    
                        }];
    
                    }else if([num isEqualToString:@"1"])
                    {
                        ZhiFuChengGongViewController *ma=[[ZhiFuChengGongViewController alloc] init];
                        ma.dingdan=[NSString stringWithFormat:@"%@",dict[@"data"][@"orderNo"]];
                        ma.qian=_shifu.text;
                        ma.zhifubao=@"云惠钱包";
    
                        [FNUserDefaults removeObjectForKey:@"zhifubao"];
                        [self.navigationController pushViewController:ma animated:YES];
                    }else
                    {
                        NSData *JSONData = [dict[@"data"][@"respObject"] dataUsingEncoding:NSUTF8StringEncoding];
                        NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    
    //                    NSString *ip=[NSString stringWithFormat:@"%@",responseJSON[@"appid"]];
    //                    NSLog(@"-=-%@",ip);
                        PayReq *request = [[PayReq alloc] init];
                        request.openID=[NSString stringWithFormat:@"%@",responseJSON[@"appid"]];
                        request.partnerId = [NSString stringWithFormat:@"%@",responseJSON[@"partnerid"]];;
                        request.prepayId= [NSString stringWithFormat:@"%@",responseJSON[@"prepayid"]];
                        request.package =[NSString stringWithFormat:@"%@",responseJSON[@"package"]];
                        request.nonceStr=[NSString stringWithFormat:@"%@",responseJSON[@"noncestr"]];
                        request.timeStamp=[[NSString stringWithFormat:@"%@",responseJSON[@"timestamp"]] intValue];
                        request.sign=[NSString stringWithFormat:@"%@",responseJSON[@"sign"]];
    
                        [WXApi sendReq:request];
    
    
    
                    }
    
    
                }
                else{
                    zhifushibaixxViewController *ma=[[zhifushibaixxViewController alloc] init];
                    [self.navigationController pushViewController:ma animated:YES];
                    [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                }
                NSLog(@"%@",dict[@"msg"]);
            });
    
    
    
    
    
    
        }];
    


    
    
    
    
    
    
    
    
    

//
//
//
//
//    // 上一次
//
////    amount (number): 支付金额 ,
////    goodsCount (integer): 团购数量 ,
////    goodsId (string): 团购商品ID ,
////    merchantCode (string): 商铺编码 ,
////    oamount (number): 原价 ,
////    openid (string, optional): wap微信支付必传 ,
////    orderType (integer): 1团购2优惠买单 ,
////    payPassword (string): 支付密码 ,
//    //    type (integer): 1,易购钱包 2,微信公众账号支付 3,微信支付APP个人版 4,微信支付APP商家版 5,支付宝支付APP）
////}
//    NSMutableDictionary *paramDic;
//    if ([_OrderType isEqualToString:@"2"]) {
//        paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
//                                                                   @"amount":_nnnnn,
//                                                                   @"merchantCode":_theStoreCode
//                                                                   ,@"payPassword":code,
//                                                                   @"type":num,
//                                                                   @"oamount":_zhifuText.text,
//                                                                   @"orderType":_OrderType}];
//
//
//
//    }else{
//        paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
//                                                                   @"amount":_nnnnn,
//                                                                   @"merchantCode":_theStoreID
//                                                                   ,@"payPassword":code,
//                                                                   @"type":num,
//                                                                   @"goodsId":_cgBUS,
//                                                                   @"goodsCount":@([_theNumber intValue])                                        ,
//                                                                   @"oamount":_theOriginalPrice,
//                                                                   @"orderType":_OrderType}];
//
//
//    }
//
//
//
//
//
//    // uid
//    [FNUserDefaults objectForKey:@"MD5Pwd"];
//
//
//
//    NSDictionary *headers = @{ @"content-Type": @"application/json"};
//
//    if ([num isEqualToString:@"1"]) {
//
//    }
//    else{
//        [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在跳转第三方支付平台..."];
//    }
//
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
//    NSString *urlstring=[NSString  stringWithFormat:@"%@/merchants/orders?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
//    NSURL *url = [NSURL URLWithString:urlstring];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//
//    [request setHTTPMethod:@"POST"];
//    [request setAllHTTPHeaderFields:headers];
//
//    [request setHTTPBody:postData];
//    NSLog(@"%@", [request allHTTPHeaderFields]);
//
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
//
//
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//
//
//        NSLog(@"%@",dict);
//        //5.回到主线程,进行更新页面
//
//        dispatch_sync(dispatch_get_main_queue(), ^{
//          // [MBProgressHUD showError:dict[@"msg"]];
//            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
//            {
//                idnn =dict[@"data"][@"orderNo"];
//                 [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//
//                if ([num isEqualToString:@"5"]) {
////                    orderStringyuser=
//                    NSString *appScheme = @"alisdkdemo";
////                    NSDictionary *apPayDic=dict[@"data"][@"respObject"];
//                    NSString *orderString = dict[@"data"][@"respObject"];
//
//                    NSData * orderInfoData=[orderString dataUsingEncoding:NSUTF8StringEncoding];
//                    NSDictionary *orderDic=[NSJSONSerialization JSONObjectWithData:orderInfoData options:NSJSONReadingMutableLeaves error:nil];
//
////
//
//                    // NOTE: 调用支付结果开始支付
//                    [[AlipaySDK defaultService] payOrder:orderDic[@"orderInfo"] fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//                        NSLog(@"reslut = %@",resultDic);
//                        if ([[NSString stringWithFormat:@"%@",resultDic[@"resultStatus"]] isEqualToString:@"9000"]) {
//                            ZhiFuChengGongViewController *ma=[[ZhiFuChengGongViewController alloc] init];
//                            NSString *resultDicString=[NSString stringWithFormat:@"%@",resultDic[@"memo"]];
//                            if (resultDicString.length>0) {
//                                      [MBProgressHUD showError:resultDicString];
//                            }
//
//                            ma.dingdan=[NSString stringWithFormat:@"%@",dict[@"data"][@"orderNo"]];
//                            ma.qian=_shifu.text;
//                            ma.zhifubao=@"支付宝";
//
//                            [FNUserDefaults removeObjectForKey:@"zhifubao"];
//                            [self.navigationController pushViewController:ma animated:YES];
//
//                        }else{
//                            // [MBProgressHUD showError:[NSString stringWithFormat:@"%@",resultDic[@"memo"]]];
//                            zhifushibaixxViewController *ma=[[zhifushibaixxViewController alloc] init];
//
//                             [self.navigationController pushViewController:ma animated:YES];
//                            [FNUserDefaults removeObjectForKey:@"zhifubao"];
//
//                        }
//
//
//                    }];
//
//                }else if([num isEqualToString:@"1"])
//                {
//                    ZhiFuChengGongViewController *ma=[[ZhiFuChengGongViewController alloc] init];
//                    ma.dingdan=[NSString stringWithFormat:@"%@",dict[@"data"][@"orderCode"]];
//                    ma.qian=_shifu.text;
//                    ma.zhifubao=@"云惠钱包";
//
//                    [FNUserDefaults removeObjectForKey:@"zhifubao"];
//                    [self.navigationController pushViewController:ma animated:YES];
//                }else
//                {
//                    NSData *JSONData = [dict[@"data"][@"respObject"] dataUsingEncoding:NSUTF8StringEncoding];
//                    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
//
////                    NSString *ip=[NSString stringWithFormat:@"%@",responseJSON[@"appid"]];
////                    NSLog(@"-=-%@",ip);
//                    PayReq *request = [[PayReq alloc] init];
//                    request.openID=[NSString stringWithFormat:@"%@",responseJSON[@"appid"]];
//                    request.partnerId = [NSString stringWithFormat:@"%@",responseJSON[@"partnerid"]];;
//                    request.prepayId= [NSString stringWithFormat:@"%@",responseJSON[@"prepayid"]];
//                    request.package =[NSString stringWithFormat:@"%@",responseJSON[@"package"]];
//                    request.nonceStr=[NSString stringWithFormat:@"%@",responseJSON[@"noncestr"]];
//                    request.timeStamp=[[NSString stringWithFormat:@"%@",responseJSON[@"timestamp"]] intValue];
//                    request.sign=[NSString stringWithFormat:@"%@",responseJSON[@"sign"]];
//
//                    [WXApi sendReq:request];
//
//
//
//                }
//
//
//            }
//            else{
//                zhifushibaixxViewController *ma=[[zhifushibaixxViewController alloc] init];
//                [self.navigationController pushViewController:ma animated:YES];
//                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//            }
//            NSLog(@"%@",dict[@"msg"]);
//        });
//
//
//
//
//
//
//    }];
//
    
}

////9.0前的方法，为了适配低版本 保留
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//    return [WXApi handleOpenURL:url delegate:self];
//}
//
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//    return [WXApi handleOpenURL:url delegate:self];
//}
////9.0后的方法
//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
//    //这里判断是否发起的请求为微信支付，如果是的话，用WXApi的方法调起微信客户端的支付页面（://pay 之前的那串字符串就是你的APPID，）
//    return  [WXApi handleOpenURL:url delegate:self];
//}
//-(void)onResp:(BaseResp*)resp{
//    PayResp*response=(PayResp*)resp;
//    switch(response.errCode){
//        caseWXSuccess:
//            //服务器端查询支付通知或查询API返回的结果再提示成功
//            NSLog(@"支付成功");
//            break;
//        default:
//
//            NSLog(@"支付失败，retcode=%d",resp.errCode);
//            break;
//    }
//
//}
-(void)quchuzhifumima
{
//    PayReq *request = [[PayReq alloc] init];
//    request.partnerId = @"10000100";
//    request.prepayId= @"1101000000140415649af9fc314aa427";
//    request.package = @"Sign=WXPay";
//    request.nonceStr= @"a462b76e7436e98e0ed6e13c64b4fd1c";
//    request.timeStamp=1397527777;
//    request.sign= @"582282D72DD2B03AD892830965F428CB16E7A256";
//    [WXApi sendReq:request];
    
    
    [btn removeFromSuperview];
   [self.passwordView removeFromSuperview];
}
-(void)useStoreCode:(NSString *)code
{
    [btn removeFromSuperview];
    [self.passwordView removeFromSuperview];
    
    [self downLoad123:num ands:code];
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"您输入的密码为:%@",code] preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        
//    }];
//    [alertController addAction:cancelAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    eslut = {
//        memo = "";
//        result = "{\"alipay_trade_app_pay_response\":{\"code\":\"10000\",\"msg\":\"Success\",\"app_id\":\"2017083008460072\",\"auth_app_id\":\"2017083008460072\",\"charset\":\"UTF-8\",\"timestamp\":\"2017-09-22 11:10:00\",\"total_amount\":\"0.95\",\"trade_no\":\"2017092221001004800511547025\",\"seller_id\":\"2088521876035830\",\"out_trade_no\":\"737029977052381184\"},\"sign\":\"ayQCxEqbIlHldogPALwB8hYr9YwpcPkwUhoS+35ISyulN22qMndMWOdv8jw8T7ycsvReAQ5i1q3Hi1JNxY2A8BICq/OW5R07ZhFT5nR5Cf4OwO9hAYesmmvrtfyqVosy9+0UQOyuC7CZJRzXUM6ZJNGcnAwoH0DyRna82K65FwrBDUNeM9bnpszcKL0RXxKfvf+TrCiwXU7rNCZmx4ZfS3QJrZXn7KKmQRcDTmOoXMk2+zuJkK9Y1G5JQHqzBY8lYUt+AzkY+JHoCpkIxh3JRckcE876LUZe6tOLL/1gihWyfsWxABP8b6jEOL4JQp9z8aNYYyoNaviorexGiDLwSw==\",\"sign_type\":\"RSA2\"}";
//        resultStatus = 9000;
//    }
//    2017-09-22 11:10:06.198175+0800 JRTescoToday[1737:869110] dnssd_clientstub write_all(14) DEFUNCT
//    2017-09-22 11:10:06.198248+0800 JRTescoToday[1737:869110] dnssd_clientstub deliver_request ERROR: write_all(14, 54 bytes) failed
//    2017-09-22 11:10:06.198440+0800 JRTescoToday[1737:869110] dnssd_clientstub write_all(14) DEFUNCT
}
-(void)setOrderType:(NSString *)OrderType{
    _OrderType=OrderType;
    
    
}
- (IBAction)qudingzhifu:(id)sender {
    
    if ([_OrderType isEqualToString:@"1"]) {
        if ([_zhifuText.text isEqualToString:@""]) {
            [MBProgressHUD showError:@"金额不能为空"];
            return;
        }
    }
    
    
    if ([num isEqualToString:@"5"]) {
        
         [self downLoad123:num ands:@""];
    } if ([num isEqualToString:@"3"]) {
        
        [self downLoad123:num ands:@""];
    }
    else if([num isEqualToString:@"1"])
    {
//
        
        if ([theBalanceMoneyString floatValue] <[_nnnnn floatValue]) {
            [MBProgressHUD showError:@"余额不足请更换支付方式"];
            return;
        }
        
        
        if ([_keyongyue.text isEqualToString:@"0"]) {
            
            if (! [bankCard isEqualToString:@""]) {
                YinhangkaWeiViewController *shinamebangka=[[YinhangkaWeiViewController alloc ] init];
                [self.navigationController pushViewController:shinamebangka animated:YES];
            }else
            {
                ShiNameViewController *shi=[[ShiNameViewController alloc] init];
                
                [self.navigationController pushViewController:shi animated:YES];
                
            }
            
        }
        else
        {
            if ([payPassword isEqualToString:@"1"]) {
                
                
                btn=[UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height/3);
                [btn addTarget:self action:@selector(quchuzhifumima) forControlEvents:UIControlEventTouchUpInside];
                
                self.passwordView=[[PopPasswordView alloc]initViewwithtype:@"open"];
                self.passwordView.delegate=self;
                self.passwordView.type=@"open";
                [[UIApplication sharedApplication].keyWindow addSubview:self.passwordView];
                [[UIApplication sharedApplication].keyWindow addSubview:btn];
            }else
            {
                SheZhiZhiFuViewController*nihao=[[SheZhiZhiFuViewController alloc] init];
                
                nihao.title=@"设置支付密码";
                [self.navigationController pushViewController:nihao animated:YES];
            }
        }

        }
     
        
        
    
    }
- (void)getOrderPayResult:(NSNotification *)notification
{
    NSLog(@"userInfo: %@",notification.userInfo);
    
    if ([notification.object isEqualToString:@"0"])
    {
        ZhiFuChengGongViewController *ma=[[ZhiFuChengGongViewController alloc] init];
        
        ma.dingdan=[NSString stringWithFormat:@"%@",idnn];
        ma.qian=_shifu.text;
        ma.zhifubao=@"微信";
        [self.navigationController pushViewController:ma animated:YES];
    }
    else if([notification.object isEqualToString:@"-1"])
    {
        zhifushibaixxViewController *ma=[[zhifushibaixxViewController alloc] init];
        [self.navigationController pushViewController:ma animated:YES];
    }
    else
    {
        zhifushibaixxViewController *ma=[[zhifushibaixxViewController alloc] init];
        [self.navigationController pushViewController:ma animated:YES];
    }
}

- (IBAction)zhifubao:(id)sender {
    num=@"5";
    _zhifubaiimage.image =[UIImage imageNamed:@"register_icon_consent"];
     _weixinimage.image =[UIImage imageNamed:@"icon_select"];
     _qianbaoimage.image =[UIImage imageNamed:@"icon_select"];
     //[self downLoad123:num];
}
- (IBAction)weixin:(id)sender {
   
      num=@"3";
    _zhifubaiimage.image =[UIImage imageNamed:@"icon_select"];
    _weixinimage.image =[UIImage imageNamed:@"register_icon_consent"];
    _qianbaoimage.image =[UIImage imageNamed:@"icon_select"];
      //[self downLoad123:num];
}
- (IBAction)pianbao:(id)sender {
    
      num=@"1";
    _zhifubaiimage.image =[UIImage imageNamed:@"icon_select"];
    _weixinimage.image =[UIImage imageNamed:@"icon_select"];
    _qianbaoimage.image =[UIImage imageNamed:@"register_icon_consent"];
    //[self downLoad123:num];
}

//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
//{
//    if ([url.host isEqualToString:@"safepay"]) {
//        // 支付跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            NSLog(@"result = %@",resultDic[@"memo"]);
//            [MBProgressHUD showError:resultDic[@"memo"]];
//        }];
//        
//        // 授权跳转支付宝钱包进行支付，处理支付结果
//        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
//            NSLog(@"result = %@",resultDic);
//            NSLog(@"result = %@",resultDic[@"memo"]);
//            [MBProgressHUD showError:resultDic[@"memo"]];
//            // 解析 auth code
//            NSString *result = resultDic[@"result"];
//            NSString *authCode = nil;
//            if (result.length>0) {
//                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
//                for (NSString *subResult in resultArr) {
//                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
//                        authCode = [subResult substringFromIndex:10];
//                        break;
//                    }
//                }
//            }
//            NSLog(@"授权结果 authCode = %@", authCode?:@"");
//        }];
//    }
//    return YES;
//}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"/person" params:paramDic success:^(id data) {
        theBalanceMoneyString=[NSString stringWithFormat:@"%@",data[@"accountBalance"]];
        _keyongyue.text=[NSString stringWithFormat:@"可用余额￥%.2f",[data[@"accountBalance"] floatValue] ];
//        bankCard=[NSString stringWithFormat:@"可用余额￥%@",data[@"identity"]];;
         payPassword=[NSString stringWithFormat:@"%@",data[@"isSetupPayPassword"]];
        NSLog(@"%@",data);
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)downLoad23
{
//    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
//                                                                                    
//                                                                                    
//                                                                                    }];
//    
//    [HttpTool getWithBaseURL:kBaseURL  path:@"/user_center/get_account" params:paramDic success:^(id data) {
//        
//        // _yuyujine.text=[NSString stringWithFormat:@"%@",data[@"amount"]];;
//       
//       NSLog(@"%@",data);
//        
//    } failure:^(NSError *error) {
//        
//    } alertInfo:^(NSString *alertInfo) {
//        
//    }];
}
#pragma mark 移除通知
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
@end
