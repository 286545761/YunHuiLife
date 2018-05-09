//
//  ZhangDanXaingQing2ViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ZhangDanXaingQing2ViewController.h"

@interface ZhangDanXaingQing2ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *zzong;
@property (weak, nonatomic) IBOutlet UILabel *jiaoyishuoming;
@property (weak, nonatomic) IBOutlet UILabel *duifangzhanghu;
@property (weak, nonatomic) IBOutlet UILabel *jiaoyishijian;
@property (weak, nonatomic) IBOutlet UILabel *zhifudingdanhao;

@end

@implementation ZhangDanXaingQing2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad]; self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    [self downLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    
    
    
    [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/wallet/bills/%@",_idn] params:paramDic success:^(id data) {
        _jiaoyishuoming.text=[NSString stringWithFormat:@"%@",data[@"tradeRemark"]];
        _duifangzhanghu.text=[NSString stringWithFormat:@"%@",data[@"tradeAccountName"]];
       
        _jiaoyishijian.text=[NSString stringWithFormat:@"%@",data[@"tradeTime"]];
        _zhifudingdanhao.text=[NSString stringWithFormat:@"%@",data[@"payOrderNo"]];
        _zzong.text=[NSString stringWithFormat:@"+￥%@",data[@"tradeAmount"]];
        //         _jiayishuoming.text=[NSString stringWithFormat:@"%@",data[@""]];
        //         _jiayishuoming.text=[NSString stringWithFormat:@"%@",data[@""]];
        //         _jiayishuoming.text=[NSString stringWithFormat:@"%@",data[@""]];
        //         _jiayishuoming.text=[NSString stringWithFormat:@"%@",data[@""]];
        NSLog(@"%@",data);
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}



@end
