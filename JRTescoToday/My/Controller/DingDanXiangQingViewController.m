//
//  DingDanXiangQingViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "DingDanXiangQingViewController.h"

@interface DingDanXiangQingViewController ()
{
   UIAlertView *alert;
    NSString *string;
}
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *weizhi;
@property (weak, nonatomic) IBOutlet UIButton *dainhua;
@property (weak, nonatomic) IBOutlet UILabel *jiage;
@property (weak, nonatomic) IBOutlet UILabel *zhekoou;
@property (weak, nonatomic) IBOutlet UILabel *fujine;
@property (weak, nonatomic) IBOutlet UILabel *dingdanhao;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *tum;
@property (weak, nonatomic) IBOutlet UILabel *shouji;

@end

@implementation DingDanXiangQingViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
}
- (void)viewDidLoad {
    self.title=@"订单详情";
    [super viewDidLoad];
    if ([_idnm isEqualToString:@"sj"] ) {
        _name.hidden=YES;
        _weizhi.hidden=YES;
        _dainhua.hidden=YES;
        [self downLoad123];
        
    }else
    {
        _tum.hidden=YES;
        _shouji.hidden=YES;
        [self downLoad12];
    }
  
    // Do any additional setup after loading the view from its nib.
}


-(void)downLoad12
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],@"orderId":_idn,
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"/order/userOrderDetail" params:paramDic success:^(id data) {
        
        _name.text=[NSString stringWithFormat:@"%@",data[@"merchantName"]];
        [_weizhi setTitle:[NSString stringWithFormat:@"%@",data[@"merchantAddress"]] forState:UIControlStateNormal];
       // _weizhi.text=[NSString stringWithFormat:@"%@",data[@"merchantName"]];
        _jiage.text=[NSString stringWithFormat:@"￥%@",data[@"amount"]];
        _zhekoou.text=[NSString stringWithFormat:@"￥%@",data[@"discountAmount"]];
        _fujine.text=[NSString stringWithFormat:@"￥%@",data[@"realAmount"]];
        _dingdanhao.text=[NSString stringWithFormat:@"%@",data[@"orderCode"]];
        _time.text=[NSString stringWithFormat:@"%@",data[@"time"]];
  string=[NSString stringWithFormat:@"%@",data[@"merchantPhone"]];
   
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)downLoad123
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],@"orderId":_idn,
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"/order/merchantOrderDetail" params:paramDic success:^(id data) {
        
        //_name.text=[NSString stringWithFormat:@"%@",data[@"merchantName"]];
       // [_weizhi setTitle:[NSString stringWithFormat:@"%@",data[@"merchantAddress"]] forState:UIControlStateNormal];
        // _weizhi.text=[NSString stringWithFormat:@"%@",data[@"merchantName"]];
        _shouji.text=[NSString stringWithFormat:@"用户手机号：%@",data[@"userPhone"]];
        _jiage.text=[NSString stringWithFormat:@"￥%@",data[@"amount"]];
        _zhekoou.text=[NSString stringWithFormat:@"￥%@",data[@"discountAmount"]];
        _fujine.text=[NSString stringWithFormat:@"￥%@",data[@"realAmount"]];
        _dingdanhao.text=[NSString stringWithFormat:@"%@",data[@"orderCode"]];
        _time.text=[NSString stringWithFormat:@"%@",data[@"time"]];
        string=[NSString stringWithFormat:@"%@",data[@"merchantPhone"]];
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
- (IBAction)photo:(id)sender {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",string]]];

}
#pragma mark alertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (1 == buttonIndex) {
    
    }
    
    
    
    
}
@end
