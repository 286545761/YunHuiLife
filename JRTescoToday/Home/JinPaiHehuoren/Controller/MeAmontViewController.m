//
//  MeAmontViewController.m
//  DHInvestment
//
//  Created by Andy on 16/8/28.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "MeAmontViewController.h"
#import "AmontView.h"
#import "MeAmontTableViewCell.h"
//#import "DHAvailbalanceController.h"
//#import "FNCurrentAccountController.h"
//#import "MeTiViewController.h"
#import "UserAccount.h"
//#import "HouAmontModel.h"
#import "MuTableViewCell.h"
//#import "FNWelfareCashController.h"
//#import "ProjectDetailsController.h"
#import "MuTableViewCell.h"
#import "WanTableViewCell.h"
#import "MuAmontModel.h"
#import "WanAmontModel.h"
#import "UIBarButtonItem+DH.h"
//#import "HeTongViewController.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
#import "ChanPingXiangQing12ViewController.h"
#import "MeAmonModel.h"
#import "ZhangDanController.h"
@interface MeAmontViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *amontTableView;
    UIView *switchView;
    UIButton *switchBtn;
     UIButton *switchBtn1;
    UIButton *switchBtn2;
    UIView *lineView;
    AmontView *amont;
    UIButton *dingDingBtn;
    UIButton *sheYuBtn;
    UIButton *huoQiBtn;
    UIButton *tiYanBtn;
    int statut;
    NSString *balance;
    NSString *currentInvestment;
    NSString *experienceGoldIncome;
    NSString *fixedAssets;
    NSMutableArray *listArray;
    int pageNum;
    MeAmonModel *model;
    int total;
    NSString *mau;
    MeAmontTableViewCell*cell;
    NSMutableArray *_totalDataMuarray;
      NSMutableArray *_totalDataMuarray1;
      NSMutableArray *_totalDataMuarray2;
    NSString *stringMu;
    NSMutableArray *marray;
}
@end

@implementation MeAmontViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
  // self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"huijiaofanhui"higlightedImage:nil target:self action:@selector(back)];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"合伙产品金额";
    stringMu=@"1";
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame=CGRectMake(kScreenSize.width-70, 10, 60, 60);
    [settingBtn addTarget:self action:@selector(enterTeamCard) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setTitle:@"账单" forState:UIControlStateNormal];
    [settingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   // settingBtn.backgroundColor=[UIColor blackColor];
    settingBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    // [settingBtn setImage:[UIImage imageNamed:@"nav_btn_share"] forState:UIControlStateNormal];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];

    UIView *viewimage=[[UIView alloc] init];
        amontTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height-64) style:UITableViewStylePlain];
        amontTableView.delegate=self;
        amontTableView.dataSource=self;
        [self.view addSubview:amontTableView];
        amont=[[AmontView alloc] init];
      amontTableView.separatorStyle=NO;
     _totalDataMuarray=[[NSMutableArray alloc] init];
    _totalDataMuarray1=[[NSMutableArray alloc] init];
    _totalDataMuarray2=[[NSMutableArray alloc] init];
        amont.frame=CGRectMake(0, 0, SCREEN_SIZE.width, 250);
        amontTableView.tableHeaderView=amont;
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"tokenRenZheng234" object:nil];
       sheYuBtn=amont.yueBtn;
       [sheYuBtn addTarget:self action:@selector(annontBtn:) forControlEvents:UIControlEventTouchUpInside];
       sheYuBtn.tag=3001;
       huoQiBtn=amont.huoQiBtn;
       [huoQiBtn addTarget:self action:@selector(annontBtn:) forControlEvents:UIControlEventTouchUpInside];
       huoQiBtn.tag=3002;
    pageNum=1;
    mau=@"1";
       tiYanBtn=amont.tiyanJinBtn;
       [tiYanBtn addTarget:self action:@selector(annontBtn:) forControlEvents:UIControlEventTouchUpInside];
        tiYanBtn.tag=3003;
        switchView=[[UIView alloc] init];
        switchView.backgroundColor=[UIColor whiteColor];
        switchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [switchBtn setTitle:@"合伙中"forState:UIControlStateNormal];
        switchBtn.tag=2000;
        switchBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        switchBtn.titleLabel.textColor=[UIColor colorWithHexString:BunRed];
        [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
        [switchBtn addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
        switchBtn.frame=CGRectMake(0,10, kScreenSize.width/2 ,  50);
        [switchView addSubview:switchBtn];
    
//        switchBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
//        [switchBtn1 setTitle:@"募集中"forState:UIControlStateNormal];
//        switchBtn1.tag=2001;
//        switchBtn1.titleLabel.font=[UIFont systemFontOfSize:15];
//        [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
//        [switchBtn1 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
//        switchBtn1.frame=CGRectMake( kScreenSize.width/2,0, kScreenSize.width/2 ,50 );
//        [switchView addSubview:switchBtn1];
    
        switchBtn2=[UIButton buttonWithType:UIButtonTypeCustom];
        [switchBtn2 setTitle:@"已完结"forState:UIControlStateNormal];
        switchBtn2.tag=2001;
        switchBtn2.titleLabel.font=[UIFont systemFontOfSize:15];
        [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
        [switchBtn2 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
        switchBtn2.frame=CGRectMake(kScreenSize.width/2,10, kScreenSize.width/2 ,50 );
     viewimage.frame=CGRectMake(0, 0, kScreenSize.width, 10);
    viewimage.backgroundColor=[UIColor colorWithHexString:@"f5f5f9"];
    [switchView addSubview:viewimage];
        [switchView addSubview:switchBtn2];
    
    
        switchBtn.selected=YES;
        lineView=[[UIView alloc] init];
        switchView.frame=CGRectMake(0,190, kScreenSize.width , 60);
        lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame), switchBtn.frame.size.width, 1);
        lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
        [switchView addSubview:lineView];
        [amont addSubview:switchView];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    amontTableView.header = header;
    
    // 上拉
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
    amontTableView.footer = footer;

     [self downLoad];

}
-(void)enterTeamCard
{
    ZhangDanController *nam=[[ZhangDanController alloc] init];
    [self.navigationController pushViewController:nam animated:YES];

}
-(void)switchButton:(UIButton *)btn
{
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
        if (btn.tag==2000) {
             pageNum = 1;
            statut=1;
            
            [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
            [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            mau=@"1";
            [self downLoad];
           //[amontTableView reloadData];
        }
        else if(btn.tag==2001)
        {
            statut=2;
            pageNum = 1;
            
            [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn1 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
            switchBtn1.selected=YES;
            switchBtn.selected=NO;
            switchBtn2.selected=NO;
            mau=@"2";
             [self downLoad1];
           // [cell removeFromSuperview];
          
    
            
        }else
        {
              pageNum = 1;
             statut=3;
            
            [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn2 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
            switchBtn2.selected=YES;
            switchBtn.selected=NO;
            switchBtn1.selected=NO;
            mau=@"1";
             //[self download1];
           // [amontTableView reloadData];
        }
        [UIView animateWithDuration:0.3 animations:^{
            lineView.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame), switchBtn.frame.size.width, 1);
        }];
      //[amontTableView reloadData];
  
}
-(void)annontBtn:(UIButton *)btn
{
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    if (btn.tag==3001) {
       // DHAvailbalanceController *availblance=[[DHAvailbalanceController alloc ] init];
        //[self.navigationController pushViewController:availblance animated:YES];
    }else if(btn.tag==3002)
    {
        //FNCurrentAccountController* currentAccountController = [[FNCurrentAccountController alloc]init];
        //[self.navigationController pushViewController:currentAccountController animated:YES];
    }else
    {
        NSLog(@"体验金");
        
      // MeTiViewController*welfareCashController = [[MeTiViewController alloc]init];
       //[self.navigationController pushViewController:welfareCashController animated:YES];
    }
}
#pragma mark 切换

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([mau isEqualToString:@"1"]) {
        static NSString *cellName=@"cell";
        cell=[tableView dequeueReusableCellWithIdentifier:cellName];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"MeAmontTableViewCell" owner:self options:nil] lastObject];
        }
         cell.selectionStyle = UITableViewCellAccessoryNone;
        if (_totalDataMuarray.count>0) {
        MeAmonModel *hom=[[MeAmonModel alloc] init];
        hom=_totalDataMuarray[indexPath.row];
             cell.xiangQingBtn.tag=indexPath.row;
           
        cell.DaoQitimeText.text=[NSString stringWithFormat:@"到期时间:%@",hom.endTime];
        cell.timeText.text=[NSString stringWithFormat:@"起息时间:%@",hom.startTime];
        cell.DingQiTitle.text=[NSString stringWithFormat:@"%@",hom.name];
        cell.days.text=[NSString stringWithFormat:@"%@个月",hom.day];;
           // [cell.touZiJinE  setAttributedText:[self changeLabelWithText1:[NSString stringWithFormat:@"%@元", hom.amount]]];
        //cell.shou.text=[NSString stringWithFormat:@"收益:%@元",hom.projectProfit];;
           // [cell.days  setAttributedText:[self changeLabelWithText1:[NSString stringWithFormat:@"%@个月",hom.day]]];
            // [cell.shou  setAttributedText:[self changeLabelWithText:[NSString stringWithFormat:@"收益:%@元",hom.amount]]];
           [cell.xiangQingBtn addTarget:self action:@selector(heTong:) forControlEvents:UIControlEventTouchUpInside];
        cell.touZiJinE.text=[NSString stringWithFormat:@"%@元", hom.amount];
        }
        return cell;
    }
        else  if([mau isEqualToString:@"2"])
    {
        static NSString *cellName12=@"cell11";
        WanTableViewCell* cell12=[tableView dequeueReusableCellWithIdentifier:cellName12];
        if (cell12==nil) {
            cell12=[[[NSBundle mainBundle] loadNibNamed:@"WanTableViewCell" owner:self options:nil] lastObject];
        }
        cell12.selectionStyle = UITableViewCellAccessoryNone;
        if (_totalDataMuarray1.count>0) {
                MeAmonModel *hom=[[MeAmonModel alloc] init];
                hom=_totalDataMuarray1[indexPath.row];
                cell12.endTime.text=[NSString stringWithFormat:@"到期时间:%@",hom.endTime];
                cell12.stactTime.text =[NSString stringWithFormat:@"起息时间:%@",hom.startTime];
                cell12.QingQiTitle.text=[NSString stringWithFormat:@"%@",hom.name];
                cell12.days.text=[NSString stringWithFormat:@"%@个月",hom.day];;
               // cell12.shouYi.text=[NSString stringWithFormat:@"收益:%@元",hom.projectProfit];;
                cell12.monry.text=[NSString stringWithFormat:@"%@元",hom.amount];
          //[cell12.days  setAttributedText:[self changeLabelWithText1:[NSString stringWithFormat:@"%@个月",hom.day]]];
            //cell.shou.text=[NSString stringWithFormat:@"收益:%@元",hom.projectProfit];;
           // [cell12.monry  setAttributedText:[self changeLabelWithText1:[NSString stringWithFormat:@"%@元",hom.amount]]];
         //[cell12.shouYi  setAttributedText:[self changeLabelWithText:[NSString stringWithFormat:@"收益:%@元",hom.projectProfit]]];
        }
        return cell12;
    }else
    {
        static NSString *cellName1=@"cell1";
        MuTableViewCell* cell1=[tableView dequeueReusableCellWithIdentifier:cellName1];
        if (cell1==nil) {
            cell1=[[[NSBundle mainBundle] loadNibNamed:@"MuTableViewCell" owner:self options:nil] lastObject];
        }
        cell1.selectionStyle = UITableViewCellAccessoryNone;
        if (_totalDataMuarray.count>0) {
            MuAmontModel *hom=[[MuAmontModel alloc] init];
            hom=_totalDataMuarray[indexPath.row];
            cell1.heTong.tag=indexPath.row;
            [ cell1.heTong addTarget:self action:@selector(heTong:) forControlEvents:UIControlEventTouchUpInside];
            //cell1.DaoQitimeText.text=[NSString stringWithFormat:@"到期时间:%@",hom.endInterestDate];
            // cell1.timeText.text=[NSString stringWithFormat:@"起息时间:%@",hom.startInterestDate];
            cell1.title.text=[NSString stringWithFormat:@"%@",hom.projectName];;
//            cell1.days.text=[NSString stringWithFormat:@"%@天",hom.projectTimeLimit];;
//            cell1.shouyi.text=[NSString stringWithFormat:@"收益:%@元",hom.projectProfit];;
//            cell1.monry.text=[NSString stringWithFormat:@"%@元",hom.investmentAmount];
            [cell1.days  setAttributedText:[self changeLabelWithText1:[NSString stringWithFormat:@"%@天",hom.projectTimeLimit]]];
            //cell.shou.text=[NSString stringWithFormat:@"收益:%@元",hom.projectProfit];;
            [cell1.monry  setAttributedText:[self changeLabelWithText1:[NSString stringWithFormat:@"%@元",hom.investmentAmount]]];
            [cell1.shouyi  setAttributedText:[self changeLabelWithText:[NSString stringWithFormat:@"收益:%@元",hom.projectProfit]]];
        }
        
        return cell1;
    }

   
    
}
-(NSMutableAttributedString*) changeLabelWithText:(NSString*)needText
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.98f green:0.29f blue:0.30f alpha:1.00f]
                       range:NSMakeRange(3,needText.length-4)];
    return attrString;
}

-(NSMutableAttributedString*) changeLabelWithText1:(NSString*)needText
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    UIFont *font = [UIFont systemFontOfSize:25];
    [attrString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0,needText.length-2)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(needText.length-2,2)];
    return attrString;
}
-(void)heTong:(UIButton*)btn
{
    if ([mau isEqualToString:@"0"]) {
        
//        MuAmontModel *hom=[[MuAmontModel alloc] init];
//        hom=_totalDataMuarray[btn.tag];
//        
//        ProjectDetailsController *pro=[[ProjectDetailsController alloc] init];
//        pro.regularProjectID=hom.projectId;
//        pro.titleName=hom.projectName;
//        [self.navigationController pushViewController:pro animated:YES];
    }
    else{
//        HouAmontModel *hom=[[HouAmontModel alloc] init];
//        hom=_totalDataMuarray1[btn.tag];
//        
//        ProjectDetailsController *pro=[[ProjectDetailsController alloc] init];
//        pro.regularProjectID=hom.projectId;
//        pro.titleName=hom.projectName;
//        [self.navigationController pushViewController:pro animated:YES];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([mau isEqualToString:@"1"]) {
      
        return _totalDataMuarray.count;
    }
    else if ([mau isEqualToString:@"2"]){
         return _totalDataMuarray1.count;
    }else{
        return marray.count;
    }
   
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([mau isEqualToString:@"1"]) {
        
        return 190;
    }
    else if ([mau isEqualToString:@"2"]){
        return 131;
    }else
    {
        return 145;
    }
   
    
}

-(void)downLoadFinish
{
    
    //[self download1];
}

#pragma mark 下拉刷新
- (void)dowPullloadData
{
    pageNum=1;
    
    
    
    if ([mau isEqualToString:@"1"]) {
        [self downLoad];
    }else
    {
        [self downLoad1];
    }
    
}

#pragma mark 上拉刷新
- (void)upPullloadData
{
    pageNum = ++pageNum;
    ;
    if ([mau isEqualToString:@"1"]) {
       [self downLoad];
    }else
    {
       [self downLoad1];
    }
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([mau isEqualToString:@"1"]) {
        ChanPingXiangQing12ViewController *ma=[[ChanPingXiangQing12ViewController alloc] init];
        MeAmonModel *hom=[[MeAmonModel alloc] init];
        hom=_totalDataMuarray[indexPath.row];
        ma.idp=hom.idn;
        [self.navigationController pushViewController:ma animated:YES];
    }else
    {
     
    }
    
   
    

    
    
    
}


- (void)back
{
    
   
    [self  dismissViewControllerAnimated:YES completion:^{
        
        
        
    }];
}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"status":mau,
                                                                                    @"pageSize":@"10",
                                                                                    @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                                                                    
                                                                                    }];
    marray=[[NSMutableArray alloc] init];
      if(total==0||(pageNum-1)*10<total) {
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"invest/getInvestFixedRecord" params:paramDic success:^(id data) {
        for (NSMutableDictionary *dict in data[@"infos"][@"list"])
        {
          model=[[MeAmonModel alloc] initWithDict:dict];
            
            [marray  addObject:model];
        }
        total =[data[@"infos"][@"total"]  intValue];
        if (pageNum == 1) {
                                [_totalDataMuarray removeAllObjects];
                           }
        [_totalDataMuarray addObjectsFromArray:marray];
        
        amont.HuoQi.text=[NSString stringWithFormat:@"¥%@",data[@"payAmount"]];
        [amontTableView reloadData];
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
        
    } failure:^(NSError *error) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }];
      }
      else{
          [amontTableView.header endRefreshing];
          [amontTableView.footer endRefreshing];
      }
}
-(void)downLoad1
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"status":mau,
                                                                                    @"pageSize":@"10",
                                                                                    @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                                                                    
                                                                                    }];
    marray=[[NSMutableArray alloc] init];
    if(total==0||(pageNum-1)*10<total)
    {
        
    [HttpTool getWithBaseURL:kBaseURL  path:@"invest/getInvestFixedRecord" params:paramDic success:^(id data) {
        for (NSMutableDictionary *dict in data[@"infos"][@"list"])
        {
            model=[[MeAmonModel alloc] initWithDict:dict];
            
            [marray  addObject:model];
        }
          total =[data[@"infos"][@"total"]  intValue];
        if (pageNum == 1) {
            [_totalDataMuarray1 removeAllObjects];
        }
        [_totalDataMuarray1 addObjectsFromArray:marray];
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
        amont.HuoQi.text=[NSString stringWithFormat:@"¥%@",data[@"payAmount"]];
        [amontTableView reloadData];
        
        
    } failure:^(NSError *error) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    } alertInfo:^(NSString *alertInfo) {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }];
    }else
    {
        [amontTableView.header endRefreshing];
        [amontTableView.footer endRefreshing];
    }
}
@end
