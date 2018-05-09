//
//  BusinessUserViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/23.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "BusinessUserViewController.h"
#import "BusinessrView.h"
#import "HomeTabTableViewCell.h"
#import "YGouQianBAoViewController.h"
#import "AddShangPinController.h"
#import "ZhangDanController.h"
#import "BianJiShangpinController.h"
#import "ShangpinGuanliViewController.h"
#import "ShangJiaRenzhengController.h"
#import "DianPuPingJiaViewController.h"
#import "FriendViewController.h"
#import "MyPingJiaViewController.h"
#import "SheZhiViewController.h"
#import "ShiNameViewController.h"
#import "YongHuDengJiViewController.h"
#import "ShangJiaRenzhengController.h"
#import "MJRefreshNormalHeader.h"
#import "UIImageView+WebCache.h"
#import <UShareUI/UShareUI.h>
#import "FNFenxiangView.h"
#import "QRCodeGenerateVC.h"
#import "ErWeiMaView.h"
#import "SGQRCode.h"
#import "GQGesVCTransition.h"
#import "JRBusinessCenterViewController.h"
static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_WebLink = @"https://bbs.umeng.com/";
@interface BusinessUserViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *qrCode;
    UITableView *_mineTableView;
    UIView *customView;
    UIImageView *imageViewBJ;
    UIButton *imageViewBtn;
    UIImageView *imageView1;
    UILabel *heatLabel1;
  BusinessrView *footView;
    HomeTabTableViewCell*_cell;
    UIButton *touZiBtn;
    NSMutableArray *ArrayImage;
    NSMutableArray *ArrayImage1;
     NSMutableArray *ArrayImage2;
    UIButton *tiXianBtn;
    UIButton*huoQiBtn;
    UIButton *hongBaoBtn;
    UIButton *yaopingBtn;
    UIButton *zongbtn;
    UIButton *jifenBtn;
    UIButton *keyongBtn;
    UIButton *jiLingBtn;
    UIButton *fengxianBtn;
    UIView *makeTabr;
    UIButton *btn;
     UIButton *btn1;
    UIButton *btn2;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UIButton *DianPuPingLun;
    UIButton *sheZhi234;
    NSString *realNameAuth;
    UIButton *weixin;
    UIButton *peng;
    UIButton*qq;
    UIButton *zone;
    NSString *idn;
    NSString *appUrl;
    NSString *imageUrl;
    NSString *title;
    NSString *introduction;
        NSString *bankCard;
    NSString*payPassword;
      ErWeiMaView *erwei;
}
@end

@implementation BusinessUserViewController
- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled =NO;
//    }
   //[GQGesVCTransition validateGesBackWithType:GQGesVCTransitionTypePanWithPercentRight withRequestFailToLoopScrollView:NO]; //手势返回
    self.navigationController.navigationBarHidden=YES;
   if([FNUserDefaults objectForKey:@"usersid"])
   {
       [self downLoad];
       [self downLoad23];
   }
    //关闭滑动
    [self.navigationController enabledGQVCTransition:NO];
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"";
    //[self downLoad23];
    id traget = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:traget action:nil];
    [self.view addGestureRecognizer:pan];
     sheZhi234=[UIButton buttonWithType:UIButtonTypeCustom];
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, -24, kScreenSize.width, kScreenSize.height) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_mineTableView];
    ArrayImage1=[[NSMutableArray alloc] initWithObjects:@"tab_btn_yulan_pressed",@"tab_btn_share_default",@"tab_btn_code_default", nil];
       ArrayImage=[[NSMutableArray alloc] initWithObjects:@"tab_btn_yulan",@"tab_btn_code_pressed",@"tab_btn_code_default", nil];
    ArrayImage2=[[NSMutableArray alloc] initWithObjects:@"tab_btn_yulan",@"tab_btn_share_default",@"tab_btn_share_pressed", nil];
     footView=[[BusinessrView alloc] init];
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
//     _mineTableView.header = header;
//    
    [self makeUi];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"123" object:nil];
    
}
-(void)downLoadFinish
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark 下拉刷新
- (void)dowPullloadData
{
//    [self downLoad];
//    [self downLoad23];
//    [ _mineTableView.header endRefreshing];
    //[ _mineTableView.footer endRefreshing];
}
-(void)makeUi
{
    CGFloat topViewHeight1 = iPhone4||iPhone5 ? 10 : 0;
    customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.width*0.237+topViewHeight1+64)];
    customView.backgroundColor=[UIColor colorWithHexString:@"#ff2d48"];
    UIImageView *inmaher=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrond_mine"]];
    inmaher.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.width*0.237+topViewHeight1+64);
    [customView addSubview:inmaher];
    
    _mineTableView.tableHeaderView=customView;
    // _header = [CExpandHeader expandWithScrollView:_mineTableView expandView:customView];
    //imageViewBJ=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mebanglangq10"]];
    //头图像
    // imageViewBJ.frame=CGRectMake(0,  0, kScreenSize.width, kScreenSize.width*0.565+topViewHeight1);
    //关键步骤 设置可变化背景view属性
    // imageViewBJ.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleWidth;
    imageViewBJ.clipsToBounds = YES;
    imageViewBJ.contentMode = UIViewContentModeScaleAspectFill;
    [customView addSubview:imageViewBJ];
    
    imageViewBtn=[UIButton  buttonWithType:UIButtonTypeCustom];
    imageViewBtn.frame=CGRectMake(15, 75, 60, 60);
    //[imageViewBtn setImage:[UIImage imageNamed:@"me_head_place"] forState:UIControlStateNormal];
    [imageViewBtn setBackgroundImage:[UIImage imageNamed:@"pic_06"] forState:UIControlStateNormal];
   // [imageViewBtn addTarget:self action:@selector(imageClick) forControlEvents:UIControlEventTouchUpInside];
    [imageViewBtn.layer setCornerRadius:30];
    
    // [self download222];
    //
    imageView1=[[UIImageView  alloc]  initWithImage:[UIImage  imageNamed:@"head"]];
    imageView1.frame=CGRectMake(15, 75, 60, 60);
    [imageView1.layer setCornerRadius:30];
    [customView addSubview:imageView1];
    //图片点击事件
    [customView addSubview:imageViewBtn];
    NSRange sameRange;
    // [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.10.195:8000/index3.html"]]];

    imageView1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick)];
    [imageView1 addGestureRecognizer:tap];
    
    
    
    heatLabel1=[[UILabel alloc] init];
    heatLabel1.text=@"--";
    heatLabel1.frame=CGRectMake(85, 75, 100,30);
    heatLabel1.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleWidth;
    heatLabel1.clipsToBounds = YES;
    //heatLabel1.backgroundColor=[UIColor blueColor];
    heatLabel1.textColor=[UIColor colorWithHexString:@"#FFFFFF"];
    heatLabel1.font=[UIFont systemFontOfSize:15];
    heatLabel1.contentMode = UIViewContentModeScaleAspectFill;
    //heatLabel1.lineBreakMode=NSLineBreakByTruncatingMiddle;
    //heatLabel1.textAlignment=NSTextAlignmentCenter;
    [customView addSubview:heatLabel1];
    
    
    //    HuiYuanDengJiView *yuiyuan=[[HuiYuanDengJiView alloc] init];
    //    yuiyuan.frame=CGRectMake(85, 110, 72, 19);
    //    yuiyuan.vipName.text=vipName;
    //    if ([vipName isEqualToString:@"普通会员"]) {
    //        yuiyuan.vipImage.image=[UIImage imageNamed:@"putong"];
    //    }else if([vipName isEqualToString:@"白银会员"])
    //    {
    //        yuiyuan.vipImage.image=[UIImage imageNamed:@"baiyin"];
    //    }else if([vipName isEqualToString:@"黄金会员"])
    //
    //    {
    //        yuiyuan.vipImage.image=[UIImage imageNamed:@"huangjin"];
    //    }else if([vipName isEqualToString:@"铂金会员"])
    //    {
    //        yuiyuan.vipImage.image=[UIImage imageNamed:@"bojin"];
    //    }else
    //    {
    //        yuiyuan.vipImage.image=[UIImage imageNamed:@"zuanshi"];
    //    }
    //
    //    [customView addSubview:yuiyuan];
    UIImageView *imagelang=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"mebolang"]];
    imagelang.frame=CGRectMake(0,  170, kScreenSize.width, kScreenSize.width*0.08);
    //[customView addSubview:imagelang];
    //设置
    UIButton *sheZhi23=[UIButton buttonWithType:UIButtonTypeCustom];
    [sheZhi23 setImage:[UIImage imageNamed:@"nav_btn_set"] forState:UIControlStateNormal];
    sheZhi23.frame=CGRectMake(5, 30, 30, 60);
    sheZhi23.tag=3002;
    [sheZhi23 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:sheZhi23];
    
//    UIButton *sheZhi=[UIButton buttonWithType:UIButtonTypeCustom];
//    [sheZhi setImage:[UIImage imageNamed:@"nav_btn_news"] forState:UIControlStateNormal];
//    sheZhi.frame=CGRectMake(kScreenSize.width-45, 15, 30, 60);
//    sheZhi.tag=3001;
//    [sheZhi addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
//    [customView addSubview:sheZhi];
//    
//    UIButton *sheZhi1=[UIButton buttonWithType:UIButtonTypeCustom];
//    [sheZhi1 setImage:[UIImage imageNamed:@"nav_btn_share"] forState:UIControlStateNormal];
//    sheZhi1.frame=CGRectMake(kScreenSize.width-85, 15, 30, 60);
//    sheZhi1.tag=3002;
//    [sheZhi1 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
//    [customView addSubview:sheZhi1];
//    
//    
    
    //用户
    UIButton *sheZhi2=[UIButton buttonWithType:UIButtonTypeCustom];
    [sheZhi2 setImage:[UIImage imageNamed:@"putongyonghu"] forState:UIControlStateNormal];
    sheZhi2.tag=3003;
     [sheZhi2 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
    sheZhi2.frame=CGRectMake(85, 110, 60, 20);
    [customView addSubview:sheZhi2];
    //=认证
    

  //易购
    zongbtn=footView.YiGouBtn;
    zongbtn.tag=1000;
    [zongbtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    DianPuPingLun=footView.DianPuPingJia;
    DianPuPingLun.tag=1005;
    [DianPuPingLun addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    jifenBtn=footView.yaoPinBtn;
    jifenBtn.tag=1001;
    [jifenBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    //邀请
    keyongBtn=footView.DingDanGuanLiBtn;
    keyongBtn.tag=1002;
    [keyongBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    tiXianBtn=footView.SahngPinGuanLiBtn;
    tiXianBtn.tag=1004;
    [tiXianBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    
     makeTabr=[[UIView alloc] init];
    makeTabr.frame=CGRectMake(0, kScreenSize.height-50, kScreenSize.width,50);
    makeTabr.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:makeTabr];

    
    btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 5, (kScreenSize.width)/3, 25);
    [btn setImage:[UIImage imageNamed:@"tab_btn_yulan_pressed"] forState:UIControlStateNormal];
    btn.tag=1000;
    [btn addTarget:self action:@selector(btnTar:) forControlEvents:UIControlEventTouchUpInside];
    [makeTabr addSubview:btn];
    
    label1=[[UILabel alloc] init];
    label1.frame=CGRectMake(0, 30, (kScreenSize.width)/3, 20);
    label1.textAlignment=1;
    label1.textColor=[UIColor colorWithHexString:BunRed];
    label1.text=@"预览";
    label1.font=[UIFont  systemFontOfSize:13];
    [makeTabr addSubview:label1];
    
    
    btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake((kScreenSize.width)/3*2, 5, (kScreenSize.width)/3, 25);
    [btn1 setImage:[UIImage imageNamed:@"tab_btn_share_default"] forState:UIControlStateNormal];
    btn1.tag=1001;
    [btn1 addTarget:self action:@selector(btnTar:) forControlEvents:UIControlEventTouchUpInside];
    [makeTabr addSubview:btn1];
    
    label2=[[UILabel alloc] init];
    label2.frame=CGRectMake((kScreenSize.width)/3*2, 30, (kScreenSize.width)/3, 20);
    label2.textAlignment=1;
    label2.textColor=[UIColor blackColor];
    label2.text=@"分享";
    label2.font=[UIFont  systemFontOfSize:13];
    [makeTabr addSubview:label2];
    
    btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake((kScreenSize.width)/3, 5, (kScreenSize.width)/3, 25);
    [btn2 setImage:[UIImage imageNamed:@"tab_btn_code_default"] forState:UIControlStateNormal];
    btn2.tag=1002;
    
    [btn2 addTarget:self action:@selector(btnTar:) forControlEvents:UIControlEventTouchUpInside];
    [makeTabr addSubview:btn2];

    label3=[[UILabel alloc] init];
    label3.frame=CGRectMake((kScreenSize.width)/3, 30, (kScreenSize.width)/3, 20);
    label3.textAlignment=1;
    label3.textColor=[UIColor blackColor];
    label3.font=[UIFont  systemFontOfSize:13];
    label3.text=@"二维码";
    [makeTabr addSubview:label3];
    
}
-(void)sheZhi1:(UIButton *)btnr
{
    if (btnr.tag==3000)
    {
       
    }
    else
    if (btnr.tag==3001)
    {
           
        }
    else if(btnr.tag==3002)//  http://123.57.1.61:8092/kaptcha.jpg?ipone=18311467990
    {
        SheZhiViewController *mak=[[SheZhiViewController alloc] init];
        mak.zhangtai=@"1";
        mak.zhufumima=payPassword;
        mak.passWord=bankCard;
        mak.camen= realNameAuth;
        [self.navigationController pushViewController:mak animated:YES];
        
    }else if(btnr.tag==3003)
    {
        YongHuDengJiViewController *you=[[YongHuDengJiViewController alloc] init];
        you.title=@"普通用户";
        [self.navigationController pushViewController:you animated:YES];
    }
    
    else if(btnr.tag==3004)
    {
        ShangJiaRenzhengController *mak=[[ShangJiaRenzhengController alloc] init];
        [self.navigationController pushViewController:mak animated:YES];
            
    }else if(btnr.tag==3005)
    {
        ShiNameViewController *shi=[[ShiNameViewController alloc] init];
        
        [self.navigationController pushViewController:shi animated:YES];
                    }
 
}
-(void)btnTar:(UIButton *)btnr
{
    if (btnr.tag==1000) {
//        ShangJiaRenzhengController *mak=[[ShangJiaRenzhengController alloc] init];
//        [self.navigationController pushViewController:mak animated:YES];
         label1.textColor=[UIColor colorWithHexString:BunRed];
        label2.textColor=[UIColor blackColor];
          label3.textColor=[UIColor blackColor];
        [erwei removeFromSuperview];
        [btn setImage:[UIImage imageNamed:@"tab_btn_yulan_pressed"] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"tab_btn_share_default"] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"tab_btn_code_default"] forState:UIControlStateNormal];
       
    }else if(btnr.tag==1001)
    {
             [erwei removeFromSuperview];
        FNFenxiangView *share=[[FNFenxiangView alloc] init];
        
        [share  makeUmengHeadUrl:nil andTitle:self.title andShareContent:nil andShare:3];
        
        weixin=share.btn1;
        [weixin addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
        weixin.tag=0;
        
        peng=share.btn;
        
        [ peng addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
        peng.tag=1;
        
        qq=share.btn2;
        [qq addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
        qq.tag=2;
        
        zone=share.btn3;
        [zone addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
        zone.tag=3;
        share.frame = CGRectMake(0, SCREEN_HEIGHT ,SCREEN_WIDTH ,1);
        [UIView animateWithDuration:0.5 animations:^{
            share.frame = CGRectMake(0, 0 ,SCREEN_WIDTH ,SCREEN_HEIGHT);
            [self.tabBarController.view  addSubview:share];
        }];
        

        label1.textColor=[UIColor colorWithHexString:BunRed];
        label2.textColor=[UIColor blackColor];
        label3.textColor=[UIColor blackColor];
       // [erwei removeFromSuperview];
        [btn setImage:[UIImage imageNamed:@"tab_btn_yulan_pressed"] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"tab_btn_share_default"] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"tab_btn_code_default"] forState:UIControlStateNormal];
       
    }else if (btnr.tag==1002){
            [erwei removeFromSuperview];
        erwei=[[ErWeiMaView alloc] init];
        UIView *nabar=[[UIView alloc] init];
        nabar.frame=CGRectMake(0, 0, kScreenSize.width, 64);
        nabar.backgroundColor=[UIColor whiteColor];
        [erwei addSubview:nabar];
        
        UILabel *nabarLableTitle=[[UILabel alloc] init];
        nabarLableTitle.frame=CGRectMake(0, 10, kScreenSize.width, 64);
        nabarLableTitle.backgroundColor=[UIColor whiteColor];
        nabarLableTitle.text=@"我的二维码";
        nabarLableTitle.textAlignment=1;
        [nabar addSubview:nabarLableTitle];
        
        erwei.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-49);
        if (@available(iOS 11.0, *))
        {
            
        }
        [self.view addSubview:erwei];
        [self setupGenerate_Icon_QRCode];
        label1.textColor=[UIColor blackColor];
        label2.textColor=[UIColor blackColor];
        label3.textColor=[UIColor colorWithHexString:BunRed];
       [btn setImage:[UIImage imageNamed:@"tab_btn_yulan"] forState:UIControlStateNormal];
       [btn2 setImage:[UIImage imageNamed:@"tab_btn_code_pressed"] forState:UIControlStateNormal];
       [btn1 setImage:[UIImage imageNamed:@"tab_btn_share_default"] forState:UIControlStateNormal];
      
    }
}
-(void)amontBtn:(UIButton *)btnr
{
    if (btnr.tag==1000) {
        YGouQianBAoViewController *yew=[[YGouQianBAoViewController alloc] init];
        yew.nameRernzheng=realNameAuth;
        yew.zhufumima=payPassword;
        yew.passWord=bankCard;
        yew.shangjia=@"商家";
      
        [self.navigationController pushViewController:yew animated:YES];
    }
    else
        if (btnr.tag==1001) {
            FriendViewController *yew=[[FriendViewController alloc] init];
            [self.navigationController pushViewController:yew animated:YES];
        }
    else if(btnr.tag==1002)
    {
        MyPingJiaViewController *yew=[[MyPingJiaViewController alloc] init];
        yew.nunn=@"sj";
        [self.navigationController pushViewController:yew animated:YES];
    }else if(btnr.tag==1004)
    {
        
//       ShangpinGuanliViewController *yew=[[ShangpinGuanliViewController alloc] init];
//        yew.idn=idn;
//        [self.navigationController pushViewController:yew animated:YES];
        JRBusinessCenterViewController *VC = [[JRBusinessCenterViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
        
        
//        DianPuPingJiaViewController *yew=[[DianPuPingJiaViewController alloc] init];
//        [self.navigationController pushViewController:yew animated:YES];
    }else
    {
                DianPuPingJiaViewController *yew=[[DianPuPingJiaViewController alloc] init];
                yew.idn=idn;
                [self.navigationController pushViewController:yew animated:YES];
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    UIView *stringView=[[UIView alloc] init];
    
   
    _mineTableView.tableFooterView=stringView;
    footView .frame=CGRectMake(0, 0, kScreenSize.width, 493);
    [ stringView addSubview:footView];
    return stringView;
}
#pragma mark 尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    if (iPhone5) {
        return 300;
    }else
    {
        return 300;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTabTableViewCell" owner:self options:nil] lastObject];
    }
    
    //    [_cell.amontBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    //    [_cell.keyongBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    //    _cell.amontBtn.tag=1000;
    //    _cell.keyongBtn.tag=1001;
    //    _cell.momat.textColor=[UIColor colorWithHexString:@"#333333"];
    //    _cell.amontText.textColor=[UIColor colorWithHexString:@"#b3b3b3"];
    //    _cell.yueAmont.textColor=[UIColor colorWithHexString:@"#333333"];
    //    _cell.monryText.textColor=[UIColor colorWithHexString:@"#b3b3b3"];
    //    _cell.line.backgroundColor=[UIColor colorWithHexString:@"#e4e4e4"];
    //    _cell.momat.text= totalAssets;
    //    _cell.yueAmont.text=userBalance;
    //    _cell.selectionStyle = UITableViewCellAccessoryNone;
    return _cell;
}
// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
    
    
}
#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
-(void)download1
{
    //    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
    //
    //
    //                                                                                    }];
    //
    //    [HttpTool getWithBaseURL:kBaseURL  path:@"/user_center" params:paramDic success:^(id data) {
    //
    //
    //        NSLog(@"%@",data);
    //
    //
    //
    //    } failure:^(NSError *error) {
    //
    //    } alertInfo:^(NSString *alertInfo) {
    //
    //    }];
    
    
    
    NSString *urlstring=[NSString  stringWithFormat:@"%@/user_center/person",kBaseURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstring]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request  setValue:[FNUserDefaults objectForKey:@"usersid"] forHTTPHeaderField:@"access_token"];
    NSLog(@"%@",[FNUserDefaults objectForKey:@"usersid"] );
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSLog(@"%@",response);
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSLog(@"%ld",httpResponse.statusCode);
        //4.解析
        if (!data) {
            return;
        }
        NSDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        NSLog(@"%@",dict1);
        //5.回到主线程,进行更新页面
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            
            
            
        });
        
        
        
    }];
    
}
-(void)ShareButtion:(UIButton *)btn144
{
    if (btn144.tag==0)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
        
        
    }
    else if(btn144.tag==1)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
    }else if(btn144.tag==2)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];    }
    else
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
    }
    
}
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    NSString* thumbURL =  imageUrl;
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:introduction thumImage:thumbURL];
    //设置网页地址
    shareObject.webpageUrl = appUrl;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
#ifdef UM_Swift
    [UMSocialSwiftInterface shareWithPlattype:platformType messageObject:messageObject viewController:self completion:^(UMSocialShareResponse * data, NSError * error) {
#else
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
#endif
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    //分享结果消息
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    //第三方原始返回的数据
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [self alertWithError:error];
        }];
    }
     
     - (void)alertWithError:(NSError *)error
     {
         NSString *result = nil;
         if (!error) {
             result = [NSString stringWithFormat:@"Share succeed"];
         }
         else{
             NSMutableString *str = [NSMutableString string];
             if (error.userInfo) {
                 for (NSString *key in error.userInfo) {
                     [str appendFormat:@"%@ = %@\n", key, error.userInfo[key]];
                 }
             }
             if (error) {
                 result = [NSString stringWithFormat:@"Share fail with error code: %d\n%@",(int)error.code, str];
             }
             else{
                 result = [NSString stringWithFormat:@"Share fail"];
             }
         }
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                         message:result
                                                        delegate:nil
                                               cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                               otherButtonTitles:nil];
         [alert show];
     }

-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"/user_center/merchant" params:paramDic success:^(id data) {
        
        NSLog(@"nnnn%@",data[@"msg"]);
        
        //accountAmount=[NSString  stringWithFormat:@"%@",data[@"accountAmount"]];
        heatLabel1.text=[NSString stringWithFormat:@"%@",data[@"name"]];
        NSString *nameString=data[@"name"];
        if(nameString.length<=4)
        {
            heatLabel1.frame=CGRectMake(85, 75,nameString.length*28 ,30);
        }
        else
        {
            heatLabel1.frame=CGRectMake(85, 75,nameString.length*39 ,30);
        }
        
        qrCode =[NSString stringWithFormat:@"%@",data[@"qrCode"]];
        realNameAuth=[NSString stringWithFormat:@"%@",data[@"merchantAuth"]];
        NSLog(@"realNameAuth :%@",realNameAuth);
        NSLog(@"%@",data);
        idn=[NSString stringWithFormat:@"%@",data[@"preview"]];
        //[self makeUi];
        if([realNameAuth isEqualToString:@"0"]){
            [sheZhi234 setImage:[UIImage imageNamed:@"btn_uncertified_mine"] forState:UIControlStateNormal];
        }else
        {
            [sheZhi234 setImage:[UIImage imageNamed:@"btn_certified_mine"] forState:UIControlStateNormal];
        }
        NSInteger mNumber=[data[@"accountAmount"] integerValue];
        if(mNumber >0){
            footView.qian.text=  [ NSString stringWithFormat:@"￥%@",data[@"accountAmount"]];
        }
        

        //heatLabel1.text=phone;
        appUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"url"]];
        imageUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"imageUrl"]];
        title=[NSString stringWithFormat:@"%@",data[@"share"][@"title"]];
        introduction=[NSString stringWithFormat:@"%@",data[@"share"][@"introduction"]];
  
        sheZhi234.tag=3004;
       
        sheZhi234.frame=CGRectMake(85, 110, 60, 20);
        [customView addSubview:sheZhi234];
        if([[NSString stringWithFormat:@"%@",data[@"merchantAuth"] ] isEqualToString:@"1"])
        {
          
            
            [sheZhi234 setImage:[UIImage imageNamed:@"shenhezhong"] forState:UIControlStateNormal];
          
 
        }
        else if([[NSString stringWithFormat:@"%@",data[@"merchantAuth"] ] isEqualToString:@"0"])
        {
             [sheZhi234 setImage:[UIImage imageNamed:@"btn_uncertified_mine"] forState:UIControlStateNormal];
             [sheZhi234 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
        }
    else if([[NSString stringWithFormat:@"%@",data[@"merchantAuth"] ] isEqualToString:@"-1"])
    {
        [sheZhi234 setImage:[UIImage imageNamed:@"ShenheShiBai"] forState:UIControlStateNormal];
        [sheZhi234 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
    }else if([[NSString stringWithFormat:@"%@",data[@"merchantAuth"] ] isEqualToString:@"-3"])
    {
         [sheZhi234 setImage:[UIImage imageNamed:@"DianPuZhuXiao"] forState:UIControlStateNormal];
    }else if([[NSString stringWithFormat:@"%@",data[@"merchantAuth"] ] isEqualToString:@"2"])
    {
         [sheZhi234 setImage:[UIImage imageNamed:@"btn_certified_mine"] forState:UIControlStateNormal];
    }else if([[NSString stringWithFormat:@"%@",data[@"merchantAuth"] ] isEqualToString:@"-2"])
    {
        [sheZhi234 setImage:[UIImage imageNamed:@"DianppuDongJie"] forState:UIControlStateNormal];
    }
        
        
            } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
     -(void)downLoad23
     {
         NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                         
                                                                                         
                                                                                         }];
         
         [HttpTool getWithBaseURL:kBaseURL  path:@"/user_center/get_account" params:paramDic success:^(id data) {
             
              payPassword=[NSString stringWithFormat:@"%@",data[@"payPassword"]];
             // _yuyujine.text=[NSString stringWithFormat:@"%@",data[@"amount"]];;
             bankCard=[NSString stringWithFormat:@"%@",data[@"bankCard"]];
             NSLog(@"%@",data);
             
         } failure:^(NSError *error) {
             
         } alertInfo:^(NSString *alertInfo) {
             
         }];
     }
     
#pragma mark - - - 中间带有图标二维码生成
     - (void)setupGenerate_Icon_QRCode {
         
         // 1、借助UIImageView显示二维码
         UIImageView *imageView = [[UIImageView alloc] init];
         CGFloat imageViewW = 0.60*kScreenSize.width;
         CGFloat imageViewH = 0.60*kScreenSize.width;
         CGFloat imageViewX =50;
         CGFloat imageViewY = 20;
         if (iPhone5) {
             
             imageViewW = 0.68*kScreenSize.width;
             imageViewH = 0.68*kScreenSize.width;
             imageViewX =20;
             imageViewY = 20;
         }
         if (iPhone6) {
             
             imageViewW = 0.68*kScreenSize.width;
             imageViewH = 0.68*kScreenSize.width;
             imageViewX =30;
             imageViewY = 10;
         }
         imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
         erwei.Viewas.layer.cornerRadius=5;
         [erwei.Viewas addSubview:imageView];
         
         CGFloat scale = 0.2;
         
         // 2、将最终合得的图片显示在UIImageView上
         imageView.image = [SGQRCodeGenerateManager SG_generateWithLogoQRCodeData:qrCode logoImageName:@"AppIcon20x20" logoScaleToSuperView:scale];
         
     }

@end
