//
//  zhifushibaixxViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/22.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "zhifushibaixxViewController.h"
#import "DHMainController.h"
@interface zhifushibaixxViewController ()

@end

@implementation zhifushibaixxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"支付失败";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 if ([[FNUserDefaults objectForKey:@"panduanio"] isEqualToString:@"3"] ) {
 if ([[FNUserDefaults objectForKey:@"guimijihua"] isEqualToString:@"1"] ) {
 i=2;
 }
 else
 {
 i=0;
 }
 
 }
 else
 {
 if ([[FNUserDefaults objectForKey:@"touziyemian"] isEqualToString:@"1"] ) {
 i=1;
 }
 else
 {
 i=0;
 }
 }

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)congxinzhifu:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)gerenzhongxin:(id)sender {
      [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1111" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
// [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"SET_HAND_PWD1111" object:nil];
   
    //[NSNotificationCenter defaultCenter] addObserver:self selector:@se name:<#(nullable NSNotificationName)#> object:<#(nullable id)#>

    
}

@end
