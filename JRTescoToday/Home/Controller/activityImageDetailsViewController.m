//
//  activityImageDetailsViewController.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/7.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "activityImageDetailsViewController.h"

@interface activityImageDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *imageScr;

@end

@implementation activityImageDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"活动详情";
    self.imageScr.contentSize=CGSizeMake(ScreenW, 1055);
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    
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

@end
