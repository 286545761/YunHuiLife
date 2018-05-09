//
//  JRActiveManagerViewController.m
//  JRTescoToday
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRActiveManagerViewController.h"
#import "JRNavScrollView.h"
//#import "JRActiveManagerCell.h"
#import "JRBusinessOrderCore.h"
#import "JRBusinessActivitiesModel.h"
#import "MJExtension.h"
@interface JRActiveManagerViewController ()<JRNavScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)JRBusinessActivitiesModel *model;
@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation JRActiveManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor groupTableViewBackgroundColor];
//    CGFloat heightF=0;
//    if(ScreenH==812){
//
//        heightF
//
//    }
    JRNavScrollView *navScrollView = [[JRNavScrollView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 48)];
    
    
    
    navScrollView.delegate = self;
    NSArray *switchButtons = [[NSArray alloc] initWithObjects:@"全部",@"待付款",@"已完成",nil];
    [navScrollView setUp:switchButtons];
    [self.view addSubview:navScrollView];
}
#pragma mark - 点击切换
- (void)clickSwitchPageWithTag:(NSInteger)tag {
    switch (tag) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        default:
            break;
    }
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 48, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 48-64) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
        _tableView.tableFooterView = footerView;
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260;
}

@end
