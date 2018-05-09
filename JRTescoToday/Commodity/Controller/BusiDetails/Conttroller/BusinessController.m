//
//  BusinessController.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/8.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "BusinessController.h"
#import "UIBarButtonItem+DH.h"
#import "OtherWaysLoginController.h"
#import "CExpandHeader.h"
//#import "DBImageView.h"
#import "HomeHear.h"
#import "shopInfoView.h"
//#import "tabBarView1.h"
#import "HomeHear2.h"
#import "DiziTableViewCell.h"
#import "pingLunbussView.h"
#import "SGImagePickerController.h"
#import "TuxiangVierw.h"
#import "PhotoView.h"
//#import "LoginViewController.h"
#import "BusinessChanpingModel.h"
#import "BusinessPLModel.h"
#import "BusinDiZiModel.h"
#import "ShopTableViewCell.h"
#import "PLContentViewController.h"
//#import "LoginViewController.h"
//#import "MapViewController.h"
//#import "CommonFunc.h"
#import "UIImageView+WebCache.h"
#import "BusinessTableViewCell.h"
//#import "XFLabelWebView.h"
#import "HomeTabTableViewCell.h"
#import "hear234.h"
#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "shangpu.h"
#import "ConsumptionController.h"
#import "UIImageView+WebCache.h"
#import "BusinessUserViewController.h"
#import "CommSpotViewController.h"
#import "DianPuPingJiaViewController.h"
#import "DHMainController.h"
#import "FNFenxiangView.h"
#import <UShareUI/UShareUI.h>
#import "XWCircleSpreadTransition.h"
#import "XWInteractiveTransition.h"
#import "GoodsLabelModel.h"
#import "PingLunDianPuTableViewCell.h"
#import "PingLunModel.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshAutoNormalFooter.h"
#import "BussFenLeiModel.h"
static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_WebLink = @"https://bbs.umeng.com/";
@interface BusinessController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIViewControllerTransitioningDelegate,NSCopying>
{
    CGSize labelSize;
    NSMutableDictionary *paramDic12;
    NSString *strName;//商家名字
    BusinDiZiModel *businDiZiModel;
    UITableView *_businessTableView;
    NSMutableArray *_items;
    NSMutableArray *deleBtnArray;
    CExpandHeader *_header;
    ShopTableViewCell *_cell1;
    NSArray *_tarArray;
    CGSize kbSize1;
    UIView *makeView;
    UIView *makeView1;
    UIView *makeView2;
      UIButton*_introduction;
//    HomeHear *heat;//透视图
    HomeHear2 *heat2;
    shopInfoView*shopView;
    UILabel *label;
    UIImageView*imageView1;//广告图
    UIView *tarView;
      NSMutableArray *_items2;
    DiziTableViewCell *_cell;
      UIButton *btnw;
    BusinessPLModel *BusinessPLM;
    UITableView *_diZiTableView;
    UIButton *xialaBtn;
    UITextField *pingLunField;
    UIImageView *imageView2;
    UIButton *btnq;
    //UIAlertView *alert;
    TuxiangVierw *jianPan;
    pingLunbussView *pingLun;
    pingLunbussView *tuppian2;
    UIButton *tupiany;
    UIBlurEffect *blur;
    UIButton *diZiBtn;
    UIButton*phoneBtn;
    NSMutableArray *btnArray;
    UIButton *addTupian;
    UIVisualEffectView *effectview;
    UIScrollView *phone;//图片排列
    NSMutableArray *phoneArray;
    UIImageView *strView;
    NSMutableArray *imageViewArray;
    int n;
    UIButton *phoneBtn1;
    UIButton*diZiBtn1;
    UIButton *btn22;
    BusinessChanpingModel *busChan;
   UIImageView *imageViewBJ;
    UIButton *deleBtn;//删除选中图片
    UIButton *pingLunBtn;//跳转评论详情
    // DBImageView *imageView3;
    NSMutableArray *_items1;
  NSMutableDictionary *paramDic;
   // DBImageView *heat3;
    NSArray*titleArray;
    UIButton *faBiao;
    int mm;
    UIImageView *imageView34;
    NSArray *imageArray;
    NSMutableArray *_items3;
    UIButton *DituJingWei
    ;
    UIButton *informationCardBtn;
    NSString *idennn;
    hear234 *li;
    NSMutableArray *totalArray;
    NSString *stree;
    NSString *shcode;
    UIButton *youhumaibanBtn;
    NSString *szhekou;
    UIButton *dianhua;
    NSString *photo;
    UIButton *GengBuopingLun;
    UIButton *gengDuoSahngpu;
    NSMutableArray *strrr;
    NSString *febxuangString;
    FNFenxiangView *share;
    UIButton *weixin;
    UIButton *peng;
    UIButton*qq;
    UIButton *zone;
    NSString *appUrl;
    NSString *imageUrl;
    NSString *title;
    NSString *introduction12;
    NSString *Dizhi123;
    UITableView *amontTableView;
    UITableView *amontTableView1;
 
    UIView *switchView;
    UIButton *switchBtn;
    UIButton *switchBtn1;
    UIButton *switchBtn2;
    UIButton *switchBtn3;
    UIButton *switchBtn4;
    UIButton *switchBtn5;
    UIButton *dingDingBtn;
    UIButton *sheYuBtn;
    UIButton *huoQiBtn;
    UIButton *tiYanBtn;
    UIView *lineView;
     UIView *lineView1;
    int pageNum;
    int statut;
//    UIView *makeView2;
//    UIView *makeView1;
    NSString *mau;
    NSString *str;
    int total;
    int total1;
    int total2;
    int total3;
    NSMutableArray *TotalArray;
     NSMutableArray *TotalArray1;
    NSMutableArray *totalArray1234;
    UIScrollView *makeFenleiView;
    PingLunDianPuTableViewCell *cell2;
}
@property (nonatomic, strong) UIButton *btnSheet;

/** 地理编码管理器 */
@property (nonatomic, strong) CLGeocoder *geoC;
@property (nonatomic, strong) NSString *urlScheme;
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) CLLocationCoordinate2D endCoordinate;
@property (nonatomic, strong) XWInteractiveTransition *interactiveTransition;
@property (nonatomic, strong) UITableView *amontTableView2;
/*
 *选中的按钮
 */
@property(strong,nonatomic)UIButton *selectButton;
/*
 *头背景图
 */
@property(strong,nonatomic)UIView *headBgView;

/*
 *标题
 */
@property(strong,nonatomic)UILabel *titleLable;
@end

@implementation BusinessController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}
-(UIView *)headBgView{
    if(!_headBgView){
        _headBgView =[[UIView alloc]init];
        _headBgView.userInteractionEnabled=YES;
        _headBgView.backgroundColor=RGB(252, 199, 46);
        _headBgView.alpha=0.f;
        
        
    }
    
    return _headBgView;
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable =[[UILabel alloc]init];
        _titleLable.textAlignment=NSTextAlignmentCenter;
        _titleLable.textColor=[UIColor whiteColor];
        _titleLable.font=[UIFont systemFontOfSize:21 weight:UIFontWeightBold];
    }
    
    return _titleLable;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    //[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    if ([[NSString stringWithFormat:@"%@",[FNUserDefaults objectForKey:@"dengluren"]] isEqualToString:@"merchant"]        ) {
        BusinessUserViewController *bus=[[BusinessUserViewController alloc] init];;
        [self.navigationController pushViewController:bus animated:YES];
    }
    //去掉透明后导航栏下边的黑边
    //[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:nil];
    febxuangString=@"";
 
    self.navigationController.navigationBarHidden=YES;
  [self downLoad233455];
    if(mm){
        [self downLoad];
    }

}
-(void)setModel:(commodle *)model{
    
    _model=model;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    mm=1;
    self.btnSheet = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnSheet.frame = CGRectMake(0, 0, 100, 50);
    self.btnSheet.center = self.view.center;
    [self.btnSheet setTitle:@"show sheet" forState:UIControlStateNormal];
    [self.btnSheet addTarget:self action:@selector(actionSheet) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(btnnnn) name:@"SET_HAND_PWD1111" object:nil];
    [self.view addSubview:self.btnSheet];
    strrr=[[NSMutableArray alloc] init];
    totalArray=[[NSMutableArray alloc] init];
    totalArray1234=[[NSMutableArray alloc] init];
    self.urlScheme = @"demoURI://";
    self.appName = @"demoURI";
    NSString *lat=  [FNUserDefaults objectForKey:@"latitude"];
    NSString *log= [FNUserDefaults objectForKey:@"longitude"];
    self.coordinate = CLLocationCoordinate2DMake([lat floatValue],[log floatValue]);
    // Do any additional setup after loading the view from its nib.
    btnArray=[[NSMutableArray alloc] init];
    _items2 = [[NSMutableArray alloc] init];
    _items=[[NSMutableArray alloc] init];
    _items1=[[NSMutableArray alloc] init];
    _items3=[[NSMutableArray alloc] init];
    self.view.frame=CGRectMake(0, 0, ScreenW, kScreenSize.height);
   ;
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"nav_return_all"
                                                         higlightedImage:nil target:self action:@selector(back)];
    
    
    UIButton *left=[UIButton buttonWithType:UIButtonTypeCustom];
    left.frame=CGRectMake(5, 20, 40, 44);
    [left setImage:[UIImage imageNamed:@"fanhui123"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

    #pragma mark ---------分享----------
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     settingBtn.frame=CGRectMake(kScreenSize.width-40, 10, 40, 60);
    [settingBtn addTarget:self action:@selector(enterTeamCard) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"nav_btn_share"] forState:UIControlStateNormal];
  
   
    
    
    TotalArray1=[[NSMutableArray alloc] init];
  
//  [self downLoad];
    [self makeUi];
    [self.view addSubview:self.headBgView];
    [self.headBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@64);
    }];
    [self.headBgView addSubview:self.titleLable];
    
    CGFloat offy=-10;
    if (ScreenH==812) {
        offy=-5;
    }
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.headBgView.mas_bottom).offset(offy);
        make.size.mas_equalTo(CGSizeMake(200, 22));
    }];
    [self.view  addSubview:settingBtn];
        [self.view addSubview:left];
    self.interactiveTransition = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypeDismiss GestureDirection:XWInteractiveTransitionGestureDirectionDown];
    [self.interactiveTransition addPanGestureForViewController:self];
}
-(id)copyWithZone:(NSZone *)zone
{
    BusinessController *copy=[[[self class] allocWithZone:zone] ieenitWithName:_idn age:_inviter];
    
    return copy;
}
///-(void)setna
- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [XWCircleSpreadTransition transitionWithTransitionType:XWCircleSpreadTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [XWCircleSpreadTransition transitionWithTransitionType:XWCircleSpreadTransitionTypeDismiss];
}



- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return _interactiveTransition.interation ? _interactiveTransition : nil;
}
-(void)btnnnn
{
   // [self removeFromParentViewController];
}
-(void)enterehzFilesVC
{
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        LoginController *rigiste = [[LoginController alloc] init];
        rigiste.shouYe=@"shouye";
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
        
    if ([stree isEqualToString:@"0"]) {
       [informationCardBtn setImage:[UIImage imageNamed:@"guanzhu"] forState:UIControlStateNormal];
        [self downLoad1:idennn];
        stree=@"1";
    }else
    {
//        [informationCardBtn setImage:[UIImage imageNamed:@"huxingxing"] forState:UIControlStateNormal];
//        stree=@"1";
//        [self downLoad12:idennn];
    }
    }
 
}

// 分享
-(void)enterTeamCard
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
  
}
-(void)ShareButtion:(UIButton *)btn1
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
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];

    //创建网页内容对象
    NSString* thumbURL =  imageUrl;
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:introduction12 thumImage:thumbURL];
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
     

-(void)makeUi
{
     phoneArray=[[NSMutableArray alloc] init];
    _businessTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, kScreenSize.height) style:UITableViewStylePlain];
    _businessTableView.delegate=self;
    _businessTableView.backgroundColor=[UIColor colorWithHexString:@"#f4f4f3"];
    _businessTableView.dataSource=self;
    _businessTableView.backgroundColor=[UIColor  colorWithHexString:@"#e5e5e5"];
    _businessTableView.separatorStyle = UITableViewCellAccessoryNone;
    _businessTableView.showsVerticalScrollIndicator =
    NO;
    [self.view addSubview:_businessTableView];
    deleBtnArray=[[NSMutableArray alloc] init];
    imageViewArray=[[NSMutableArray alloc] init];

    _items = @[@"http://assets.esquire.co.uk/images/uploads/fourbythree/_540_43/l_236-four-of-the-best-american-muscle-cars-2.jpg",
               @"http://siliconangle.com/files/2012/03/github_logo.jpg",
               @"http://i.telegraph.co.uk/multimedia/archive/01806/earth_1806334c.jpg",
               @"http://kickstart.bikeexif.com/wp-content/uploads/2012/09/ducati-pantah-2.jpg"];
   
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    _header = [CExpandHeader expandWithScrollView:_businessTableView expandView:customView];
    imageViewBJ=[[UIImageView alloc] initWithFrame:(CGRect){ 0,0, SCREEN_WIDTH, 180
    }];
    
    //头图像
   
    //关键步骤 设置可变化背景view属性
    imageViewBJ.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleWidth;
    imageViewBJ.clipsToBounds = YES;
    imageViewBJ.contentMode = UIViewContentModeScaleAspectFill;
    [customView addSubview:imageViewBJ];
    
//    atDiscounttypeString
//fullReductiontypeString
//    if(self.model.)
    //头视图
    
    
    CGFloat height;
    NSString *actionType;
    if([self.model.acModel.fullReductiontypeString isEqualToString:@"-1"]&&[self.model.acModel.atDiscounttypeString isEqualToString:@"-1"]){
        actionType=@"0";
        height=170;
        
        
    }else if(![self.model.acModel.fullReductiontypeString isEqualToString:@"-1"]&&[self.model.acModel.atDiscounttypeString isEqualToString:@"-1"]){
        actionType=@"1";
      height=195;
        
    }else if([self.model.acModel.fullReductiontypeString isEqualToString:@"-1"]&& ![self.model.acModel.atDiscounttypeString isEqualToString:@"-1"]){
        
        actionType=@"2";
        height=195;
     
        
    }else{
        actionType=@"3";
        height=230;
        
        
    }
    
//    120
    shopView =[[shopInfoView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, height)];

    shopView.actionType=actionType;
    shopView.fullReductionContentLabel.text=self.model.acModel.fullReductioncativityString;
    shopView.atADiscountContentLabel.text=self.model.acModel.atDiscountactivityString;

    dianhua=shopView.makePhoneCallButton;
    [dianhua addTarget:self action:@selector(youhuimaidaw) forControlEvents:UIControlEventTouchUpInside];
     [shopView.offerToPayButton addTarget:self action:@selector(youhuimaida) forControlEvents:UIControlEventTouchUpInside];
//
    DituJingWei=shopView.locationIconButton;
//
    [DituJingWei addTarget:self action:@selector(DiTuDingWeibtn) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *actionTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DiTuDingWeibtn)];
    shopView.addressLabel.userInteractionEnabled=YES;
    [shopView.addressLabel addGestureRecognizer:actionTap];
    _introduction.tag=0;
    [_introduction addTarget:self action:@selector(DakeIntroduction:) forControlEvents:UIControlEventTouchUpInside];
     _businessTableView.tableHeaderView=shopView;
    
    imageView1 = [[UIImageView alloc] initWithFrame:(CGRect){ SCREEN_WIDTH/2-40, -40, 80, 80 }];
    [imageView1.layer setCornerRadius:40];
   // [imageView1 setImageWithPath:@"http://sportscommunity.com.au/wp-content/uploads/2013/01/sports-collage.jpg"];
    [shopView addSubview:imageView1];
    //尾视图


  //  [heat2 addSubview:li];
    [self  downLoad12345];
   
    heat2=[[HomeHear2 alloc] init];
    heat2.frame=CGRectMake(0, 0, kScreenSize.width, 450);


}
     
     
     
- (void)makeShangPin
 {
     
     amontTableView1 =[[UITableView alloc] initWithFrame:CGRectMake(0,0 , SCREEN_SIZE.width, SCREEN_SIZE.height) style:UITableViewStylePlain];
     amontTableView1.delegate=self;
     amontTableView1.dataSource=self;
     amontTableView1.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
    _businessTableView.tableFooterView=amontTableView1;
     
          switchView=[[UIView alloc] init];
     li=[[hear234 alloc] init];
     gengDuoSahngpu= heat2.chakanGenduoDianpu12;
     switchView.frame=CGRectMake(0,10, kScreenSize.width , 95);
     [gengDuoSahngpu addTarget:self action:@selector(GengBuopingLun1) forControlEvents:UIControlEventTouchUpInside];
     li.frame=CGRectMake(0, 0, kScreenSize.width, 94);
     GengBuopingLun=heat2.gengduo;
     [GengBuopingLun addTarget:self action:@selector(GengBuopingLun) forControlEvents:UIControlEventTouchUpInside];
     
     [switchView addSubview:li];
     switchBtn5=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn5 setTitle:@"商品"forState:UIControlStateNormal];
     switchBtn5.tag=6000;
     switchBtn5.titleLabel.font=[UIFont systemFontOfSize:15];
     switchBtn5.titleLabel.textColor=[UIColor colorWithHexString:BunRed];
     [switchBtn5 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
     [switchBtn5 addTarget:self action:@selector(switchButton12:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn5.frame=CGRectMake(0,47, kScreenSize.width/2 ,  48);
     [li  addSubview:switchBtn5];
     
     switchBtn4=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn4 setTitle:@"评价"forState:UIControlStateNormal];
     switchBtn4.tag=6001;
     switchBtn4.titleLabel.font=[UIFont systemFontOfSize:15];
     [switchBtn4 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
     [switchBtn4 addTarget:self action:@selector(switchButton12:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn4.frame=CGRectMake( kScreenSize.width/2,47, kScreenSize.width/2 ,48 );
     [li addSubview:switchBtn4];
//     lineView=[[UIView alloc] init];
//
//     lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame)-1, switchBtn.frame.size.width, 1);
//     lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
//     [switchView addSubview:lineView];
     
     lineView1=[[UIView alloc] init];
     
     lineView1.frame = CGRectMake(kScreenSize.width/4-10, CGRectGetMaxY(switchBtn4.frame)-1, 20, 1);
     lineView1.backgroundColor = [UIColor colorWithHexString:BunRed];;
     [switchView addSubview:lineView1];
      amontTableView1.tableHeaderView=switchView;
     
  
     amontTableView1.tableFooterView=self.amontTableView2;
     if(mm){
        [self downLoad];
     }
     
 
     mm=0;
       NSArray*  array=@[@"全部分类",@"美食频道",@"酒店娱乐",@"生活服务",@"家装频道",@"运动健身",@"亲子母婴"];
     makeFenleiView=[[UIScrollView alloc] init];
     makeFenleiView.frame=CGRectMake(0,95, 80,43*(TotalArray1.count+1));
     if (iPhone6p) {
         makeFenleiView.frame=CGRectMake(0,95, 80,44*(TotalArray1.count+1));
     }
     
     makeFenleiView.contentSize=CGSizeMake(80, 44*(TotalArray1.count+1)+10);
     makeFenleiView.alpha=1;
     makeFenleiView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
     [amontTableView1 addSubview:makeFenleiView];
     int  im=0;
    // makeFenLei=@"2";
     
    // UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
    // btnn.frame=CGRectMake(0, 1, kScreenSize.width/2, 43);
    // btnn.tag=1000;
     //            CategoriesModel2 *make=[[CategoriesModel2 alloc] init];
     //            make=categoryCountList[y];
     //btnn.titleLabel.font=[UIFont systemFontOfSize:13];
   //  btnn.titleLabel.font=[UIFont systemFontOfSize:13];
   //  [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   //  btnn.backgroundColor=[UIColor whiteColor];
   //  [btnn addTarget:self action:@selector(btnnnaaaaaabtnfenlei:) forControlEvents:UIControlEventTouchUpInside];
    // [btnn setTitle:@"全部分类"forState:UIControlStateNormal];
    // [makeFenleiView addSubview:btnn];
   //  [BtnAaarray addObject:btnn];
     array=@[@"全部分类",@"美食频道",@"酒店娱乐",@"生活服务",@"家装频道",@"运动健身",@"亲子母婴"];
     NSLog(@"ggggg%lu",(unsigned long)TotalArray1.count);
     for (int y=0; y<TotalArray1.count; y++) {
         UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
         btnn.frame=CGRectMake(0, im*43.5, 80, 43);
         BussFenLeiModel *ma=[[BussFenLeiModel alloc] init];
         ma=TotalArray1[y];
         btnn.tag=im;
         //CategoriesModel2 *make=[[CategoriesModel2 alloc] init];
      //   make=categoryCountList[y];
         //btnn.titleLabel.font=[UIFont systemFontOfSize:13];
         btnn.titleLabel.font=[UIFont systemFontOfSize:13];
         if(y==0){
             [self buttonselectState:btnn];
             
         }else{
             [self buttonNomState:btnn];
         }
         
         [btnn addTarget:self action:@selector(btnnnaaaaaabtnfenlei:) forControlEvents:UIControlEventTouchUpInside];
         [btnn setTitle:[NSString  stringWithFormat:@"%@",ma.name]     forState:UIControlStateNormal];
         [makeFenleiView addSubview:btnn];
        // [BtnAaarray addObject:btnn];
//         if (y==0) {
//             [btnn setTitleColor:[UIColor colorWithHexString:@"#f1314a"] forState:UIControlStateNormal];
//             btnn.backgroundColor=[UIColor  colorWithHexString:kAllViewBgColor];
//
//           //  [self downLoad123456:make.twoCategoryList];
//         }
         im++;
     }

     
 }
     #pragma mark ---------分类按钮正常情况----------
-(void)buttonNomState:(UIButton*)button{
         
         button.titleLabel.font=[UIFont systemFontOfSize:13];
         [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         
         
     }
     #pragma mark ---------分类按钮选中----------
-(void)buttonselectState:(UIButton*)button{
    self.selectButton=button;
         button.titleLabel.font=[UIFont systemFontOfSize:15 weight:UIFontWeightBold];
         [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}
-(UITableView *)amontTableView2{
    if(!_amontTableView2){
        
        _amontTableView2 =[[UITableView alloc] initWithFrame:CGRectMake(80,0 , SCREEN_SIZE.width, SCREEN_SIZE.height) style:UITableViewStylePlain];
        _amontTableView2.delegate=self;
        _amontTableView2.dataSource=self;
        _amontTableView2.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
        _amontTableView2.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    }
         
         return _amontTableView2;
}
-(void)btnnnaaaaaabtnfenlei:(UIButton *)btn
{
    
    [self buttonNomState:self.selectButton];
//    self.selectButton=btn;
    [self buttonselectState:btn];
    NSInteger indexInt= btn.tag;
    
    BussFenLeiModel*model=TotalArray1[indexInt];
    
    [self downLoad1234567890WithCateID:model.idn];
        
        
        
        
}
     
-(void)makePingLun
 {
     TotalArray=[[NSMutableArray alloc] init];
     //str=@"￥ 这就是人民币符号，首先我们应弄明白这个符号怎么读，然后再根据你安装的输入法来打出来，下面小编就和大家一起学习人民币符号怎么打吧。";
     mau=@"0";
     amontTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height) style:UITableViewStylePlain];
     amontTableView.delegate=self;
     amontTableView.dataSource=self;
     amontTableView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
     [heat2 addSubview:amontTableView];
 
     //
     pageNum=1;
     total=0;
     total=0;
     total1=0;
     total2=0;
     total3=0;
     switchView=[[UIView alloc] init];
     li=[[hear234 alloc] init];
     gengDuoSahngpu= heat2.chakanGenduoDianpu12;
     switchView.frame=CGRectMake(0,10, kScreenSize.width , 144);    
     [gengDuoSahngpu addTarget:self action:@selector(GengBuopingLun1) forControlEvents:UIControlEventTouchUpInside];
     li.frame=CGRectMake(0, 0, kScreenSize.width, 94);
     GengBuopingLun=heat2.gengduo;
     [GengBuopingLun addTarget:self action:@selector(GengBuopingLun) forControlEvents:UIControlEventTouchUpInside];
     
     [switchView addSubview:li];
     switchBtn5=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn5 setTitle:@"商品"forState:UIControlStateNormal];
     switchBtn5.tag=6000;
     switchBtn5.titleLabel.font=[UIFont systemFontOfSize:15];
     switchBtn5.titleLabel.textColor=[UIColor colorWithHexString:BunRed];
     [switchBtn5 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
     [switchBtn5 addTarget:self action:@selector(switchButton12:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn5.frame=CGRectMake(0,47, kScreenSize.width/2 ,  48);
     [li  addSubview:switchBtn5];
     
     switchBtn4=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn4 setTitle:@"评价"forState:UIControlStateNormal];
     switchBtn4.tag=6001;
     switchBtn4.titleLabel.font=[UIFont systemFontOfSize:15];
     [switchBtn4 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
     [switchBtn4 addTarget:self action:@selector(switchButton12:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn4.frame=CGRectMake( kScreenSize.width/2,47, kScreenSize.width/2 ,48 );
     [li addSubview:switchBtn4];
     switchView.backgroundColor=[UIColor whiteColor];
     switchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn setTitle:@"全部(0)"forState:UIControlStateNormal];
     switchBtn.tag=2000;
     switchBtn.titleLabel.font=[UIFont systemFontOfSize:15];
     switchBtn.titleLabel.textColor=[UIColor colorWithHexString:BunRed];
     [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
     [switchBtn addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn.frame=CGRectMake(0,93, kScreenSize.width/4 ,  50);
     [switchView addSubview:switchBtn];
     
     switchBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn1 setTitle:@"好评（0）"forState:UIControlStateNormal];
     switchBtn1.tag=2001;
     switchBtn1.titleLabel.font=[UIFont systemFontOfSize:15];
     [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
     [switchBtn1 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn1.frame=CGRectMake( kScreenSize.width/4,93, kScreenSize.width/4 ,50 );
     [switchView addSubview:switchBtn1];
     
     switchBtn2=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn2 setTitle:@"中评（0）"forState:UIControlStateNormal];
     switchBtn2.tag=2002;
     switchBtn2.titleLabel.font=[UIFont systemFontOfSize:15];
     [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
     [switchBtn2 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn2.frame=CGRectMake(2*kScreenSize.width/4,93, kScreenSize.width/4 ,50 );
     [switchView addSubview:switchBtn2];
     
     switchBtn3=[UIButton buttonWithType:UIButtonTypeCustom];
     [switchBtn3 setTitle:@"差评（0）"forState:UIControlStateNormal];
     switchBtn3.tag=2003;
     switchBtn3.titleLabel.font=[UIFont systemFontOfSize:15];
     [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
     [switchBtn3 addTarget:self action:@selector(switchButton:) forControlEvents:UIControlEventTouchUpInside];
     switchBtn3.frame=CGRectMake(3*kScreenSize.width/4,93, kScreenSize.width/4 ,50 );
     [switchView addSubview:switchBtn3];
     switchBtn.selected=YES;
     lineView=[[UIView alloc] init];
     
     lineView.frame = CGRectMake(0, CGRectGetMaxY(switchBtn.frame)-1, switchBtn.frame.size.width, 1);
     lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
     [switchView addSubview:lineView];
     
     lineView1=[[UIView alloc] init];
     
     lineView1.frame = CGRectMake(kScreenSize.width/4-10, CGRectGetMaxY(switchBtn4.frame)-1, 20, 1);
     lineView1.backgroundColor = [UIColor colorWithHexString:BunRed];;
     [switchView addSubview:lineView1];
     amontTableView.tableHeaderView=switchView;
     
     [self downLoad3];
     [self downLoad2];
     [self downLoad1];
     [self downLoad23];
//     MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
//     amontTableView.header = header;
     // 上拉
     amontTableView.separatorStyle = UITableViewCellSelectionStyleNone;
     MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upPullloadData)];
     amontTableView1.footer = footer;
     _businessTableView.tableFooterView=amontTableView;
 }
     -(void)downLoad23
    {
        NSDictionary *paramDic = @{
                                   @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                   @"type":@"0",
                                   @"pageSize":@"10",
                                   @"merchantId":idennn
                                   
                                   };
        ;
        //NSString *srrrr=@"";
        NSMutableArray *maqq=[[NSMutableArray alloc] init];
        if(total==0||(pageNum-1)*10<total) {
            [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/merchants/%@/comments",idennn] params:paramDic success:^(id data) {
                
                for (NSDictionary *dict in data[@"comments"][@"list"]) {
                    PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
                    [maqq addObject:ma];
                }
                
                total=[data[@"total"]   intValue]        ;
                [switchBtn setTitle:[NSString stringWithFormat:@"全部(%@)",data[@"total"]]forState:UIControlStateNormal];
                [TotalArray removeAllObjects];
                [TotalArray addObjectsFromArray:maqq];
                [amontTableView reloadData];
                
                NSLog(@"%@",data);
                [amontTableView.header endRefreshing];
                [amontTableView.footer endRefreshing];
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
     -(void)downLoad1
    {
        NSDictionary *paramDic = @{
                                   @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                   @"pageSize":@"10",
                                   @"type":@"3",
                                   @"merchantId":idennn
                                   };
        ;
        //NSString *srrrr=@"";
        NSMutableArray *maqq=[[NSMutableArray alloc] init];
        if(total1==0||(pageNum-1)*10<total1) {
            [HttpTool getWithBaseURL:kBaseURL path:[NSString stringWithFormat:@"/merchants/%@/comments",idennn] params:paramDic success:^(id data) {
                
                for (NSDictionary *dict in data[@"comments"][@"list"]) {
                    PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
                    [maqq addObject:ma];
                }
                total1=[data[@"favourableCount"]   intValue]        ;
                [switchBtn1 setTitle:[NSString stringWithFormat:@"好评(%@)",data[@"favourableCount"]]forState:UIControlStateNormal];
                [TotalArray removeAllObjects];
                [TotalArray addObjectsFromArray:maqq];
                [amontTableView reloadData];
                NSLog(@"%@",data);
                [amontTableView.header endRefreshing];
                [amontTableView.footer endRefreshing];
            } failure:^(NSError *error) {
                [amontTableView.header endRefreshing];
                [amontTableView.footer endRefreshing];
            } alertInfo:^(NSString *alertInfo) {
                [amontTableView.header endRefreshing];
                [amontTableView.footer endRefreshing];
            }];}
        else
        {
            [amontTableView.header endRefreshing];
            [amontTableView.footer endRefreshing];
        }
    }
     
     -(void)downLoad2
    {
        NSDictionary *paramDic = @{
                                   @"pageNum":[NSString stringWithFormat:@"%d",pageNum],
                                   @"pageSize":@"10",
                                   @"type":@"2",
                                   @"merchantId":idennn
                                   };
        ;
        //NSString *srrrr=@"";
        NSMutableArray *maqq=[[NSMutableArray alloc] init];
        if(total2==0||(pageNum-1)*10<total2) {
            [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/merchants/%@/comments",idennn] params:paramDic success:^(id data) {
                
                for (NSDictionary *dict in data[@"comments"][@"list"]) {
                    PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
                    [maqq addObject:ma];
                }
                total2=[data[@"positiveCount"]   intValue]        ;
                [TotalArray removeAllObjects];
                [TotalArray addObjectsFromArray:maqq];
                [amontTableView reloadData];
                [switchBtn2 setTitle:[NSString stringWithFormat:@"中评(%@)",data[@"positiveCount"]]forState:UIControlStateNormal];
                NSLog(@"%@",data);
                [amontTableView.header endRefreshing];
                [amontTableView.footer endRefreshing];
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
     -(void)downLoad3
    {
        NSDictionary *paramDic = @{
                                   @"pageNum":[NSString stringWithFormat:@"%d",pageNum] ,
                                   @"pageSize":@"10",
                                   @"type":@"1",
                                   @"merchantId":idennn
                                   
                                   };
        ;
        //NSString *srrrr=@"";
        NSMutableArray *maqq=[[NSMutableArray alloc] init];
        if(total3==0||(pageNum-1)*10<total3) {
            [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/merchants/%@/comments",idennn] params:paramDic success:^(id data) {
                
                for (NSDictionary *dict in data[@"comments"][@"list"]) {
                    PingLunModel *ma=[[PingLunModel alloc] initWithDict:dict];
                    [maqq addObject:ma];
                }
                total3=[data[@"negativeCount"]   intValue]        ;
                [TotalArray removeAllObjects];
                [TotalArray addObjectsFromArray:maqq];
                [amontTableView reloadData];
                [switchBtn3 setTitle:[NSString stringWithFormat:@"差评(%@)",data[@"negativeCount"]]forState:UIControlStateNormal];
                NSLog(@"%@",data);
                [amontTableView.header endRefreshing];
                [amontTableView.footer endRefreshing];
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
#pragma mark 下拉刷新
     - (void)dowPullloadData
    {
        pageNum=1;
        
        if ([mau isEqualToString:@"0"]) {
            [self downLoad23];
        }
        else if([mau isEqualToString:@"1"])
        {
            [self downLoad1];
        }else if ([mau isEqualToString:@"2"])
        {
            [self downLoad2];
        }else
        {
            [self downLoad3];
        }
        
    }
#pragma mark 上拉刷新
     - (void)upPullloadData
    {
        pageNum = ++pageNum;
        
        if ([mau isEqualToString:@"0"]) {
            [self downLoad23];
        }
        else if([mau isEqualToString:@"1"])
        {
            [self downLoad1];
        }else if ([mau isEqualToString:@"2"])
        {
            [self downLoad2];
        }else
        {
            [self downLoad3];
        }
        
        // strxuaxin=@"ture";
        // [self DownLoadView];;
        
    }
     -(void)switchButton12:(UIButton *)btn
     {
         //    if (![self checkNet]) {
         //        [MBProgressHUD showError:NO_CONNECT_NET];
         //        return;
         //    }
         if (btn.tag==6000) {
             pageNum = 1;
             statut=1;
             [amontTableView1 removeFromSuperview];
             [self makeShangPin];
             [switchBtn5 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
             [switchBtn4 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
           
             mau=@"0";
//             [self downLoad23];

         }
         else if(btn.tag==6001)
         {
             [amontTableView removeFromSuperview];
             statut=2;
             pageNum = 1;
             
             [self makePingLun];
             [switchBtn5 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
             [switchBtn4 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
             switchBtn1.selected=YES;
             switchBtn.selected=NO;
             switchBtn2.selected=NO;
             mau=@"1";
//             [self downLoad23];
   
             
             
             
         }
         
         
         
         [UIView animateWithDuration:0.3 animations:^{
             lineView1.frame = CGRectMake(btn.frame.origin.x+kScreenSize.width/4-10, CGRectGetMaxY(btn.frame)-1, 20, 1);
         }];
         //[amontTableView reloadData];
         
     }
     
     -(void)switchButton:(UIButton *)btn
    {
        //    if (![self checkNet]) {
        //        [MBProgressHUD showError:NO_CONNECT_NET];
        //        return;
        //    }
        if (btn.tag==2000) {
            pageNum = 1;
            statut=1;
            
            [switchBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
            [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            mau=@"0";
            [self downLoad23];
            // [amontTableView reloadData];
        }
        else if(btn.tag==2001)
        {
            statut=2;
            pageNum = 1;
            
            [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
            [switchBtn1 setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
            switchBtn1.selected=YES;
            switchBtn.selected=NO;
            switchBtn2.selected=NO;
            mau=@"1";
            [self downLoad1];
            // [cell removeFromSuperview];
            
            
            
        }
        
        
        else
            if(btn.tag==2002)
            {
                statut=2;
                pageNum = 1;
                [switchBtn3 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
                [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
                [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
                [switchBtn2 setTitleColor:[UIColor colorWithHexString:BunRed] forState:
                 UIControlStateNormal];
                
                switchBtn1.selected=YES;
                switchBtn.selected=NO;
                switchBtn2.selected=NO;
                mau=@"2";
                [self downLoad2];
                // [cell removeFromSuperview];
                
                
                
            }
            else
            {
                pageNum = 1;
                statut=3;
                
                [switchBtn setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
                [switchBtn1 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
                [switchBtn3 setTitleColor:[UIColor colorWithHexString:BunRed] forState:
                 UIControlStateNormal];
                [switchBtn2 setTitleColor:[UIColor colorWithHexString:@"#a0a0a0"] forState:UIControlStateNormal];
                switchBtn2.selected=YES;
                switchBtn.selected=NO;
                switchBtn1.selected=NO;
                mau=@"3";
                [self downLoad3];
                // [amontTableView reloadData];
            }
        [UIView animateWithDuration:0.3 animations:^{
            lineView.frame = CGRectMake(btn.frame.origin.x, CGRectGetMaxY(btn.frame)-1, switchBtn.frame.size.width, 1);
        }];
        //[amontTableView reloadData];
        
    }
-(void)GengBuopingLun
{
    DianPuPingJiaViewController *mamm=[[DianPuPingJiaViewController alloc] init];
    mamm.idn= idennn;
    [self.navigationController pushViewController:mamm animated:YES];
}
-(void)GengBuopingLun1
{

    [self.navigationController popViewControllerAnimated:YES];
}
     #pragma mark ---------优惠买单----------
     
     
-(void)youhuimaida
{
    
    
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        OtherWaysLoginController *rigiste = [[OtherWaysLoginController alloc] init];
        rigiste.inviter=_inviter;
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
    ConsumptionController *na=[[ConsumptionController alloc] init];
    na.theStoreID= shcode;
        na.cgBUS=@"0";
    na.zhekou123=szhekou;
    na.title=shopView.shopNameLabel.text;
        na.theNumber=@"1";
        na.OrderType=@"1";
        na.nnnnn=@"0";
        na.theStoreCode=shcode;
        na.theOriginalPrice=@"0";
        na.theStoreID=_idn;
    [self.navigationController pushViewController:na animated:YES];
    }
}
#pragma mark 电话 
-(void)youhuimaidaw
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",photo]]];
}

#pragma mark alertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
  
        if (0 == buttonIndex) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",photo]]];
        }
  
    
    
    
}

#pragma mark 返回
-(void)diZiBtn
{
  
//    _cell.selectionStyle=UITableViewCellAccessoryNone;
//   businDiZiModel=_items2[0];
//    NSString *stringURL=[NSString stringWithFormat:@"%@xifanApp//base/gaode/getLocation?latitude=%@&&longitude=%@&type=0&id=%@",BASE_URL, businDiZiModel.latitude, businDiZiModel.longitude,businDiZiModel.m_id];
//    MapViewController *map=[[MapViewController alloc] init];
//    map.string=stringURL;
//    map.string2=businDiZiModel.m_name;
//    [self.navigationController pushViewController:map animated:YES];
}
#pragma mark 地图定位
-(void)DiTuDingWeibtn
{
    [self geoCode];
    //添加白名单列表
    __block NSString *urlScheme = self.urlScheme;
    __block NSString *appName = self.appName;
    __block CLLocationCoordinate2D coordinate = self.coordinate;
//    NSString *lat=  [FNUserDefaults objectForKey:@"latitude"];
//    NSString *log= [FNUserDefaults objectForKey:@"longitude"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //这个判断其实是不需要的
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]])
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            CLGeocoder*geocoder=[CLGeocoder new];
            
            //实现地理编码方法 可能出现重明的问题。一定要给用户提供个选择
            
            
            [geocoder geocodeAddressString:Dizhi123 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                
                //placemarks: 地标数组 --》主要的是CLLocation
                //遍历数组
                if (placemarks.count==0||error) {
                    NSLog(@"解析有问题");
                    return ;
                }
                
                CLPlacemark *pm=placemarks.firstObject;
                MKPlacemark *mkpm=[[MKPlacemark alloc] initWithPlacemark:pm];
                //    //创建MKMapItem
                MKMapItem *destinationItem=[[MKMapItem alloc] initWithPlacemark:mkpm];
                //    //MKMapItem 地图上的点
                //openMapsWithItem 调用此方法就可以打开系统自带地图
                [MKMapItem openMapsWithItems:@[destinationItem]launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
                
                
            }];

        }];
       
        [alert addAction:action];
        
        
        
        
        
    }
    
//    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]])
//    {
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//
//            NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=%@&mode=driving&coord_type=gcj02",coordinate.latitude, coordinate.longitude,Dizhi123] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//            NSLog(@"%@",urlString);
//
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
//
//        }];
//
//        [alert addAction:action];
//    }
//
    
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]])
    {
        
        
//        CLLocationCoordinate2D  amapcoo=
//        AMapCoordinateConvert(CLLocationCoordinate2DMake(1,3), AMapCoordinateConvert);
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSString *targetName = Dizhi123;
//            116.376009,39.895848
  
//iosamap://navi?sourceApplication=%@&poiname=%@&poiid=%@&lat=36.547901&lon=104.258354&dev=1&style=2
            NSString *gaodeParameterFormat = @"iosamap://navi?sourceApplication=%@&poiname=%@&poiid=BGVIS&lat=%f&lon=%f&dev=1&style=2";
                NSString *urlString = [[NSString stringWithFormat:
                                        gaodeParameterFormat,
                                        @"yourAppName",
                                        @"yourAppUrlSchema",
//                                        @"",
                                        self.endCoordinate.latitude,
                                        self.endCoordinate.longitude]
    stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString
//                                                            @"iosamap://navi?sourceApplication=applicationName&poiname=fangheng&poiid=BGVIS&lat=39.897114&lon=116.375620&dev=1&style=2"
                                                            ]];
                
            
            
        }];
        
        [alert addAction:action];
    }
    
//    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]])
//    {
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"谷歌地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//
//            NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",appName,urlScheme,coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//            NSLog(@"%@",urlString);
//
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
//
//        }];
//
//        [alert addAction:action];
//    }
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
   
    [self presentViewController:alert animated:YES completion:^{
        
    }];

    

    
}
#pragma mark 尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
     
{
        if (iPhone5) {
            return (120+20*str.length/20+10) *TotalArray.count;
        }else
        {
            return (120+20*str.length/20+10) *TotalArray.count;
        }
        
}
#pragma mark 返回
- (void)back
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD12333" object:nil];
    [self.navigationController  popViewControllerAnimated:YES];
    
}
-(void)faBiaoBtn
{
   [self shouQiBtn];
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
if([tableView isEqual:amontTableView]){
    
    static NSString *cellName=@"cell";
    cell2=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell2==nil) {
        cell2=[[[NSBundle mainBundle] loadNibNamed:@"PingLunDianPuTableViewCell" owner:self options:nil] lastObject];
        }
    
    PingLunModel *ma=[[PingLunModel alloc] init];
    ma=TotalArray[indexPath.row];
    str=ma.commentInfo;
    cell2.selectionStyle = UITableViewCellAccessoryNone;
    cell2.label.text=ma.commentInfo;
    //cell.label.backgroundColor=[UIColor blueColor];
    cell2.label.frame=CGRectMake(0, 0,kScreenSize.width/3 , 20*ma.commentInfo.length/20+10);
    //cell.touZiJinE.text=[NSString stringWithFormat:@"%@元",hom.investmentAmount];
    cell2.shouji.text=ma.userName;
    cell2.shijian.text=ma.commentTimeStr;
    
    
    float num=[ma.commentGrade  floatValue];
    
    NSString *imageNameString;
    for (int i=0; i<5; i++) {
        if (i>num-1) {
            imageNameString=@"huxingxing";
        }else{
            imageNameString=@"icon_star";
        }
        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:imageNameString]];
        image.frame=CGRectMake(i*12+3,0,12,13);
        [cell2.theStratImage addSubview:image];
        
    }
    
    
//    makeView=[[UIView alloc] init];
//    makeView1=[[UIView alloc] init];
//    int num=[shopView.scoreLabel.text intValue];
//    makeView.frame=CGRectMake(80, 60, 12*5, 15);
//    makeView1.frame=CGRectMake(80,60, 12*num, 15);
//    makeView1.clipsToBounds=YES;
//
//    [cell2 addSubview:makeView];
//    [cell2 addSubview:makeView1];
//
    
    
    
    
//    for (int i=0; i<5; i++) {
//        UIImageView *image1=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"huxingxing"]];
//
//        image1.frame=CGRectMake(i*12, 0,12,13);
//        [makeView addSubview:image1];
//
//        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
//
//        image.frame=CGRectMake(i*12,0,12,13);
//        [makeView1 addSubview:image];
//
//
//
//    }
    
    return cell2;
    
}
else if([tableView isEqual:self.amontTableView2])
{

    
    static NSString *cellName = @"cell1";
    NSMutableArray* array3=[[NSMutableArray alloc] init];;
    HomeTabTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell)
        {
           
                cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTabTableViewCell" owner:self options:nil] lastObject];
            
        }
    cell.tupian.hidden=YES;
   // @property (weak, nonatomic) IBOutlet UILabel *miaoshu;
//    @property (weak, nonatomic) IBOutlet UILabel *monry;
//    @property (weak, nonatomic) IBOutlet UILabel *name;
//    @property (weak, nonatomic) IBOutlet UIImageView *tupian;
//    @property (weak, nonatomic) IBOutlet UIImageView *imageName;
    shangpu *na=[[shangpu alloc] init];
    na=totalArray1234[indexPath.row];
    cell.miaoshu.text=na.descp;
    cell.monry.text=[NSString stringWithFormat:@"¥%@", na.goodsPrice];           ;
    cell.name12.text=na.goodsName;
    cell.name.hidden=YES;
    cell.selectionStyle=UITableViewCellAccessoryNone;
    cell.cotegor1.hidden=YES;
     cell.cotegor2.hidden=YES;
     cell.cotegor3.hidden=YES;
     cell.cotegor4.hidden=YES;
     cell.cotegor5.hidden=YES;

    cell.selectionStyle = UITableViewCellAccessoryNone; //去掉点击效果
    [cell.imageName sd_setImageWithURL:[NSURL URLWithString:na.mainImage] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [cell.imageName sd_setImageWithURL:[NSURL URLWithString:na.mainImage] placeholderImage:nil options:SDWebImageProgressiveDownload];
            cell.viewForFirstBaselineLayout.backgroundColor=[UIColor colorWithHexString:@"#f4f4f3"];
    
       return cell;
}
    
else if([tableView isEqual:_businessTableView])
{
    static NSString *cellName = @"cell1";
    NSMutableArray* array3=[[NSMutableArray alloc] init];;
    HomeTabTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTabTableViewCell" owner:self options:nil] lastObject];
        
    }
    cell.tupian.hidden=YES;
    // @property (weak, nonatomic) IBOutlet UILabel *miaoshu;
    //    @property (weak, nonatomic) IBOutlet UILabel *monry;
    //    @property (weak, nonatomic) IBOutlet UILabel *name;
    //    @property (weak, nonatomic) IBOutlet UIImageView *tupian;
    //    @property (weak, nonatomic) IBOutlet UIImageView *imageName;
    shangpu *na=[[shangpu alloc] init];
    na=totalArray[indexPath.row];
    cell.miaoshu.text=na.descp;
    cell.monry.text=[NSString stringWithFormat:@"¥%@", na.goodsPrice];           ;
    cell.name12.text=na.goodsName;
    cell.name.hidden=YES;
    cell.selectionStyle=UITableViewCellAccessoryNone;
    cell.cotegor1.hidden=YES;
    cell.cotegor2.hidden=YES;
    cell.cotegor3.hidden=YES;
    cell.cotegor4.hidden=YES;
    cell.cotegor5.hidden=YES;
    
    cell.selectionStyle = UITableViewCellAccessoryNone; //去掉点击效果
    [cell.imageName sd_setImageWithURL:[NSURL URLWithString:na.mainImage] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [cell.imageName sd_setImageWithURL:[NSURL URLWithString:na.mainImage] placeholderImage:nil options:SDWebImageProgressiveDownload];
    cell.viewForFirstBaselineLayout.backgroundColor=[UIColor colorWithHexString:@"#f4f4f3"];
    
    return cell;
}



else
    {
        static NSString *cellName = @"cell1";
       // NSMutableArray* array3=[[NSMutableArray alloc] init];;
        HomeTabTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell)
        {

            cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTabTableViewCell" owner:self options:nil] lastObject];

        }
        cell.tupian.hidden=YES;
        // @property (weak, nonatomic) IBOutlet UILabel *miaoshu;
        //    @property (weak, nonatomic) IBOutlet UILabel *monry;
        //    @property (weak, nonatomic) IBOutlet UILabel *name;
        //    @property (weak, nonatomic) IBOutlet UIImageView *tupian;
        //    @property (weak, nonatomic) IBOutlet UIImageView *imageName;
        shangpu *na=[[shangpu alloc] init];
        na=totalArray[indexPath.row];
        cell.miaoshu.text=na.descp;
        cell.monry.text=[NSString stringWithFormat:@"¥%@", na.goodsPrice];           ;
        cell.name12.text=na.goodsName;
        cell.name.hidden=YES;
        cell.selectionStyle=UITableViewCellAccessoryNone;
        cell.cotegor1.hidden=YES;
        cell.cotegor2.hidden=YES;
        cell.cotegor3.hidden=YES;
        cell.cotegor4.hidden=YES;
        cell.cotegor5.hidden=YES;

        cell.selectionStyle = UITableViewCellAccessoryNone; //去掉点击效果
        [cell.imageName sd_setImageWithURL:[NSURL URLWithString:na.mainImage] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
        [cell.imageName sd_setImageWithURL:[NSURL URLWithString:na.mainImage] placeholderImage:nil options:SDWebImageProgressiveDownload];
        cell.viewForFirstBaselineLayout.backgroundColor=[UIColor colorWithHexString:@"#f4f4f3"];
        
        return cell;
    
    }
    
    
    }

 


#pragma mark table个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:amontTableView]) {
      return TotalArray.count;
        
    }
    else if( [tableView isEqual:_businessTableView]) {
        return totalArray.count; //_items.count;
    }
    else if([tableView isEqual:self.amontTableView2])
    {
        return totalArray1234.count; //_items.count;
    }
    else
    {
         return 0;
    }
   
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:amontTableView]) {
       return 120+20*str.length/20+10;
    }
    else{
         return 120;;
    }
   
}
#pragma 内容箭头上拉下拉点击事件
-(void)DakeIntroduction:(UIButton *)btn
{
    
    
    if (btn.tag==0) {
      labelSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(SCREEN_WIDTH-20, 10000) lineBreakMode:NSLineBreakByCharWrapping];
        label.frame = CGRectMake(10,75, SCREEN_WIDTH-20, labelSize.height+10);
        label.numberOfLines=0;
        _introduction.tag=1;//如果下滑动将tag变为一
        shopView.frame=CGRectMake(0, 0, SCREEN_WIDTH,(int)labelSize.height+75+20+20);

        [_introduction setImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];
//         _businessTableView.tableHeaderView=heat;
         [_businessTableView reloadData];
    }
    
    else if(btn.tag==1)
   {
       labelSize.height=0;
    label.frame=CGRectMake(10, 73, SCREEN_WIDTH-20, 30);
       shopView.frame=CGRectMake(0, 0, SCREEN_WIDTH,120 );

     [_introduction setImage:[UIImage imageNamed:@"21"] forState:UIControlStateNormal];
    _introduction.tag=0;
//    _businessTableView.tableHeaderView=heat;
        [_businessTableView reloadData];

  }
   

    
}
//#pragma mark 点击收藏
//-(void)shouCangBtn:(UIButton *)btn1
//{
//
//}

#pragma mark 地址下拉按钮
-(void)xialaBtn:(UIButton *)btn2
{
    if (btn2.tag==2001) {
        [UIView animateWithDuration:1 animations:^{
            _diZiTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 253*2+12111) style:UITableViewStylePlain];
            
        }];
       
        _diZiTableView.delegate=self;
        _diZiTableView.backgroundColor=[UIColor colorWithHexString:@"#f4f4f3"];
        _diZiTableView.dataSource=self;
        _diZiTableView.tag=1001;
        btn2.tag=2002;
        _diZiTableView.backgroundColor=[UIColor  colorWithHexString:@"#e5e5e5"];

        _businessTableView.tableFooterView=_diZiTableView;
        _diZiTableView.scrollEnabled =NO;
        _diZiTableView.tableHeaderView=heat2;
        [xialaBtn setImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];
    }
    else
    {
        btn2.tag=2001;
        [_businessTableView.tableFooterView  removeFromSuperview];
         _businessTableView.tableFooterView=heat2;
        [xialaBtn setImage:[UIImage imageNamed:@"21"] forState:UIControlStateNormal];
    }
    
}
#pragma mark tar点击图
-(void)tarViewBtn:(UIButton *)btn4
{

   
}
- (void)keyboardWasShown:(NSNotification*)aNotification
{
   
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    

   
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    

    return YES;
}


#pragma mark 收起键盘
-(void)shouQiBtn
{
    [imageView2 removeFromSuperview];
    [btnq removeFromSuperview];
    [pingLun removeFromSuperview];
    [jianPan removeFromSuperview];
    [pingLunField resignFirstResponder];
}
-(void)WalletBtn:(UIButton *)btn
{
//    jianPan.frame=CGRectMake(0, SCREEN_HEIGHT-88, SCREEN_WIDTH,88);
//    addTupian=jianPan.addTupian;
//    [addTupian addTarget:self action:@selector(addTupianBtn) forControlEvents:UIControlEventTouchUpInside];
//   
//    n=8;
//    [self.view addSubview:jianPan];
//    pingLun.frame=CGRectMake(0, SCREEN_HEIGHT-49-88, SCREEN_WIDTH, 49);
//    [self.view addSubview:pingLun];
//    [pingLunField resignFirstResponder];

}




-(void)phoneBtn
{
    
    businDiZiModel=_items2[0];
       NSArray *strArray = [businDiZiModel.m_tel componentsSeparatedByString:@","];
    NSString *phonema=[NSString  stringWithFormat:@"tel://%@",strArray[0]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonema]];
}
-(void)telBtn:(UIButton *)btn
{
      businDiZiModel=_items2[btn.tag];
    NSArray *strArray = [businDiZiModel.m_tel componentsSeparatedByString:@","];
    NSString *phonema=[NSString  stringWithFormat:@"tel://%@",strArray[0]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonema]];
}


-(void)downLoad
{

    
    NSLog(@"222222%@",_idn);
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{


                                                                     }];
        
    }else
    {
        paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                     @"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                }];
    }
    NSMutableArray *ma=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/merchants/%@",_idn] params:paramDic12 success:^(id data) {
        
        
       shopView.shopNameLabel.text=[NSString stringWithFormat:@"%@",data[@"name"]];
//        heat.name1.text=[NSString stringWithFormat:@"%@",data[@"username"]];
        self.titleLable.text=shopView.shopNameLabel.text;
        NSString *stretName=[NSString stringWithFormat:@"%@",data[@"streetName"]];
        if(stretName.length>12){
            NSString *str1 = [stretName substringToIndex:12];//截取掉下标5之前的字符串
            shopView.addressLabel.text=[NSString stringWithFormat:@"%@...",str1];
            
        }else{
            
                    shopView.addressLabel.text=[NSString stringWithFormat:@"  %@",data[@"streetName"]];
        }

        
//        [heat.DiTuDingWei setTitle:[NSString stringWithFormat:@"  %@",data[@"streetName"]]   forState:UIControlStateNormal];
        Dizhi123=[NSString stringWithFormat:@"%@",data[@"streetName"]] ;
//        heat.zhekou.text=[NSString stringWithFormat:@"%@折",data[@"discount"]];
       shopView.scoreLabel.text=[NSString stringWithFormat:@"%@分",data[@"praise"]];
        szhekou=[NSString stringWithFormat:@"%@",data[@"discount"]];
        makeView=[[UIView alloc] init];
        makeView1=[[UIView alloc] init];
        int num=[shopView.scoreLabel.text intValue];
        makeView.frame=CGRectMake(15, 42, 12*5, 15);
        makeView1.frame=CGRectMake(15,42, 12*num, 15);
        makeView1.clipsToBounds=YES;
//        heat.fenShuSPace.constant = CGRectGetMaxX(makeView.frame) + 5;
        [shopView addSubview:makeView];
        [shopView addSubview:makeView1];
        
        for (int i=0; i<5; i++) {
            UIImageView *image1=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"huxingxing"]];
            
            image1.frame=CGRectMake(i*12, 0,12,13);
            [makeView addSubview:image1];
            
            UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
            
            image.frame=CGRectMake(i*12,0,12,13);
            [makeView1 addSubview:image];
            
            
            
        }
        [imageViewBJ sd_setImageWithURL:[NSURL URLWithString:data[@"mainImageUrl"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
        [imageViewBJ sd_setImageWithURL:[NSURL URLWithString:data[@"mainImageUrl"]] placeholderImage:nil options:SDWebImageProgressiveDownload];
         heat2.name.text=[NSString stringWithFormat:@"%@",data[@"userName"]];
       photo=[NSString stringWithFormat:@"%@",data[@"phone"]];
        [heat2.geshu setTitle:[NSString stringWithFormat:@"%@人",data[@"numOfPeople"]] forState:UIControlStateNormal];
        
      li.fenshu.text=[NSString stringWithFormat:@"%@分",data[@"praise"]];
        if(data[@"commentTime"])
        {
               heat2.zanwupinglu.hidden=YES;
               //return ;
        }else
        {
               shopView.scoreLabel.text=@"0分";
            li.fenshu.text=@"0分";
               //heat2.zanwupinglu.hidden=YES;
        }
        heat2.time.text=[NSString stringWithFormat:@"%@",data[@"commentTime"]];
        heat2.neirong.text=[NSString stringWithFormat:@"%@",data[@"commentInfo"]];
        idennn=[NSString stringWithFormat:@"%@",data[@"id"]];
        li.geshu.text=[NSString stringWithFormat:@"%@人",data[@"numOfPeople"]];
       
        shcode=[NSString stringWithFormat:@"%@",data[@"code"]];
//        makeView=[[UIView alloc] init];
//        makeView1=[[UIView alloc] init];
//        int num1=[shopView.scoreLabel.text intValue];
//        makeView.frame=CGRectMake(46, 67, 12*5, 15);
//        makeView1.frame=CGRectMake(46,67, 12*num1, 15);
//        makeView1.clipsToBounds=YES;

//        [li addSubview:makeView];
//        [li addSubview:makeView1];

//        for (int i=0; i<5; i++) {
//            UIImageView *image1=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"huxingxing"]];
//
//            image1.frame=CGRectMake(i*12, 0,12,13);
//            [makeView addSubview:image1];
//
//            UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
//
//            image.frame=CGRectMake(i*12,0,12,13);
//            [makeView1 addSubview:image];
//
//
//
//        }

        for (NSDictionary *dict in data[@"goodsUserModelList"]) {
            shangpu *na=[[shangpu alloc] initWithDict:dict];
            [ma addObject:na];
            
        }
  #pragma mark ---------收藏----------
        
        informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        informationCardBtn.frame=CGRectMake(kScreenSize.width-70, 10, 40, 60);
        
        [informationCardBtn addTarget:self action:@selector(enterehzFilesVC) forControlEvents:UIControlEventTouchUpInside];
       
        [self.view addSubview:informationCardBtn];
        stree=[NSString stringWithFormat:@"%@",data[@"isCollect"] ];
        if ([[NSString stringWithFormat:@"%@",data[@"isCollect"] ] isEqualToString:@"1"]) {
            [informationCardBtn setImage:[UIImage imageNamed:@"guanzhu-拷贝"] forState:UIControlStateNormal];
        }
        else{
           [informationCardBtn setImage:[UIImage imageNamed:@"guanzhu"] forState:UIControlStateNormal];
        }
        appUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"appUrl"]];
        imageUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"imageUrl"]];
        title=[NSString stringWithFormat:@"%@",data[@"share"][@"title"]];
        introduction12=[NSString stringWithFormat:@"%@",data[@"share"][@"introduction"]];
        [totalArray addObjectsFromArray:ma];
        [_businessTableView reloadData];
        [self.amontTableView2 reloadData];
        NSLog(@"%@",data);
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
     
     -(void)downLoad12345
    {
        
        //    NSString *lat=  [FNUserDefaults objectForKey:@"latitude"];
        //    NSString *log= [FNUserDefaults objectForKey:@"longitude"];
        
        NSLog(@"222222%@",_idn);
        if (![FNUserDefaults objectForKey:@"usersid"]) {
            paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                         
                                                                         
                                                                         }];
            
        }else
        {
            paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                         @"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                         
                                                                         }];
        }
        
        
        
        
        NSMutableArray *ma=[[NSMutableArray alloc] init];//13269083056
        [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/merchants/%@/goods",_idn] params:nil success:^(id data) {
            
            
           shopView.shopNameLabel.text=[NSString stringWithFormat:@"%@",data[@"name"]];
//            heat.name1.text=[NSString stringWithFormat:@"%@",data[@"username"]];
//            [heat.DiTuDingWei setTitle:[NSString stringWithFormat:@"  %@",data[@"streetName"]]   forState:UIControlStateNormal];
            Dizhi123=[NSString stringWithFormat:@"%@",data[@"streetName"]] ;
//            heat.zhekou.text=[NSString stringWithFormat:@"%@折",data[@"discount"]];
            shopView.scoreLabel.text=[NSString stringWithFormat:@"%@分",data[@"praise"]];
            szhekou=[NSString stringWithFormat:@"%@",data[@"discount"]];
            makeView=[[UIView alloc] init];
            makeView1=[[UIView alloc] init];
//            int num=[heat.fenshu.text intValue];
            makeView.frame=CGRectMake(15, 42, 12*5, 15);
//            makeView1.frame=CGRectMake(15,42, 12*num, 15);
            makeView1.clipsToBounds=YES;
//            heat.fenShuSPace.constant = CGRectGetMaxX(makeView.frame) + 5;
//            [heat addSubview:makeView];
//            [heat addSubview:makeView1];
            
//            for (int i=0; i<5; i++) {
//                UIImageView *image1=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"huxingxing"]];
//
//                image1.frame=CGRectMake(i*12, 0,12,13);
//                [makeView addSubview:image1];
//
//                UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
//
//                image.frame=CGRectMake(i*12,0,12,13);
//                [makeView1 addSubview:image];
//
//
//
//            }
            [imageViewBJ sd_setImageWithURL:[NSURL URLWithString:data[@"mainImageUrl"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
            [imageViewBJ sd_setImageWithURL:[NSURL URLWithString:data[@"mainImageUrl"]] placeholderImage:nil options:SDWebImageProgressiveDownload];
            heat2.name.text=[NSString stringWithFormat:@"%@",data[@"userName"]];
            photo=[NSString stringWithFormat:@"%@",data[@"phone"]];
            [heat2.geshu setTitle:[NSString stringWithFormat:@"%@人",data[@"numOfPeople"]] forState:UIControlStateNormal];
            
            li.fenshu.text=[NSString stringWithFormat:@"%@分",data[@"praise"]];
            if(data[@"commentTime"])
            {
                heat2.zanwupinglu.hidden=YES;
                //return ;
            }else
            {
                shopView.scoreLabel.text=@"0分";
                li.fenshu.text=@"0分";
                //heat2.zanwupinglu.hidden=YES;
            }
            heat2.time.text=[NSString stringWithFormat:@"%@",data[@"commentTime"]];
            heat2.neirong.text=[NSString stringWithFormat:@"%@",data[@"commentInfo"]];
            idennn=[NSString stringWithFormat:@"%@",data[@"id"]];
            li.geshu.text=[NSString stringWithFormat:@"%@人",data[@"numOfPeople"]];
            
            shcode=[NSString stringWithFormat:@"%@",data[@"code"]];
//                    makeView=[[UIView alloc] init];
//                    makeView1=[[UIView alloc] init];
//                    int num1=[shopView.scoreLabel.text intValue];
//                    makeView.frame=CGRectMake(46, 67, 12*5, 15);
//                    makeView1.frame=CGRectMake(46,67, 12*num1, 15);
//                    makeView1.clipsToBounds=YES;
//
//                    [li addSubview:makeView];
//                    [li addSubview:makeView1];
//
//                    for (int i=0; i<5; i++) {
//                        UIImageView *image1=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"huxingxing"]];
//
//                        image1.frame=CGRectMake(i*12, 0,12,13);
//                        [makeView addSubview:image1];
//
//                        UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"icon_star"]];
//
//                        image.frame=CGRectMake(i*12,0,12,13);
//                        [makeView1 addSubview:image];
//
//
//
//                    }
//
            for (NSDictionary *dict in data[@"goodsUserModelList"]) {
                shangpu *na=[[shangpu alloc] initWithDict:dict];
                [ma addObject:na];
                
            }
            
            informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            informationCardBtn.frame=CGRectMake(kScreenSize.width-70, 10, 40, 60);
            
            [informationCardBtn addTarget:self action:@selector(enterehzFilesVC) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:informationCardBtn];
            stree=[NSString stringWithFormat:@"%@",data[@"isCollect"] ];
            if ([[NSString stringWithFormat:@"%@",data[@"isCollect"] ] isEqualToString:@"0"]) {
                [informationCardBtn setImage:[UIImage imageNamed:@"guanzhu"] forState:UIControlStateNormal];
            }
            else{
                [informationCardBtn setImage:[UIImage imageNamed:@"guanzhu"] forState:UIControlStateNormal];
            }
            appUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"url"]];
            imageUrl=[NSString stringWithFormat:@"%@",data[@"share"][@"imageUrl"]];
            title=[NSString stringWithFormat:@"%@",data[@"share"][@"title"]];
            introduction12=[NSString stringWithFormat:@"%@",data[@"share"][@"introduction"]];
            [totalArray addObjectsFromArray:ma];
            [_businessTableView reloadData];
            [self.amontTableView2 reloadData];
            NSLog(@"%@",data);
        
           
            
        } failure:^(NSError *error) {
            
        } alertInfo:^(NSString *alertInfo) {
            
        }];
    }
#pragma mark ---------收藏----------
     
-(void)downLoad1:(NSString *)idnn
{
    
    
    NSDictionary *paramDic12;
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        paramDic12  = @{@"access_token":[FNUserDefaults objectForKey:@"usersid"]
                        };
        
    }else
    {
        paramDic12  = @{@"merchantId":idnn,
                          @"access_token":[FNUserDefaults objectForKey:@"usersid"]
                          };
    }
    
    
    
    
    NSLog(@"_+_+==%@",paramDic12);
    [HttpTool postWithBaseURL:kBaseURL path:[NSString  stringWithFormat:@"/merchants/%@/collect",idnn] params:paramDic12 success:^(id data) {
        
        
        NSString *codeStr=[NSString stringWithFormat:@"%@",data[@"code"]];
        
        if([codeStr isEqualToString:@"5000"]){
        
            
              [informationCardBtn setImage:[UIImage imageNamed:@"Collerction"] forState:UIControlStateNormal];
            [MBProgressHUD showSuccess:@"收藏成功"];
            
        }else{
             [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",data[@"msg"]]];
        }
        
        
    } failure:^(NSError *error) {
         [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",error]];
        
    } alertInfo:^(NSString *alertInfo) {
         [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",alertInfo]];
    }];
    

//
//
//    // uid
//    [FNUserDefaults objectForKey:@"MD5Pwd"];
//
//
//
//    NSDictionary *headers = @{ @"content-Type": @"application/json",
//                               };
//
//
////    http://p.jryunhui.com/api/merchants/d5730a27-267b-11e8-a215-702084e1f310/collect?access_token=ffc570bc-315a-4925-ad14-8a98a1f68491
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic12 options:0 error:nil];
//    NSString *urlstring=[NSString  stringWithFormat:@"%@/merchant/%@/collect?access_token=%@",kBaseURL,idnn,[FNUserDefaults objectForKey:@"usersid"]];
//    NSURL *url = [NSURL URLWithString:urlstring];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//
//    [request setHTTPMethod:@"POST"];
//    [request setAllHTTPHeaderFields:headers];
//
//    [request setHTTPBody:postData];
//    NSLog(@"%@", [request allHTTPHeaderFields]);
//
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
//
//
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//
//
//        NSLog(@"%@",dict);
//        //5.回到主线程,进行更新页面
//
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
//            {
//              [MBProgressHUD showError:@"收藏成功"];
//            }
//        });
//
//
//
//
//
//
//    }];
//
//
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(totalArray1234.count>0 &&tableView==self.amontTableView2){
        CommSpotViewController *rigiste = [[CommSpotViewController alloc] init];
//        NSString *strbtn;// 商品ID
//NSString *code;// 商店ID
        
        shangpu *na=[[shangpu alloc] init];
        na=totalArray1234[indexPath.row];
        rigiste.acModel=self.model.acModel;
        rigiste.strbtn=na.idn;
        rigiste.code=idennn;
        
        rigiste.strname=na.goodsName;
        rigiste.orderType=@"1";
        rigiste.shopingCode=shcode;
        [self.navigationController pushViewController:rigiste animated:YES];
        
        
    }
    
    if(totalArray.count>0&&_businessTableView==tableView){
    CommSpotViewController *rigiste = [[CommSpotViewController alloc] init];
    shangpu *na=[[shangpu alloc] init];
    na=totalArray[indexPath.row];
    rigiste.acModel=self.model.acModel;
    rigiste.strbtn=na.idn;
    rigiste.code=idennn;
  
    rigiste.strname=na.goodsName;
    rigiste.orderType=@"1";
    rigiste.shopingCode=shcode;
    [self.navigationController pushViewController:rigiste animated:YES];
    
}

}

-(void)setIdn:(NSString *)idn{
         _idn=idn;
         }
-(void)downLoad233455{
         NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"pageNum":[NSString stringWithFormat:@"%d",pageNum]     ,@"pageSize":@"10",}];
         ;
         //NSString *srrrr=@"";
         NSLog(@"-----------------------------------dfssdfsdsf---------------------------------------------------");
         NSMutableArray *maqq=[[NSMutableArray alloc] init];
        
             [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/merchants/%@/goods/categories" ,_idn] params:paramDic success:^(id data) {
                 NSLog(@"dfdfsfsfsffrrrrrrrr5555%@",data);
                 for (NSDictionary *dict in data) {
                     BussFenLeiModel *ma=[[BussFenLeiModel alloc] initWithDict:dict];
                     [maqq addObject:ma];
                 }
                 
//                 total=[data[@"total"]   intValue]        ;
//                 [switchBtn setTitle:[NSString stringWithFormat:@"全部(%@)",data[@"total"]]forState:UIControlStateNormal];
                 [TotalArray1 removeAllObjects];
                 [TotalArray1 addObjectsFromArray:maqq];
                 if(TotalArray1.count>0){
                     BussFenLeiModel*model=TotalArray1[0];
                     [self downLoad1234567890WithCateID:model.idn];
                 }
                 
                 
                 
                  [self  makeShangPin];
             } failure:^(NSError *error) {
                 [amontTableView.header endRefreshing];
                 [amontTableView.footer endRefreshing];
             } alertInfo:^(NSString *alertInfo) {
                 [amontTableView.header endRefreshing];
                 [amontTableView.footer endRefreshing];
             }];
         //}//else
//         {
//             [amontTableView.header endRefreshing];
//             [amontTableView.footer endRefreshing];
//         }
     }
     // 点击分类 获取商品
     -(void)downLoad1234567890WithCateID:(NSString*)ID
    {
        
//            NSString *lat=  [FNUserDefaults objectForKey:@"latitude"];
//            NSString *log= [FNUserDefaults objectForKey:@"longitude"];
        
        NSLog(@"222222%@",_idn);
        if (![FNUserDefaults objectForKey:@"usersid"]) {
            paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                         
                                                                         
                                                                         }];
            
        }else
        {
            paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                         @"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                         
                                                                         }];
        }
        
        
        
        
       
        [HttpTool getWithBaseURL:kBaseURL  path:[NSString stringWithFormat:@"/merchants/%@/goods",ID] params:nil success:^(id data) {
            
            
           NSMutableArray *ma=[[NSMutableArray alloc] init];
            
            for (NSDictionary *dict in data[@"list"]) {
                shangpu *na=[[shangpu alloc] initWithDict:dict];
                [ma addObject:na];
                
            }
            
            [totalArray1234 removeAllObjects];
            [totalArray1234 addObjectsFromArray:ma];
//            [_businessTableView reloadData];
//            _businessTableView.backgroundColor=[UIColor redColor];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                      [self.amontTableView2 reloadData];
//            }];
//            dispatch_async(dispatch_get_main_queue(), ^{
                [self.amontTableView2 reloadData];
//            });
      
//            NSLog(@"%@",data);
            
        } failure:^(NSError *error) {
            
        } alertInfo:^(NSString *alertInfo) {
            
        }];
    }
#pragma mark - 懒加载
    /** 地理编码管理器 */
     - (CLGeocoder *)geoC
    {
        if (!_geoC) {
            _geoC = [[CLGeocoder alloc] init];
        }
        return _geoC;
    }
     
     // 地理编码(地址关键字 ->经纬度 )
     - (IBAction)geoCode {
         
         NSString *address = Dizhi123;
         
         // 容错处理
         if([address length] == 0)
         {
             return;
         }
         
         // 根据地址关键字, 进行地理编码
         [self.geoC geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
             
             /**
              *  CLPlacemark : 地标对象
              *  location : 对应的位置对象
              *  name : 地址全称
              *  locality : 城市
              *  按相关性进行排序
              */
             CLPlacemark *pl = [placemarks firstObject];
             
             if(error == nil)
             {
                 self.endCoordinate=pl.location.coordinate;
//                 NSLog(@"%f----%f", pl.location.coordinate.latitude, pl.location.coordinate.longitude);

             }
         }];
     }
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
    {
        
        NSLog(@"%@",scrollView);
        if(scrollView ==_businessTableView ){
//            [UIView animateWithDuration:0.1 animations:^{
               self.headBgView.alpha =(scrollView.contentOffset.y+200)/200;
//            }];
            NSLog(@"al=========%f", self.headBgView.alpha);
        }
      
    }
     
@end
