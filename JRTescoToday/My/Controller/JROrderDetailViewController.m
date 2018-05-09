//
//  JROrderDetailViewController.m
//  JRTescoToday
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JROrderDetailViewController.h"
#import "JROrderDetailCell.h"
#import "JRBusinessOrderModel.h"
#import "JRBusinessOrderCore.h"
#import "MJExtension.h"
#import "MBProgressHUD+NJ.h"
#import "storeInformationTableViewCell.h"
#import "storeInformationStarShowTableViewCell.h"

static NSString *storeInfoCell=@"storeInformationTableViewCell";
static NSString *StarShowCell=@"storeInformationStarShowTableViewCell";

@interface JROrderDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)JRBusinessOrderModel *dataModel;
@end

@implementation JROrderDetailViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [JRBusinessOrderCore queryBusineesOrderDetailWithID:self.goodID Successed:^(NSDictionary *data) {
        _dataModel = [JRBusinessOrderModel mj_objectWithKeyValues:data];
        [self.tableView reloadData];
    } Faild:^(NSString *erro) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showError:erro];
        });
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"订单详情";
    [self.view addSubview:self.tableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self.view addSubview:self.tableView];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -64) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
        _tableView.tableFooterView = footerView;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JROrderDetailCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JROrderDetailCell class])];
        [_tableView registerClass:[storeInformationTableViewCell class] forCellReuseIdentifier:storeInfoCell];
        [_tableView registerClass:[storeInformationStarShowTableViewCell class] forCellReuseIdentifier:StarShowCell];
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    if (indexPath.section==0) {//390
        if ([self.dataModel.orderType integerValue] == 2) {
//            self.productDescriptionHeight.constant = 0;
//            self.productDescriptionView.hidden = YES;
//            self.volumeSizeLabel.hidden=YES;
//            self.volumeSizeLabelHeight.constant=0;
//            self.volumeSizeLabelTop.constant=0;
                  return 140;
        }
        //团购
        if ([self.dataModel.orderType integerValue] == 1) {
//            self.productDescriptionHeight.constant = 200;
//            self.productDescriptionView.hidden = NO;
//            self.volumeSizeLabel.hidden=NO;
//            self.volumeSizeLabelHeight.constant=40;
//            self.volumeSizeLabelTop.constant=10;
                      return 390;
        }

      
    }else if (indexPath.section==1){
        
        return 120;
    }
    return 40;

}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    
    return 10.f;
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [[UIView alloc]initWithFrame:CGRectZero];
    
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc]initWithFrame:CGRectZero];
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        
    
    JROrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JROrderDetailCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setUpData:self.dataModel];
        return cell;}
    
    else if(indexPath.section==1){
        
        storeInformationTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:storeInfoCell];
        
        __weak typeof(self) weakSelf=self;
        cell.phoneCallBlock = ^{
            [weakSelf callStroPhone];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model=self.dataModel;
        return cell;
        
        
    }
    storeInformationStarShowTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:StarShowCell];
    [cell makeWuJiaoXing:[self.dataModel.rating intValue]];
    
    return cell;
}

-(void)callStroPhone{
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",self.dataModel.merchantPhone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
    

    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#pragma mark - 数据
- (void)setUpData:(JRBusinessOrderModel *)model {
    _dataModel = model;
    [self.tableView reloadData];
}
@end
