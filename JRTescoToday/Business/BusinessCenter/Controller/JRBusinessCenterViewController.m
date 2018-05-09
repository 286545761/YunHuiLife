//
//  JRBusinessCenterViewController.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRBusinessCenterViewController.h"
#import "JRNavTabViewController.h"
#import "JRAllProductViewController.h"
#import "JRPendingShelvesViewController.h"
#import "JROnSchelvesViewController.h"
#import "JRPutOffSchelvesViewController.h"
#import "JRAddProductViewController.h"

#import "GQGesVCTransition.h"

#define UISIZE       [UIScreen mainScreen].bounds.size
#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]

@interface JRBusinessCenterViewController ()<JRNavTabDelegate>
@property (nonatomic, strong)JRNavTabViewController *tabBarVC;
@property (nonatomic, strong)JRAllProductViewController *allProductVC;
@property (nonatomic, strong)JRPendingShelvesViewController *pendingSchelvesVC;
@property (nonatomic, strong)JROnSchelvesViewController *onSchelvesVC;
@property (nonatomic, strong)JRPutOffSchelvesViewController *putOffSchelvesVC;

@property (nonatomic, strong)UIView *endAddView;
@end

@implementation JRBusinessCenterViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController enabledGQVCTransition:NO];

    self.navigationController.navigationBarHidden = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"商品管理";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    _allProductVC = [[JRAllProductViewController alloc] init];
    _allProductVC.title = @"全部";
    _pendingSchelvesVC = [[JRPendingShelvesViewController alloc] init];
    _pendingSchelvesVC.title = @"待上架";
    _onSchelvesVC = [[JROnSchelvesViewController alloc] init];
    _onSchelvesVC.title = @"已上架";
    _putOffSchelvesVC = [[JRPutOffSchelvesViewController alloc] init];
    _putOffSchelvesVC.title = @"已下架";
    
    NSArray * subViewControllers = @[_allProductVC,_pendingSchelvesVC,_onSchelvesVC, _putOffSchelvesVC];
    JRNavTabViewController *tabBarVC = [[JRNavTabViewController alloc] initWithSubViewControllers:subViewControllers];
    tabBarVC.subViewArr = subViewControllers;
    self.tabBarVC = tabBarVC;
    tabBarVC.view.frame = CGRectMake(0,65, UISIZE.width, UISIZE.height-65-49);
    tabBarVC.delegate = self;
    [self.view addSubview:tabBarVC.view];
    [self addChildViewController:tabBarVC];
    //
    [self.view addSubview:self.endAddView];
    
}
#pragma mark - navDelegate
- (void)clickButtonToVc:(NSInteger)tagNumber{
    if(tagNumber == 10000){
        [_allProductVC loadData];
    }
    if(tagNumber == 10001){
        [_pendingSchelvesVC loadData];
    }
    if(tagNumber == 10002){
        [_onSchelvesVC loadData];
    }
    if(tagNumber == 10003){
        [_putOffSchelvesVC loadData];
    }
}
- (UIView *)endAddView {
    if (!_endAddView) {
        _endAddView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49, [UIScreen mainScreen].bounds.size.width, 49)];
        UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _endAddView.frame.size.width, _endAddView.frame.size.height)];
        
        [addBtn setTitle:@"+添加新商品" forState:UIControlStateNormal];
        addBtn.backgroundColor = UIColorFromRGB_16(0xff4c60, 1);
        [addBtn addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
        [_endAddView addSubview:addBtn];
        _endAddView.hidden = NO;
    }
    return _endAddView;
}
- (void)clickAdd:(UIButton *)sender {
    JRAddProductViewController *addVC = [[JRAddProductViewController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
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
