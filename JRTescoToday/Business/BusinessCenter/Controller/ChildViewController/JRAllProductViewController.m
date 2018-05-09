//
//  JRAllProductViewController.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRAllProductViewController.h"
#import "JRProductManageCell.h"
#import "MJExtension.h"
#import "JRBusinessCenterCore.h"
#import "JRManagerProductModel.h"
#import "MBProgressHUD+NJ.h"
#import "JRAddProductViewController.h"
#import "JREditProductModel.h"
#import "JREditProductTagModel.h"
#import "JREditProductViewController.h"
#import "JREditProductTagModel.h"
#import "JRProductMangerCellLayOut.h"
#import "MJRefresh.h"
@interface JRAllProductViewController () <UITableViewDelegate, UITableViewDataSource,JRProductManageCellDelegate, UIAlertViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, assign)NSInteger allPages;
@property (nonatomic, strong)JREditProductModel *editModel;
@end

@implementation JRAllProductViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.page = 1;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 65-49-44) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JRProductManageCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JRProductManageCell class])];

    [self.view addSubview:self.tableView];
    [self loadData];
    [self add_MJRefresh];
}

- (void)add_MJRefresh {
    __weak typeof(self) weakSelf = self;

  MJRefreshNormalHeader *freshHeader =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
      weakSelf.page = 1;
      [weakSelf loadData];
    }];
    weakSelf.tableView.header = freshHeader;
    
    MJRefreshAutoNormalFooter *freshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        if (weakSelf.page <= weakSelf.allPages) {
            [weakSelf loadData];
        } else {
            [weakSelf.tableView.footer endRefreshing];
        }
    }];
    self.tableView.footer = freshFooter;
}

- (void)simulatorData {
    for (NSInteger i = 0; i < 20; i++) {
        JRManagerProductModel *model = [[JRManagerProductModel alloc] init];
        NSArray *tagArr = @[@"dhfdkjhfkdjhfd",@"fhjdkafh",@"fhdkafkjad",@"dhfdkjhfkdjhfd",@"fhjdkafh",@"fhdkafkjad",@"dhfdkjhfkdjhfd",@"fhjdkafh"];
        if (model.goodsLabels.count) [model.goodsLabels removeAllObjects];
        
        for (NSInteger j = 0; j < tagArr.count; j++) {
            JREditProductTagModel *tagModel = [[JREditProductTagModel alloc] init];
            tagModel.content = tagArr[j];
            [model.goodsLabels addObject:tagModel];
        }
        [self.dataArr addObject:model];
    }
    for (JRManagerProductModel *model in self.dataArr) {
        model.tagViewMaxHeight = [JRProductMangerCellLayOut layout_caculaterCellHeightWith:model];
        model.tagViewMaxWidth = [JRProductMangerCellLayOut layout_caculaterViewHeightWith:model];
        model.cellMaxHeight = [JRProductMangerCellLayOut layout_caculaterCellHeightWith:model];
    }
    [self.tableView reloadData];

}

//+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view withRect:(CGRect)rect animated:(BOOL)animated {
//    NSAssert(view, @"View must not be nil.");
//    MBProgressHUD *hud = [[self alloc] initWithFrame:rect];
//    [view addSubview:hud];
//    [hud show:animated];
//    return MB_AUTORELEASE(hud);
//}

#pragma mark - 数据处理
- (void)loadData {

    NSString *token = [FNUserDefaults objectForKey:@"usersid"];
    [JRBusinessCenterCore query_requestBusinessManagerWithToken:token type:@"0" pageNum:[NSString stringWithFormat:@"%ld",self.page] pageSize:nil Successed:^(NSDictionary *data) {
        //总页数
        self.allPages = [data[@"pages"] integerValue];
        
        NSArray *managerAllProduct = data[@"list"];
        if (self.page == 1) {
            if (self.dataArr.count) {
                [self.dataArr removeAllObjects];
            }
        }
        for (NSDictionary *dict in managerAllProduct) {
            JRManagerProductModel *model = [JRManagerProductModel mj_objectWithKeyValues:dict];
            if (model.goodsLabels.count) {
                [model.goodsLabels removeAllObjects];
            }
            for (NSDictionary *tagDict in dict[@"goodsLabels"]) {
                JREditProductTagModel *tagModel = [JREditProductTagModel mj_objectWithKeyValues:tagDict];
                [model.goodsLabels addObject:tagModel];
            }
            [self.dataArr addObject:model];
        }
        for (JRManagerProductModel *model in self.dataArr) {
            model.tagViewMaxHeight = [JRProductMangerCellLayOut layout_caculaterCellHeightWith:model];
            model.tagViewMaxWidth = [JRProductMangerCellLayOut layout_caculaterViewHeightWith:model];
            model.cellMaxHeight = [JRProductMangerCellLayOut layout_caculaterCellHeightWith:model];
        }
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        [self.tableView reloadData];
    } failed:^(NSString *erro) {
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        if (erro.length) [MBProgressHUD showError:erro toView:nil];

    }];
}
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}
#pragma mark - UI
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataArr.count) {
        return self.dataArr.count;
    } else {
        return 0;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArr.count) {
        JRManagerProductModel *model = _dataArr[indexPath.section];
        return model.cellMaxHeight;
    } else {
        return 0;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.dataArr.count) return nil;
    static NSString *cellID = @"JRProductManageCell";
    JRProductManageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell == nil) {
        cell =  [[[NSBundle mainBundle] loadNibNamed:cellID owner:self options:nil] lastObject];
    } else {
        [cell removeAllFuYong];
    }
    JRManagerProductModel *model = self.dataArr[indexPath.section];
    [cell loadData:model andType:indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - JRProductManageCellDelegate
- (void)managerProductPending:(NSString *)ID {
    NSLog(@"正在审核-------------------%@",ID);
}
- (void)managerProductEdit:(NSString *)ID {
    NSLog(@"编辑-------------------%@",ID);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    [JRBusinessCenterCore query_requestBussinessProductDetailInforWithID:ID Successed:^(NSDictionary *data) {
       
        NSDictionary *dict = data;
        JREditProductModel *model = [JREditProductModel mj_objectWithKeyValues:dict];
        if (model.goodsLabels.count) {
            [model.goodsLabels removeAllObjects];
        }
        for (NSDictionary *tagDict in dict[@"goodsLabels"]) {
            JREditProductTagModel *tag = [JREditProductTagModel mj_objectWithKeyValues:tagDict];
            [model.goodsLabels addObject:tag];
        }
        JREditProductViewController *editVC = [[JREditProductViewController alloc] init];
        editVC.productID = ID;
        [editVC giveModel:model];
        [self.navigationController pushViewController:editVC animated:YES];
        [hud hideAnimated:NO];
    } failed:^(NSString *erro) {
        [hud hideAnimated:NO];

    }];
    
}
- (void)managerProductOffSchelve:(NSString *)ID {
    NSLog(@"下架-------------------%@",ID);
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"usersid"];
    [JRBusinessCenterCore uploadBusinessMangerProductWithToken:token productID:ID type:@"-1" Successed:^(NSDictionary *data) {
        NSInteger index = 0;
        for (NSInteger i = 0; i < self.dataArr.count; i++) {
            JRManagerProductModel *model = self.dataArr[i];
            if ([model.ID isEqualToString:ID]) {
                index = i;
            }
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:index];
        [self.dataArr removeObjectAtIndex:(NSUInteger)index];
        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
    } failed:^(NSString *erro) {
        [MBProgressHUD showError:erro toView:nil];
    }];

}
//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"usersid"];
        [JRBusinessCenterCore uploadBusinessMangerProductWithToken:token productID:[NSString stringWithFormat:@"%ld",alertView.tag] type:@"-2" Successed:^(NSDictionary *data) {
            NSLog(@"删除-------------------成功");
            NSInteger index = 0;
            for (NSInteger i = 0; i < self.dataArr.count; i++) {
                JRManagerProductModel *model = self.dataArr[i];
                if ([model.ID isEqualToString:[NSString stringWithFormat:@"%ld",alertView.tag]]) {
                    index = i;
                }
            }
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:index];
            [self.dataArr removeObjectAtIndex:(NSUInteger)index];
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
        } failed:^(NSString *erro) {
            [MBProgressHUD showError:erro toView:nil];
        }];
    }
}
- (void)managerProductDelete:(NSString *)ID {
    NSLog(@"删除-------------------%@",ID);
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"确定是否删除该商品" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alter.tag = [ID integerValue];
    [alter show];
 
}
- (void)managerProductRelease:(NSString *)ID {
    NSLog(@"上架-------------------%@",ID);
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"usersid"];
    [JRBusinessCenterCore uploadBusinessMangerProductWithToken:token productID:ID type:@"1" Successed:^(NSDictionary *data) {
        self.page = 1;
        [self loadData];
        
    } failed:^(NSString *erro) {
        [MBProgressHUD showError:erro toView:nil];
    }];

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
