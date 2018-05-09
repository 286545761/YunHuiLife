//
//  YinhangkaWeiViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/21.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "YinhangkaWeiViewController.h"
#import "ShiNameBngKaViewController.h"
#import "bangkaWeiView.h"
@interface YinhangkaWeiViewController ()
@property (weak, nonatomic) IBOutlet UIView *vieww1;
@property (weak, nonatomic) IBOutlet UILabel *vieww2;
@property (weak, nonatomic) IBOutlet UILabel *vieww3;

@end

@implementation YinhangkaWeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"银行卡管理";
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame=CGRectMake(kScreenSize.width-70, 10, 60, 60);
    [settingBtn addTarget:self action:@selector(enterTeamCard) forControlEvents:UIControlEventTouchUpInside];
   // [settingBtn setTitle:@"优惠规则" forState:UIControlStateNormal];
    settingBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useHipe) name:@"maketou1267" object:nil];
     [settingBtn setImage:[UIImage imageNamed:@"nav_btn_add"] forState:UIControlStateNormal];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];
    if (iPhone5) {
        bangkaWeiView *mak=[[bangkaWeiView alloc] init];
        _vieww1.hidden=YES;
        _vieww2.hidden=YES;
        _vieww3.hidden=YES;
        mak.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
        [self.view addSubview:mak];
    }
}
-(void)useHipe
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)enterTeamCard
{
    ShiNameBngKaViewController *shinamebangka=[[ShiNameBngKaViewController alloc ] init];
    [self.navigationController pushViewController:shinamebangka animated:YES];
}

@end
