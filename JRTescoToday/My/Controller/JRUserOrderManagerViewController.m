//
//  JRUserOrderManagerViewController.m
//  JRTescoToday
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRUserOrderManagerViewController.h"
#import "JRNavScrollView.h"
#import "JRUserOrderManagerCell.h"
#import "JROrderDetailViewController.h"
#import "JRBusinessOrderCore.h"
#import "JRBusinessOrderModel.h"
#import "JRUserDefault.h"
#import "toEvaluateViewController.h"
#import "checkTheVolumeSizeViewController.h"
#import "noOrdersView.h"

#import "MJExtension.h"
//0待付款 1待消费 -3已取消 2待评价 3已完成
typedef NS_ENUM(NSInteger, Order_type) {
    Order_type_PendingPayment = 0,//待付款
    Order_type_PendingConsumed = 1,//待消费
    Order_type_HaveBeenCancelled = -3,//已取消
    Order_type_PendingEvaluated = 2,//待评价
    Order_type_Completed = 3, //已完成
    Order_type_ALL = 10, //全部

};

@interface JRUserOrderManagerViewController ()<JRNavScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArray;
/*
 *<# #>
 */
@property(copy,nonatomic)noOrdersView *noOderV;

/*
 *<# #>
 */
@property(assign,nonatomic)NSInteger selectIndex;


@end

@implementation JRUserOrderManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的订单";
    self.view.backgroundColor= [UIColor yellowColor];
    
    JRNavScrollView *navScrollView = [[JRNavScrollView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, 48)];
    navScrollView.delegate = self;
    NSArray *switchButtons = [[NSArray alloc] initWithObjects:@"全部",@"待消费",@"已取消",@"待评价",@"已完成",nil];
    [navScrollView setUp:switchButtons];
    [self.view addSubview:navScrollView];
    
    [self.view addSubview:self.tableView];
    [self clickSwitchPageWithTag:0];
}
-(noOrdersView *)noOderV{
    if (!_noOderV) {
        _noOderV    =[[noOrdersView alloc]init];
        _noOderV.alpha=0;
        [self.view addSubview:_noOderV];
        [_noOderV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.tableView.mas_top).offset(100);
            make.left.right.equalTo(self.tableView);
            make.height.equalTo(@40);
        }];
        
        
    }
    
    return _noOderV;
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

#pragma mark - 点击切换
- (void)clickSwitchPageWithTag:(NSInteger)tag {
    DLog(@"--------%ld",tag);
    self.selectIndex=tag;
    switch (tag) {
        case 0:{
            //全部
            [self downLoadDataWithStatus:Order_type_ALL];
        }
            break;
//        case :{
//            //待付款 Order_type_PendingPayment
////            [self downLoadDataWithStatus:Order_type_PendingPayment];
//        }
//            break;
        case 1:{
            //待消费  Order_type_PendingConsumed
            [self downLoadDataWithStatus:Order_type_PendingConsumed];
        }
            break;
        case 2:{
            //已取消 Order_type_HaveBeenCancelled
            [self downLoadDataWithStatus:Order_type_HaveBeenCancelled];
        }
            break;
        case 3:{
            //待评价 Order_type_PendingEvaluated
            [self downLoadDataWithStatus:Order_type_PendingEvaluated];
        }
            break;
        case 4:{
            //已完成 Order_type_Completed
            [self downLoadDataWithStatus:Order_type_Completed];
        }
            break;
            
        default:
            break;
    }
}
- (void)downLoadDataWithStatus:(NSInteger)status {
    
    [JRBusinessOrderCore queryBusinessOrderListWithType:status PageNum:1 AndPageSize:50 Successed:^(NSDictionary *data) {
        
        if (self.dataArray.count > 0) {
            [self.dataArray removeAllObjects];
        }
        for (NSDictionary *dict in data[@"list"]) {
            JRBusinessOrderModel *model = [JRBusinessOrderModel mj_objectWithKeyValues:dict];
            [self.dataArray addObject:model];
        
        }
        if (self.dataArray.count==0) {
            self.noOderV.alpha=1.f;
            
        }else{
            self.noOderV.alpha=0.f;
            
        }
            [self.tableView reloadData];
    } Faild:^(NSString *erro) {
        
    }];
    
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
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JRUserOrderManagerCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JRUserOrderManagerCell class])];
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 133;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    JRUserOrderManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JRUserOrderManagerCell class])];
    
    NSString *ID = @"QQFriendMessage";
    JRUserOrderManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JRUserOrderManagerCell" owner:nil options:nil] lastObject];
        //这里需要注意的是为什么是lastObject 应为该Xib中只有一个元素
    }
    cell.indexRow=indexPath.row;
    __weak typeof(self) weakSelf=self;
    cell.cancelTheOrderBlock = ^(NSInteger index) {
        [weakSelf cancelTheOrderNetWorking:index];
    };
    cell.evaluationOrQrCodeBlock = ^(NSString *typeString, NSInteger index) {//0 去评价 1 二维码支付
        [weakSelf evaluationOrQrCodeBlockWithType:typeString withIndex:index];
        
    };
   
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.dataArray.count > 0) {
        [cell setUpData:self.dataArray[indexPath.row] ];
    }
    return cell;
}

////0 去评价 1 二维码支付
-(void)evaluationOrQrCodeBlockWithType:(NSString *)type withIndex:(NSInteger)index{

       JRBusinessOrderModel *model=self.dataArray[index];
    
    if ([type isEqualToString:@"0"]) {
      
        toEvaluateViewController *toEvaluateVC=[[toEvaluateViewController alloc]init];
        toEvaluateVC.title=@"评价";
        toEvaluateVC.titleString=model.merchantName;
        toEvaluateVC.OrderAmountString=model.realAmount;
        toEvaluateVC.iconURLString=model.merchantImg;
        toEvaluateVC.OrderNo=model.orderCode;
        __weak typeof(self)  weakSelf=self;
        toEvaluateVC.EvaluateBlock = ^{
            [weakSelf clickSwitchPageWithTag:weakSelf.selectIndex];
        };
        [self.navigationController pushViewController:toEvaluateVC animated:YES];
    }else{
        checkTheVolumeSizeViewController *checkTheVolumeSizeVC=[[checkTheVolumeSizeViewController alloc]init];
            checkTheVolumeSizeVC.nameString=model.merchantName;
         checkTheVolumeSizeVC.timeString=model.goodsValidityTime;
        checkTheVolumeSizeVC.codeNoString=model.code;
        checkTheVolumeSizeVC.useCodeString=model.useCode;
        checkTheVolumeSizeVC.goodsID=model.ID;
        checkTheVolumeSizeVC.orderStaute=model.status;
        [self.navigationController pushViewController:checkTheVolumeSizeVC animated:YES];
        
        
    }
    
    
    
    
}
// 取消订单
-(void)cancelTheOrderNetWorking:(NSInteger)index{
    JRBusinessOrderModel*model =
    self.dataArray[index];
    
    
    
    

    
    
    NSURL *url =[NSURL URLWithString:[NSString stringWithFormat:@"%@/person/cancel_order/%@?access_token=%@",kBaseURL,model.orderCode,[JRUserDefault getTOKEN]]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"PUT";
    
//    request.allHTTPHeaderFields = @{@"access_token":[JRUserDefault getTOKEN]};//此处为请求头，类型为字典
    
//    NSString *msg = @"请求参数";
    
//    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    
//    request.HTTPBody = data;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
       
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if ([[NSString stringWithFormat:@"%@",dic[@"code"]] isEqualToString:@"5000"]) {
            model.status=@"-3";
            self.dataArray[index]=model;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSIndexPath *indexPath=[NSIndexPath indexPathForRow:index inSection:0];
                
                [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
                
//                self.tableView repl
//                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                         [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",dic[@"msg"]]];
            });

            
        }
        
       
        
    }] resume];
    
  
//    [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/person/cancel_order/%@",model.orderCode] params:paramDic success:^(id data) {
//        NSLog(@"%@",kBaseURL);
//
//
//
//
//
//
//
//    } failure:^(NSError *error) {
//
//    } alertInfo:^(NSString *alertInfo) {
//
//    }];
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    if (self.dataArray.count>indexPath.row-1) {
    if (self.dataArray.count>0) {
        
    
    
    JROrderDetailViewController *VC = [[JROrderDetailViewController alloc] init];
    JRBusinessOrderModel *model = self.dataArray[indexPath.row];
    VC.goodID = model.ID;
        [self.navigationController pushViewController:VC animated:YES];}
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.selectIndex<0) {
         [self clickSwitchPageWithTag:0];
    }else{
        [self clickSwitchPageWithTag:self.selectIndex];
        
    }
    
    
    
}



@end
