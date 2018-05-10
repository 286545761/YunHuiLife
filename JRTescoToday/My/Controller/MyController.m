//
//  MyController.m
//  TescoToday
//
//  Created by 123 on 2017/8/18.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "MyController.h"
#import "DuoMeheadView.h"
#import "HomeTabTableViewCell.h"
#import "YGouQianBAoViewController.h"
#import "SheZhiViewController.h"
#import "MyPingJiaViewController.h"
#import "FeedBackVC.h"
#import "FriendViewController.h"
#import "JinPaiHeHuoRenViewController.h"
#import "BusinessUserViewController.h"
#import "PingJiaXiangQing1ViewController.h"
#import "QRCodeGenerateVC.h"
#import "ShiNameViewController.h"
#import "ShopViewController.h"
#import "FNFenxiangView.h"
#import "UIImageView+WebCache.h"
#import <UShareUI/UShareUI.h>
#import "Login.h"
#import "wepViewController.h"
#import "JRBusinessCenterViewController.h"
#import "DingDanXiangQing1ViewController.h"//测试
#import "ChaKanJuanMaViewController.h"//测试
#import "JROrderManagerViewController.h"
static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_WebLink = @"https://bbs.umeng.com/";
@interface MyController ()<UITableViewDataSource,UITableViewDelegate>{
     UITableView *_mineTableView;
     UIView *customView;
    UIButton *sheZhi234;
         UIImageView *imageViewBJ;
        UIButton *imageViewBtn;
      UIImageView *imageView1;
      UILabel *heatLabel1;
    DuoMeheadView *footView;
    HomeTabTableViewCell*_cell;
   // UIButton *touZiBtn;
    UIButton *tiXianBtn;
    UIButton*huoQiBtn;
    UIButton *hongBaoBtn;
    UIButton *yaopingBtn;
    UIButton *zongbtn;
    //UIButton *jifenBtn;
    UIButton *keyongBtn;
    UIButton *jiLingBtn;
    UIButton *fengxianBtn;
     UIButton *pingjialiebiao;
    UIButton *weixin;
    UIButton *peng;
    UIButton*qq;
    UIButton *zone;
    NSString *bankCard;
    NSString *accountAmount;
    NSString *phone;
    NSString *qrCode ;
    NSString *realNameAuth;
    NSString * payPassword;
    NSString *febxuangString;
    FNFenxiangView *share;
    NSString *appUrl;
    NSString *imageUrl;
    NSString *title;
    NSString *introduction;
    UIView *uiView;
}

@end

@implementation MyController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   self.navigationController.navigationBarHidden=YES;
    if ([[NSString stringWithFormat:@"%@",[FNUserDefaults objectForKey:@"dengluren"]] isEqualToString:@"merchant"]        ) {
        //BusinessUserViewController* nav=  [[BusinessUserViewController alloc] init];
        BusinessUserViewController *bus=[[BusinessUserViewController alloc] init];;
        [self.navigationController pushViewController:bus animated:YES];
    }
    
    NSString *usid=[FNUserDefaults objectForKey:@"usersid"];
    
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        
        [self makeUi];
        [self makeUiWei];
    }
    else
    {
        
        
        
        [self downLoad];
        //
//        [self downLoad23];
        
    }
    
   // NSLog(@"%@",property_getAttribytes(property));
  
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat offY=-24;
    if (ScreenH==812) {
        offY=-44;
    }
//    if (P) {
//        
//    }
    
    
//    if (iPhone6p) {
    
//        }
    
     footView=[[DuoMeheadView alloc] init];
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, offY, kScreenSize.width, kScreenSize.height) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_mineTableView];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"My" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish1) name:@"My1" object:nil];
    if (![FNUserDefaults objectForKey:@"usersid"]) {
            [self makeUi];
                 [self makeUiWei];
    }
    else
    {  CGFloat topViewHeight1 = iPhone4||iPhone5 ? 10 : 0;
        customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.width*0.237+topViewHeight1+64)];
        //footView.jifen.text=  [ NSString stringWithFormat:@"￥%@",accountAmount ];
            heatLabel1=[[UILabel alloc] init];
        [self makeUi];
     
        
    }
   
}
-(void)downLoadFinish
{  [self makeUi];
    [self makeUiWei];
   
}
-(void)downLoadFinish1
{
  [self makeUi];
}
-(void)makeUiWei
{

    footView.jifen.text=@"";
    CGFloat topViewHeight1 =10;
    customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.width*0.237+topViewHeight1+64)];
    customView.backgroundColor=[UIColor colorWithHexString:@"#ff2d48"];
    UIImageView *inmaher=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrond_mine"]];
    inmaher.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.width*0.237+topViewHeight1+64);
    [customView addSubview:inmaher];
    
    _mineTableView.tableHeaderView=customView;
    
    imageViewBJ.clipsToBounds = YES;
    imageViewBJ.contentMode = UIViewContentModeScaleAspectFill;
    [customView addSubview:imageViewBJ];
    
    imageViewBtn=[UIButton  buttonWithType:UIButtonTypeCustom];
    imageViewBtn.frame=CGRectMake(15, 75, 60, 60);
    
    [imageViewBtn setBackgroundImage:[UIImage imageNamed:@"pic_06"] forState:UIControlStateNormal];
    //[imageViewBtn addTarget:self action:@selector(imageClick) forControlEvents:UIControlEventTouchUpInside];
    [imageViewBtn.layer setCornerRadius:30];
    
    // [self download222];
    imageView1=[[UIImageView  alloc]  initWithImage:[UIImage  imageNamed:@"head"]];
    imageView1.frame=CGRectMake(15, 75, 60, 60);
    [imageView1.layer setCornerRadius:30];
    [customView addSubview:imageView1];
    //图片点击事件
    [customView addSubview:imageViewBtn];
    //  NSRange sameRange;
    
    imageView1.userInteractionEnabled = YES;
    // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick)];
    //[imageView1 addGestureRecognizer:tap];
    
    UIButton *sheZhi2344=[UIButton buttonWithType:UIButtonTypeCustom];
    [sheZhi2344 setImage:[UIImage imageNamed:@"zhucedengliukuang"] forState:UIControlStateNormal];
    
    
    
    
     //[sheZhi2344 set       : forState:UIControlStateNormal];
    //[sheZhi2344 setTitle:@"登录／注册" forState:UIControlStateNormal];
    sheZhi2344.titleLabel.font=[UIFont systemFontOfSize:13];
    CGFloat offY=80;
//    if (ScreenH==812) {
//        offY=100;
//    }
    
    sheZhi2344.frame=CGRectMake(85, offY, 100,60);
    sheZhi2344.tag=3003;
//    sheZhi2344.backgroundColor=[UIColor redColor];
    [sheZhi2344 addTarget:self action:@selector(sheZhi1234) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:sheZhi2344];
  
   

    UIImageView *imagelang=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"mebolang"]];
    imagelang.frame=CGRectMake(0,  170, kScreenSize.width, kScreenSize.width*0.08);
  
    UIButton *sheZhi23=[UIButton buttonWithType:UIButtonTypeCustom];
    [sheZhi23 setTitle:@"设置" forState:UIControlStateNormal];
    sheZhi23.titleLabel.font=[UIFont  systemFontOfSize:13];
    [sheZhi23 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   // [sheZhi23 setImage:[UIImage imageNamed:@"nav_btn_set"] forState:UIControlStateNormal];
    
    CGFloat sheZhi23OffY=15;
    if (ScreenH==812) {
        sheZhi23OffY=35;
    }
    
    
    sheZhi23.frame=CGRectMake(kScreenSize.width-80, sheZhi23OffY, 100, 60);
    sheZhi23.tag=3003;
    [sheZhi23 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:sheZhi23];
    
    UIButton *sheZhi1=[UIButton buttonWithType:UIButtonTypeCustom];
    [sheZhi1 setImage:[UIImage imageNamed:@"nav_btn_share1"] forState:UIControlStateNormal];
    sheZhi1.frame=CGRectMake(kScreenSize.width-45, 15, 30, 60);
    sheZhi1.tag=3002;
    [sheZhi1 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:sheZhi1];
    sheZhi1.hidden = YES;
//    sheZhi23.enabled=NO;
//    uiView.hidden=NO;
    sheZhi2344.hidden=NO;
//    sheZhi1.enabled=NO;
    //[self.view addSubview:uiView];
}
-(void)makeUi
{
    
    CGFloat topViewHeight1 = iPhone4||iPhone5 ? 10 : 0;
    customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.width*0.237+topViewHeight1+64)];
//    customView.backgroundColor=[UIColor colorWithHexString:@"#ff2d48"];
    UIImageView *inmaher=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrond_mine"]];
    inmaher.frame=CGRectMake(0, -30, kScreenSize.width, kScreenSize.width*0.237+topViewHeight1+88);
    [customView addSubview:inmaher];

    _mineTableView.tableHeaderView=customView;
    
    imageViewBJ.clipsToBounds = YES;
    imageViewBJ.contentMode = UIViewContentModeScaleAspectFill;
    [customView addSubview:imageViewBJ];
    
    imageViewBtn=[UIButton  buttonWithType:UIButtonTypeCustom];
    imageViewBtn.frame=CGRectMake(15, 75, 60, 60);
  
    [imageViewBtn setBackgroundImage:[UIImage imageNamed:@"pic_06"] forState:UIControlStateNormal];
    //[imageViewBtn addTarget:self action:@selector(imageClick) forControlEvents:UIControlEventTouchUpInside];
    [imageViewBtn.layer setCornerRadius:30];
    
   // [self download222];
    imageView1=[[UIImageView  alloc]  initWithImage:[UIImage  imageNamed:@"head"]];
    imageView1.frame=CGRectMake(15, 75, 60, 60);
    [imageView1.layer setCornerRadius:30];
    [customView addSubview:imageView1];
    //图片点击事件
    [customView addSubview:imageViewBtn];
  //  NSRange sameRange;

    imageView1.userInteractionEnabled = YES;
   // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick)];
    //[imageView1 addGestureRecognizer:tap];
    
//    UIButton *sheZhi2344=[UIButton buttonWithType:UIButtonTypeCustom];
//   // [sheZhi2344 setImage:[UIImage imageNamed:@"nav_btn_set"] forState:UIControlStateNormal];
//    [sheZhi2344 setTitle:@"登录／注册" forState:UIControlStateNormal];
//    sheZhi2344.frame=CGRectMake(85, 80, 100,60);
//    sheZhi2344.tag=3003;
//    [sheZhi2344 addTarget:self action:@selector(sheZhi1234) forControlEvents:UIControlEventTouchUpInside];
//    [customView addSubview:sheZhi2344];
    febxuangString=@"";
    heatLabel1=[[UILabel alloc] init];
//    heatLabel1.text=@"";
  
    heatLabel1.frame=CGRectMake(85, 60, 100,60);
    heatLabel1.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleWidth;
    heatLabel1.clipsToBounds = YES;
    heatLabel1.textColor=[UIColor   blackColor];
    heatLabel1.font=[UIFont systemFontOfSize:15];
    heatLabel1.contentMode = UIViewContentModeScaleAspectFill;
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
    // 设置
    UIButton *sheZhi23=[UIButton buttonWithType:UIButtonTypeCustom];
      [sheZhi23 setTitle:@"设置" forState:UIControlStateNormal];
     sheZhi23.titleLabel.font=[UIFont  systemFontOfSize:13];
//    [sheZhi23 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[sheZhi23 setImage:[UIImage imageNamed:@"nav_btn_set"] forState:UIControlStateNormal];
    
    CGFloat  sheZhi23OffY=15;
    if (ScreenH==812) {
        sheZhi23OffY=35;
    }
    
    sheZhi23.frame=CGRectMake(kScreenSize.width-80, sheZhi23OffY, 80, 60);
    
    
    
    sheZhi23.tag=3003;
    [sheZhi23 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:sheZhi23];
    //消息
//    UIButton *sheZhi=[UIButton buttonWithType:UIButtonTypeCustom];
//    [sheZhi setImage:[UIImage imageNamed:@"nav_btn_news"] forState:UIControlStateNormal];
//    sheZhi.frame=CGRectMake(kScreenSize.width-45, 15, 30, 60);
//    sheZhi.tag=3001;
//    [sheZhi addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
//    [customView addSubview:sheZhi];
    //分享
//    UIButton *sheZhi1=[UIButton buttonWithType:UIButtonTypeCustom];
//    [sheZhi1 setImage:[UIImage imageNamed:@"nav_btn_share1"] forState:UIControlStateNormal];
//    sheZhi1.frame=CGRectMake(kScreenSize.width-45, 15, 30, 60);
//    sheZhi1.tag=122222;
//    [sheZhi1 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
//    [customView addSubview:sheZhi1];
   //用户详情
    UIButton *sheZhi2=[UIButton buttonWithType:UIButtonTypeCustom];
    [sheZhi2 setImage:[UIImage imageNamed:@"putongyonghu"] forState:UIControlStateNormal];
    sheZhi2.tag=3004;
    [sheZhi2 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
    sheZhi2.frame=CGRectMake(85, 110, 60, 20);
    [customView addSubview:sheZhi2];
    
   
    //认证
    sheZhi234=[UIButton buttonWithType:UIButtonTypeCustom];
  

  
    
  
   //合伙人
    huoQiBtn=footView.huoDaoBtn;
    huoQiBtn.tag=3002;
    [huoQiBtn addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
   //易购自营
    hongBaoBtn=footView.hongBaoBtn;
    hongBaoBtn.tag=1004;
    hongBaoBtn.backgroundColor=[UIColor yellowColor];
    [hongBaoBtn addTarget:self action:@selector(amontBtn123:) forControlEvents:UIControlEventTouchUpInside];
    //我的二维码
    zongbtn=footView.zongzibtn;
    zongbtn.tag=1001;
    [zongbtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    //易购
   UIButton * jifenBtn=footView.jifenbtn;
    jifenBtn.tag=1000;
    [jifenBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    //邀请
    keyongBtn=footView.yuebtn;
    keyongBtn.tag=1002;
    [keyongBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];

    //订单
    tiXianBtn=footView.dingdanbtn;
    tiXianBtn.tag=1005;
    [tiXianBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //收藏
    jiLingBtn=footView.shouchangbtn;
    jiLingBtn.tag=1006;
    [jiLingBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //评价
    fengxianBtn=footView.pingjianbtn;
    fengxianBtn.tag=1007;
    [fengxianBtn addTarget:self action:@selector(amontBtn:) forControlEvents:UIControlEventTouchUpInside];
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        
       
    }
    else
    {
        [uiView removeFromSuperview];
      
         sheZhi23.enabled=YES;
        uiView.hidden=YES;
      
       // sheZhi1.enabled=YES;
    }

    
}
-(void)amontBtn123:(UIButton *)btn
{
    if(btn.tag==1004)
    {
//        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//        animation.keyPath = @"transform.scale";
//        animation.values = @[@1.0,@1.1,@0.9,@1.0];
//        animation.duration = 0.3;
//        animation.calculationMode = kCAAnimationCubic;
//        //添加动画
//        [footView.maskView.layer addAnimation:animation forKey:nil];
//
        wepViewController *nam=[[wepViewController alloc] init];
        nam.string=@"http://jrygou.com/wap";
        nam.sting2=@"易购自营";
        [self.navigationController pushViewController:nam animated:YES];
      
    }
    else if(btn.tag==1003)
    {
        JinPaiHeHuoRenViewController *nam=[[JinPaiHeHuoRenViewController alloc] init];
        [self.navigationController pushViewController:nam animated:YES];
    }
}
-(void)sheZhi1234
{
    LoginController *rigiste = [[LoginController alloc] init];
    rigiste.shouYe=@"shouye";
    
    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
    [self presentViewController:avc animated:YES completion:^{
        
    }];;
}
-(void)sheZhi1:(UIButton *)btnr
{
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
        if (btnr.tag==3000) {
            
        }
        else
            if (btnr.tag==3001) {
                
            }
            else if(btnr.tag==3002)
            {
                
                if ([febxuangString isEqualToString:@""]) {
                    
                    share=[[FNFenxiangView alloc] init];
                    
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
                    [UIView animateWithDuration:0 animations:^{
                        share.frame = CGRectMake(0, 0 ,SCREEN_WIDTH ,SCREEN_HEIGHT);
                        [self.tabBarController.view  addSubview:share];
                    }];
                    
                    
                }else
                {
                    febxuangString=@"";
                    [UIView animateWithDuration :0 animations:^{
                        share.frame = CGRectMake(0, share.frame.size.height+110 ,share.frame.size.width ,0);
                        
                    }];
                    [share.ccc removeFromSuperview];
                }
                
                
            }else if(btnr.tag==3003){
                SheZhiViewController *mak=[[SheZhiViewController alloc] init];
                mak.zhufumima=payPassword;
                mak.passWord=bankCard;
                mak.camen= realNameAuth;
                [self.navigationController pushViewController:mak animated:YES];
            }
        
            else if(btnr.tag==3004)
            {
                
                
            }else if(btnr.tag==3005)
            {
                ShiNameViewController *shi=[[ShiNameViewController alloc] init];
                
                [self.navigationController pushViewController:shi animated:YES];
            }
        
        
    }
    
}
-(void)amontBtn:(UIButton *)btn
{
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
    if (btn.tag==1000) {//ChaKanJuanMaViewController
//        DingDanXiangQing1ViewController *yew=[[DingDanXiangQing1ViewController alloc] init];
////        yew.nameRernzheng=realNameAuth;
////        yew.zhufumima=payPassword;
////        yew.passWord=bankCard;
////        yew.person=@"个人";
//        [self.navigationController pushViewController:yew animated:YES];
        
      //  ChaKanJuanMaViewController *yew=[[ChaKanJuanMaViewController alloc] init];
        //        yew.nameRernzheng=realNameAuth;
        //        yew.zhufumima=payPassword;
        //        yew.passWord=bankCard;
        //        yew.person=@"个人";YGouQianBAoViewController
          YGouQianBAoViewController *yew=[[YGouQianBAoViewController alloc] init];        [self.navigationController pushViewController:yew animated:YES];
    }
    else if(btn.tag==1001)
    {

       QRCodeGenerateVC *yew=[[QRCodeGenerateVC alloc] init];
        yew.str=qrCode;
        [self.navigationController pushViewController:yew animated:YES];
    }
    else if(btn.tag==1002)
    {
        FriendViewController *yew=[[FriendViewController alloc] init];
        [self.navigationController pushViewController:yew animated:YES];
        
    }
   
    else  if(btn.tag==1005)
    {
       JROrderManagerViewController *yew=[[JROrderManagerViewController alloc] init];
        [self.navigationController pushViewController:yew animated:YES];
//        FeedBackVC *yew=[[ FeedBackVC alloc] init];
//        [self.navigationController pushViewController:yew animated:YES];
        
    }
    else if(btn.tag==1006)
    {
        ShopViewController *shop=[[ShopViewController alloc] init];
        [self.navigationController pushViewController:shop animated:YES];
    }
    else if(btn.tag==1007){
        PingJiaXiangQing1ViewController *yew=[[ PingJiaXiangQing1ViewController alloc] init];
        [self.navigationController pushViewController:yew animated:YES];
    }
    }
    
    

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    UIView *stringView=[[UIView alloc] init];
//    stringView.backgroundColor=[UIColor yellowColor];
    //footView=[[DuoMeheadView alloc] init];
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

    
    
    NSString *urlstring=[NSString  stringWithFormat:@"%@user_center/person",kBaseURL];
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
-(void)ShareButtion:(UIButton *)btn1
{
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
    if (btn1.tag==0)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
        
        
    }
    else if(btn1.tag==1)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
    }else if(btn1.tag==2)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];    }
    else
    {
       [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
    }
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
       // [Login loginRenZengPhone:nil andPwdnum:nil];
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                        
                                                                                        
                                                                                        }];
        
        [HttpTool getWithBaseURL:kBaseURL  path:@"person" params:paramDic success:^(id data) {
            //[Login loginRenZengPhone:nil andPwdnum:nil];
             [self makeUi];
            accountAmount=[NSString  stringWithFormat:@"%@",data[@"accountBalance"]];
            phone=[NSString stringWithFormat:@"%@",data[@"name"]];
            qrCode =[NSString stringWithFormat:@"%@",data[@"qrCode"]];
            realNameAuth=[NSString stringWithFormat:@"%@",data[@"isRealName"]];
            NSLog(@"%@",data);
            //[self makeUi];
            if([realNameAuth isEqualToString:@"0"]){

                [sheZhi234 setTitle:@"未认证" forState:UIControlStateNormal];
                sheZhi234.titleLabel.font=[UIFont systemFontOfSize:14];
                [sheZhi234 setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
                sheZhi234.backgroundColor=RGB(216, 148, 34);
                sheZhi234.layer.cornerRadius=10.f;
                sheZhi234.layer.masksToBounds=YES;
                   [sheZhi234 addTarget:self action:@selector(sheZhi1:) forControlEvents:UIControlEventTouchUpInside];
            }else if([realNameAuth isEqualToString:@"1"])
    {
    
                sheZhi234.enabled=NO;
                [sheZhi234 setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
                [sheZhi234 setImage:[UIImage imageNamed:@"btn_certified_mine"] forState:UIControlStateNormal];
//                [sheZhi234 setTitle:@"已认证" forState:UIControlStateNormal];
        
               
            }
            sheZhi234.tag=3005;
//            if ([realNameAuth isEqualToString:@"0"]) {
//
//            }
//            else
//            {
//
//            }
            appUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"url"]];
            imageUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"imageUrl"]];
            title=[NSString stringWithFormat:@"%@",data[@"share"][@"title"]];
            introduction=[NSString stringWithFormat:@"%@",data[@"share"][@"introduction"]];
            sheZhi234.frame=CGRectMake(85, 110, 60, 20);
            [customView addSubview:sheZhi234];
            
            if([accountAmount floatValue]<=0){
                
                accountAmount=@"0";
            }
            
            footView.jifen.text=  [ NSString stringWithFormat:@"￥%.2f",[accountAmount floatValue]];
             heatLabel1.text=phone;
             payPassword=[NSString stringWithFormat:@"%@",data[@"isSetupPayPassword"]
                          ];
        } failure:^(NSError *error) {
            
        } alertInfo:^(NSString *alertInfo) {
            
        }];
    }
     
     -(void)downLoad23
    {
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                        
                                                                                        
                                                                                        }];
     //   [Login loginRenZengPhone:nil andPwdnum:nil];
        NSLog(@"qqqqq%@",[FNUserDefaults objectForKey:@"usersid"]);
        [HttpTool getWithBaseURL:kBaseURL  path:@"user_center/get_account" params:paramDic success:^(id data) {
            
           // _yuyujine.text=[NSString stringWithFormat:@"%@",data[@"amount"]];;34940cb1-5c78-4962-9578-67963a4941b8  71d86d20-a2af-4605-a5f8-cdfa82909067
            bankCard=[NSString stringWithFormat:@"%@",data[@"bankCard"]];
            [FNUserDefaults setObject:bankCard forKey:@"bankCard"];
            NSLog(@"%@",data);
            
        } failure:^(NSError *error) {
            
        } alertInfo:^(NSString *alertInfo) {
            
        }];
    }
     
@end
