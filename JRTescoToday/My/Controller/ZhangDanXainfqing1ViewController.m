//
//  ZhangDanXainfqing1ViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ZhangDanXainfqing1ViewController.h"

@interface ZhangDanXainfqing1ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *zzong;
@property (weak, nonatomic) IBOutlet UILabel *jiayishuoming;
@property (weak, nonatomic) IBOutlet UILabel *duifangzhanghu;
@property (weak, nonatomic) IBOutlet UILabel *zhifufangshi;
@property (weak, nonatomic) IBOutlet UILabel *jiaoyishiajian;
@property (weak, nonatomic) IBOutlet UILabel *zhifudingdanhuo;
@property (weak, nonatomic) IBOutlet UILabel *sahngpindingdanhao;

@end

@implementation ZhangDanXainfqing1ViewController

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
        _jiayishuoming.text=[NSString stringWithFormat:@"%@",data[@"tradeRemark"]];
         _duifangzhanghu.text=[NSString stringWithFormat:@"%@",data[@"tradeAccountName"]];
         _zhifufangshi.text=[NSString stringWithFormat:@"%@",data[@"payType"]];
         _jiaoyishiajian.text=[NSString stringWithFormat:@"%@",data[@"tradeTime"]];
        _zhifudingdanhuo.text=[NSString stringWithFormat:@"%@",data[@"payOrderNo"]];
        _view21.hidden=NO;//goodsOrderNo
        _sahngpindingdanhao.text=[NSString stringWithFormat:@"%@",data[@"goodsOrderNo"]];;
         _zzong.text=[NSString stringWithFormat:@"-￥%@",data[@"tradeAmount"]];
        if ([[NSString stringWithFormat:@"%@",data[@"payOrderNo"]] isEqualToString:@"(null)"]) {
            //_view21.hidden=YES;
            _zhifudingdanhuo.hidden=YES;
        }
        else
        {
            _view21.hidden=YES;
                    }
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
