//
//  ZhiFuChengGongViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/22.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ZhiFuChengGongViewController.h"
#import "MyPingJiaViewController.h"
#import "DHMainController.h"
#import "JRUserOrderManagerViewController.h"
#import "BusinessController.h"
@interface ZhiFuChengGongViewController ()

@end

@implementation ZhiFuChengGongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.title=@"支付成功";
    // Do any additional setup after loading the view from its nib.
    _dingdanhao.text=_dingdan;
    _jine.text=_qian;
    _zhifufangshi.text=_zhifubao;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)jixugouwu:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1111" object:nil];

    for (BusinessController *temp in self.navigationController.viewControllers) {
        if ([temp isKindOfClass:[BusinessController class]]) {
            [self.navigationController popToViewController:temp animated:YES];
        }
    }
    
    
//    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)chankandingdan:(id)sender {
    JRUserOrderManagerViewController *JRUserOM=[[JRUserOrderManagerViewController alloc]init];
//    MyPingJiaViewController *yew=[[MyPingJiaViewController alloc] init];
    [self.navigationController pushViewController:JRUserOM animated:YES];
    
    
    

}
    
    


@end
