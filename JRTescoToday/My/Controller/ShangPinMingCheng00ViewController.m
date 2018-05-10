//
//  ShangPinMingCheng00ViewController.m
//  JRTescoToday
//
//  Created by 123 on 2018/1/29.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShangPinMingCheng00ViewController.h"
#import "ShangPinMingChengView.h"
#import "UIImageView+WebCache.h"
#import "ConsumptionController.h"
#import "JRBusinessActivitiesCore.h"
@interface ShangPinMingCheng00ViewController ()
{
    UIButton*byun;
     UIButton*byun1;
     UIButton*byun2;
    int i;
    ShangPinMingChengView *shang;
    NSString *theFinalPriceString;// 打折后的价格
    NSString *preferentialPriceString;//优惠价格
    NSString *originalPriceString;//原价
}
@end

@implementation ShangPinMingCheng00ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"提交订单";
    i=1;
//    [self storeActivity];
    [self downLoad];
    [self loadtheDiscountPrice:@"-1"];
    
    
    
    // Do any additional setup after loading the view from its nib.
}
// 加载打折后的价格
-(void)loadtheDiscountPrice:(NSString*)price{

    NSString *pathString;

    if ([price isEqualToString:@"-1"]) {
         pathString=[NSString stringWithFormat:@"merchants/activity/optimal/%@?amount=%@",_theStoreNewID,_strbtn2];
            originalPriceString=_strbtn2;
    }else{
      pathString=[NSString stringWithFormat:@"merchants/activity/optimal/%@?amount=%@",_theStoreNewID,price];
            originalPriceString=price;
    }
    
   
    [HttpTool getWithBaseURL:kBaseURL  path:pathString params:nil success:^(id data) {
        theFinalPriceString=[NSString stringWithFormat:@"%@",data];
//        preferentialPriceString=[NSString stringWithFormat:@"%@"]
        shang.qian12.text=[NSString stringWithFormat:@"¥%@",theFinalPriceString];
        if ([price isEqualToString:@"-1"]) {
            shang.zhe.text=[NSString stringWithFormat:@"-¥%ld",[_strbtn2 integerValue]-[theFinalPriceString integerValue]];
        }else{
            shang.zhe.text=[NSString stringWithFormat:@"-¥%ld",[price integerValue]-[theFinalPriceString integerValue]];
        }
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
    
    
}

//获取当前商家的活动列表
-(void)setAcModel:(activityModel *)acModel{
    
    
    _acModel=acModel;
}
-(void)storeActivity{


}

-(void)downLoad
{
    
    
    
    
    
    
    
    
    NSNumber *amountNumber=@1;
    if ([shang.qian.text integerValue]>1) {
        amountNumber=@([shang.qian.text integerValue]);
    }
    [self loadtheDiscountPrice: [ NSString stringWithFormat:@"%f", [_strbtn2 floatValue] *i]];
    

        self.view.frame=CGRectMake(0, 0,kScreenSize.width, kScreenSize.height);
        shang=[[ShangPinMingChengView alloc] init];
    shang.model=self.acModel;
        shang.name.text=_strbtn3;
        shang.qian.text= [ NSString stringWithFormat:@"¥%@", _strbtn2];
         shang.qian12.text= [ NSString stringWithFormat:@"¥%@", _strbtn2];
       [ shang.tuxiang sd_setImageWithURL:[NSURL URLWithString:_strbtn1] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
        byun=shang.jia;
        [byun addTarget:self action:@selector(Userqqqqqqq) forControlEvents:UIControlEventTouchUpInside];
        byun1=shang.jian;

        [byun1 addTarget:self action:@selector(Userqqqqqqq1) forControlEvents:UIControlEventTouchUpInside];
        byun2=shang.tiaojiaodingdan;

        [byun2 addTarget:self action:@selector(Userqqqqqqq2) forControlEvents:UIControlEventTouchUpInside];
        shang.frame=CGRectMake(0,64,kScreenSize.width, kScreenSize.height);
        [self.view addSubview:shang];
//        NSLog(@"sssss%@",data);
//
//    } failure:^(NSError *error) {
//
//    } alertInfo:^(NSString *alertInfo) {
//
//    }];
}
-(void)Userqqqqqqq
{
    if (i>=999) {
        return;
    }
    i++;
    shang.geshu.text=[NSString  stringWithFormat:@"%d",i];
    [self loadtheDiscountPrice: [ NSString stringWithFormat:@"%.2f", [_strbtn2 floatValue] *i]];
}
-(void)Userqqqqqqq1
{
    if (i<=1) {
        return;
    }
    i--;
    shang.geshu.text=[NSString  stringWithFormat:@"%d",i];
//    shang.qian.text= [ NSString stringWithFormat:@"%d", [_strbtn2 intValue] *i];
//    shang.qian.backgroundColor=[UIColor yellowColor];
//     shang.qian12.text= [ NSString stringWithFormat:@"%d", [_strbtn2 intValue] *i];
//      shang.qian12.backgroundColor=[UIColor redColor];
    [self loadtheDiscountPrice: [ NSString stringWithFormat:@"%.2f", [_strbtn2 floatValue] *i]];
    
}
-(void)Userqqqqqqq2
{
    
    
//     最新的一次
//        amount (number): 支付金额 ,
//        goodsCount (integer): 团购数量 ,
//        goodsId (string): 团购商品ID ,
//        merchantCode (string): 商铺编码 ,
//        oamount (number): 原价 ,
//        orderType (integer): 1团购2优惠买单 ,
    


    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                   @"amount":theFinalPriceString,
                                                                   @"goodsCount":[NSString stringWithFormat:@"%d",i],
                                                                   @"goodsId":_strbtn,                       @"merchantCode":self.theStoreID,                                @"oamount":originalPriceString,
                                        @"orderType":@"2"
                                            }];
        
        
//    }
        
        
        
    
    
    
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json"};
    

        [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"提交订单中...."];
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@merchants/orders?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
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
        
        [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            // [MBProgressHUD showError:dict[@"msg"]];
            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
            {
                ConsumptionController *na=[[ConsumptionController alloc] init];
                na.cgBUS= _strbtn;
                //    na.zhekou123=szhekou;
                na.theNumber=[NSString stringWithFormat:@"%d",i];
                na.title=@"云惠付";
                na.theOrderNumberString=[NSString stringWithFormat:@"%@",dict[@"data"][@"orderCode"]];
                na.nnnnn=theFinalPriceString;
                na.theStoreID=_theStoreID;
                na.theOriginalPrice=originalPriceString;
                na.OrderType=@"2";
                [self.navigationController pushViewController:na animated:YES];
                
            }else{
                  [MBProgressHUD showError:dict[@"msg"]];
                
                
            }
            }
                      );
        
  
        
        
     
        
    }];
    
    

    
 
}
@end
