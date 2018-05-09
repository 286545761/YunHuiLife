//
//  JROrderManagerViewController.m
//  JRTescoToday
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JROrderManagerViewController.h"
#import "JRUserOrderManagerViewController.h"
#import "JRActiveManagerViewController.h"
#import "UIViewController+BaseMethods.h"
#define UISIZE [UIScreen mainScreen].bounds.size

@interface JROrderManagerViewController ()
@property (nonatomic, strong) UILabel *startLabel;
@property (nonatomic, strong) UILabel *endLabel;
@property (nonatomic, strong) UIScrollView *switchScrollView;
@end

@implementation JROrderManagerViewController
-(void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBarHidden=NO;
//    [self setNavgationBackgroundColor:RGB(255, 199, 46) andTitleColor:[UIColor blackColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"我的订单";
   // [self addUISegementedControl];
    [self addSwitchScrollView];
}


#pragma mark - changePage
- (void)changePage:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            _switchScrollView.contentOffset = CGPointMake(0, 0);
            break;
        case 1:
            _switchScrollView.contentOffset = CGPointMake(UISIZE.width, 0);
            break;
        default:
            break;
    }
}

- (void)addUISegementedControl {
    UIView *titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(0, 0,UISIZE.width, 32);
    NSArray *titleArr = [NSArray arrayWithObjects:@"用户订单", nil];
    UISegmentedControl *segement = [[UISegmentedControl alloc] initWithItems:titleArr];
    segement.frame = CGRectMake(0, 0,200,32);
    segement.center = CGPointMake(titleView.center.x-70, titleView.center.y);
    segement.tintColor = [UIColor clearColor];
    //
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f]};
    NSDictionary *attributeSelect = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17.0f]};
    
    [segement setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [segement setTitleTextAttributes:attributeSelect forState:UIControlStateSelected];
    //
    segement.selectedSegmentIndex = 0;
    [segement addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [titleView addSubview:segement];
    self.navigationItem.titleView = titleView;
    
}
- (void)addSwitchScrollView {
    _switchScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, UISIZE.width, UISIZE.height-64)];
    _switchScrollView.contentOffset = CGPointMake(0, 0);
    _switchScrollView.contentSize = CGSizeMake(UISIZE.width* 2, UISIZE.height-64);
    _switchScrollView.pagingEnabled = YES;
    _switchScrollView.bounces = NO;
    _switchScrollView.showsHorizontalScrollIndicator = NO;
    _switchScrollView.showsVerticalScrollIndicator = NO;
    _switchScrollView.scrollEnabled = NO;
    [self.view addSubview:_switchScrollView];
    //
    JRUserOrderManagerViewController *userOrderManger = [[JRUserOrderManagerViewController alloc] init];
    
    CGFloat heightY=0;
//    CGFloat heightH=UISIZE.height
    if (ScreenH==812) {
        heightY=24;
    }
    
    
    userOrderManger.view.frame = CGRectMake(0, heightY, UISIZE.width, UISIZE.height-heightY);
    [self addChildViewController:userOrderManger];
    [_switchScrollView addSubview:userOrderManger.view];
    //
    JRActiveManagerViewController *activeOrderManger = [[JRActiveManagerViewController alloc] init];
    activeOrderManger.view.frame = CGRectMake(UISIZE.width, 0, UISIZE.width, UISIZE.height);
    [self addChildViewController:activeOrderManger];
    
    [_switchScrollView addSubview:activeOrderManger.view];
    
}


@end
