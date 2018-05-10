//
//  AddShangPinController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "AddShangPinController.h"
#import "AddShangoinView.h"
#import "AddShangPinTableViewCell.h"
#import "AddFootView.h"
#import "XiaoXiView.h"
#import "XWInteractiveTransition.h"
#import "XWPresentOneTransition.h"
#import "Masonry.h"
#import "shurkuang.h"
#import "FenleiModel.h"
@interface AddShangPinController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) XWInteractiveTransition *interactiveDismiss;
@property (nonatomic, strong) XWInteractiveTransition *interactivePush;

@end

@implementation AddShangPinController
{
    UITableView *_mineTableView;
    AddShangPinTableViewCell*_cell;
    AddShangoinView *footView;
    AddFootView*iqq;
     UIView *makeView;
    NSMutableArray *_arrayid;
    NSInteger num;
     shurkuang *na;
    NSInteger rowNum;
    UIButton *AddNewBtn;
    UIButton*tupian;
    UIImage *image;
    int j;
    int i;
    UIButton *addFenLeibtn;
    UIButton *addQuXiao;
    UIButton *addFenLeibtn1;
    UIButton *addQuXiao1;
     NSInteger stringhh;
    NSString *idnn;
    NSString *name32;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"";
    _arrayid=[[NSMutableArray alloc] init];
    
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height/2+50) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_mineTableView];
    if ([_bianji isEqualToString:@"编辑"]) {
        idnn=_idnnn;
        name32=_name;
    }else
    {
        idnn=@"";
        name32=@"";

    }
    iqq=[[AddFootView alloc] init];
    _mineTableView.tableFooterView=iqq;
   //rowNum=11;
    [self makeUI];
    self.interactiveDismiss = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypeDismiss GestureDirection:XWInteractiveTransitionGestureDirectionDown];
    [self.interactiveDismiss addPanGestureForViewController:self];
    [self downLoad2];
    
}
#pragma mark
-(void)makeUI
{
   AddNewBtn =iqq.Add;
    [AddNewBtn addTarget:self action:@selector(AddBtn1) forControlEvents:UIControlEventTouchUpInside];
    addFenLeibtn1=iqq.quxaio;
     [addFenLeibtn1 addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    addQuXiao1=iqq.queding;
    [addQuXiao1 addTarget:self action:@selector(AddBtn12) forControlEvents:UIControlEventTouchUpInside];
    _interactivePush = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypePresent GestureDirection:XWInteractiveTransitionGestureDirectionUp];
//    [addQuXiao1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//        //make.top.equalTo(textView.mas_bottom).offset(20);
//    }];
     self.interactiveDismiss = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypeDismiss GestureDirection:XWInteractiveTransitionGestureDirectionDown];
//    tupian=footView.btntupian;
//    [tupian addTarget:self action:@selector(AddBtn) forControlEvents:UIControlEventTouchUpOutside];
    [self.interactiveDismiss addPanGestureForViewController:self];
    
}
-(void)AddBtn12
{
    
    [self.delegate FenLeiName:name32 andFenLeiId:idnn];
    if (_delegate && [_delegate respondsToSelector:@selector(presentedOneControllerPressedDissmiss)]) {
        [_delegate presentedOneControllerPressedDissmiss];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"AddShangPinTableViewCell" owner:self options:nil] lastObject];
    }
    _cell.tu.image=[UIImage imageNamed:@"icon_select1234"];
    FenleiModel *na12=[[FenleiModel alloc] init];
    na12=_arrayid[indexPath.row];
    if (stringhh==indexPath.row) {
        num=indexPath.row;
        idnn=na12.idn;
        name32=na12.name;
        _cell.tu.image=[UIImage imageNamed:@"btn_selected"];
    }
    
 
    FenleiModel *fen=[[FenleiModel alloc] init];
    fen=_arrayid[indexPath.row];
    _cell.name.text=fen.name;
    NSLog(@"%@",_arrayid);
    
    
    _cell.selectionStyle = UITableViewCellAccessoryNone;
    return _cell;
}
// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
    
}
#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayid.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    FenleiModel *na12=[[FenleiModel alloc] init];
    na12=_arrayid[indexPath.row];
    stringhh =indexPath.row;
    idnn=na12.idn;
    name32=na12.name;
    [_mineTableView reloadData];
}
-(void)AddBtn1
{
    makeView =[[UIView alloc] init];
    makeView.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    makeView.backgroundColor=[UIColor blackColor];
    makeView.alpha=0.3;
    [self.view addSubview:makeView];
    
    na=[[shurkuang alloc] init];
    na . layer.cornerRadius=10;
    na.viewww . layer.cornerRadius=10;
    na.backgroundColor=[UIColor whiteColor];
    
    addQuXiao=na.quxiao;
    addQuXiao.tag=1002;
    [addQuXiao addTarget:self action:@selector(btnnn:) forControlEvents:UIControlEventTouchUpInside];

    addFenLeibtn=na.Queding;
    addFenLeibtn.tag=1001;
    [addFenLeibtn addTarget:self action:@selector(btnnn:) forControlEvents:UIControlEventTouchUpInside];
    na.frame=CGRectMake(30, 50, kScreenSize.width-60, 166);
    [self.view addSubview:na];

}
-(void)btnnn:(UIButton *)btn
{
    if (btn.tag==1001)
    {
        [self downLoad1];
        [makeView removeFromSuperview];
        [na removeFromSuperview];
    }else
    {
        [makeView removeFromSuperview];
        [na removeFromSuperview];
    }
}
-(void)downLoad1
{
    
    if ([na.leiBieText.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"分类名不能为空"];
        return;
    }
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"name":na.leiBieText.text,
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@goods/createMerchant?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        NSLog(@"%@",dict);
        //5.回到主线程,进行更新页面
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
            {
                [MBProgressHUD showError:@"添加成功"];
                [_arrayid removeAllObjects];
                [self downLoad2];
            }
            else
            {
                [MBProgressHUD showError:dict[@"msg"]];
            }
        });
        
        
        
        
        
        
    }];
    
    
}
-(void)downLoad2
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    NSMutableArray *marray=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"goods/findCategory" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data) {
            FenleiModel *fen=[[FenleiModel alloc] initWithDict:dict];
            [marray addObject:fen];
        }
        
       
        [_arrayid addObjectsFromArray:marray];
      
      
       
        if (_arrayid.count==0) {
          
            _mineTableView.backgroundColor=[UIColor  whiteColor];
            _mineTableView.alpha=0.5;
            
        }
        else
        {
            FenleiModel *fen1=[[FenleiModel alloc] init];
            fen1=_arrayid[0];
            idnn=fen1.idn;
            name32=fen1.name;
        }
        [_mineTableView reloadData];
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}

- (void)dismiss{
    if (_delegate && [_delegate respondsToSelector:@selector(presentedOneControllerPressedDissmiss)]) {
        [_delegate presentedOneControllerPressedDissmiss];
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [XWPresentOneTransition transitionWithTransitionType:XWPresentOneTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [XWPresentOneTransition transitionWithTransitionType:XWPresentOneTransitionTypeDismiss];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return _interactiveDismiss.interation ? _interactiveDismiss : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    XWInteractiveTransition *interactivePresent = [_delegate interactiveTransitionForPresent];
    return interactivePresent.interation ? interactivePresent : nil;
}
@end
