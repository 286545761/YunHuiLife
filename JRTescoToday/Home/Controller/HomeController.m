//
//  HomeController.m
//  TescoToday
//
//  Created by 123 on 2017/8/18.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "HomeController.h"
#import "BusinessController.h"
#import "homeTheStoreListTableViewCell.h"
#import "UIBarButtonItem+DCBarButtonItem.h"
#import "HomeTabTableViewCell.h"
#import "DHNavigationController.h"
#import "DCNavSearchBarView.h"
#import "HomeHearView.h"
#import "Search.h"
#import "CommSpotViewController.h"
#import "FFScrollView.h"
#import "LoginController.h"
#import "BusinessUserViewController.h"
#import "JinPaiHeHuoRenViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "LoginController.h"
#import "TLCityPickerController.h"
#import "ShrinkViewController.h"
#import "SGQRCodeScanningVC.h"
#import <AVFoundation/AVFoundation.h>
#import <UShareUI/UShareUI.h>
#import "Login.h"
#import "wepViewController.h"
#import "JRHomeHeaderView.h"
#import "CommodityTableViewCell.h"
#import "CrossDevicesLayout.h"
#import "commodle.h"
#import "UIImageView+WebCache.h"
#import "JRAppVersionCore.h"
#import "UIViewController+alterView.h"
#import "MJRefreshNormalHeader.h"
#import "CategoresModel.h"
#import "AllCategoriesController.h"
//#import "WDW3D_Animation.h"
#import "SDCycleScrollView.h"
#import "JRAppVersionCore.h"
#import "listThreeMajorActivitiesViewController.h"
#import "activityImageDetailsViewController.h"
#import "shareModel.h"

static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_WebLink = @"https://bbs.umeng.com/";
static NSString *homeListCell=@"homeTheStoreListTableViewCell";
@interface HomeController ()<UITableViewDelegate,UITableViewDataSource,FFScrollViewDelegate,TLCityPickerDelegate,SDCycleScrollViewDelegate,CLLocationManagerDelegate, JRHomeHeaderViewDelegate,UITextFieldDelegate>{
       UIView *strhome;
     UITableView *_homeTableView;
//    Search *search;
    FFScrollView *_topScrollView;
    UIButton *jinPaiBtn;

    UIButton*yiGouBtn;
//       NSMutableArray *_arrayid;
    //HomeTabTableViewCell*cell;
    UIButton *DiQu;
    UIButton*SearchBtn;
    UIButton *ErWeiMaBtn;
    NSString *cityq;
    NSMutableArray *BussArray;
    NSMutableArray *CategoryArray;
     NSMutableArray *CategoryArray1;
    JRHomeHeaderView *headerView;
}
/*
 *
 */
@property(strong,nonatomic)Search *search;
/*
 *
 */
//@property(copy,nonatomic)NSString *needSearchString;
@property (nonatomic, assign) UMSocialPlatformType platform;
@property (nonatomic,strong)  NSString * cityName;
@property(nonatomic ,strong)CLLocationManager *mgr;
/*
 *
 */
@property(copy,nonatomic)SDCycleScrollView *adsScroView;
/*
 *banner list 列表
 */
@property(copy,nonatomic)NSMutableArray *bannerListArray;
/*
 *
 */
@property(strong,nonatomic)shareModel *sharemodel;
@end

@implementation HomeController
- (void)viewWillAppear:(BOOL)animated
{
   
     self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
    if (_homeTableView) {
          [self downLoad];
    }
   
    

}
-(NSMutableArray *)bannerListArray{
    if (!_bannerListArray) {
        _bannerListArray =[[NSMutableArray alloc]init];
    }
    
    return _bannerListArray;
}
-(shareModel *)sharemodel{
    if (!_sharemodel) {
        _sharemodel =[[shareModel alloc]init];
    }
    
    return _sharemodel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIUserNotificationType types=UIUserNotificationTypeNone|UIUserNotificationTypeSound;
    [JRAppVersionCore checkAppVerionForUpdate:^(JRAppVersionModel *appVersionModel, NSError *error) {
        
        
        if ([appVersionModel.isForce isEqualToString:@"1"]) {
            NSLog(@"需要强制更新");
            [self showAppUpdateAlterViewWith:appVersionModel];
            
        }
    }];

    self.mgr=[CLLocationManager new];
    // 用户请求授权
    if ([self.mgr respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.mgr requestWhenInUseAuthorization];
    }

    self.mgr.delegate=self;
    // 调用定位方法
    [self.mgr startUpdatingLocation];
    self.view .frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-64-49) style:UITableViewStylePlain];
    if (ScreenH==812) {
          _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 74, ScreenW, ScreenH-88-49) style:UITableViewStylePlain];
    }
//    if (@available(iOS 11.0, *))
//    {
//        _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-64-49) style:UITableViewStylePlain];
//    }
//    if (iPhone6p) {
//        _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, ScreenW, ScreenH-64-49) style:UITableViewStylePlain];
//        if (@available(iOS 11.0, *))
//        {
//            _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH-64-49) style:UITableViewStylePlain];
//        }
//    }

    _homeTableView.delegate=self;
    _homeTableView.dataSource=self;
    _homeTableView.showsVerticalScrollIndicator = NO;
    _homeTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"tokenRenZheng1234" object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Shrink) name:@"Shrink" object:nil];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,ScreenW,  CGCrossDevicesHeight(150)+CGCrossDevicesHeight(105)+CGCrossDevicesHeight(50)+kScreenSize.width/5+125)];
     UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,ScreenW,  150+105+50+kScreenSize.width/5+125+250)];
    view.backgroundColor = [UIColor yellowColor];
    headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JRHomeHeaderView class]) owner:nil options:nil] lastObject];
    headerView.frame = CGRectMake(0, 0, ScreenW, view.bounds.size.height);
    UITapGestureRecognizer *whereToGoTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(whereToGoTapAction)];
    
    
    [headerView.whereToGoImageView addGestureRecognizer:whereToGoTap];
    
    UITapGestureRecognizer *polyFashionTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(polyFashionAction)];
    [headerView.polyFashionImageView addGestureRecognizer:polyFashionTap];
    
    UITapGestureRecognizer *veryAffordableTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(veryAffordableAction)];
    [headerView.veryAffordableImageView addGestureRecognizer:veryAffordableTap];
    [view addSubview:headerView];
    headerView.delegate = self;
    UITapGestureRecognizer *activityTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoSeeActivit)];
    headerView.activityImageView.userInteractionEnabled=YES;
    [headerView.activityImageView addGestureRecognizer:activityTap];
    _homeTableView.tableHeaderView = view;
    [self.view addSubview:_homeTableView];
    [_homeTableView registerClass:[homeTheStoreListTableViewCell class] forCellReuseIdentifier:homeListCell];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dowPullloadData)];
    _homeTableView.header = header;
    self.view.backgroundColor=[UIColor colorWithHexString:@"#f6f6f6"];
    [self setUpNav];
    [self downLoad];
}
#pragma mark ---------去哪玩----------
-(void)whereToGoTapAction{
    listThreeMajorActivitiesViewController * listThreeMajorActivitiesVC=[[listThreeMajorActivitiesViewController alloc]init];
    listThreeMajorActivitiesVC.title=@"去哪玩";
    [self.navigationController pushViewController:listThreeMajorActivitiesVC animated:YES];
    
    
    
}
#pragma mark ---------狠会吃----------
-(void)veryAffordableAction{
    listThreeMajorActivitiesViewController * listThreeMajorActivitiesVC=[[listThreeMajorActivitiesViewController alloc]init];
    listThreeMajorActivitiesVC.title=@"狠会吃";
    [self.navigationController pushViewController:listThreeMajorActivitiesVC animated:YES];
    
    
}
#pragma mark ---------聚时尚----------
-(void)polyFashionAction{
    listThreeMajorActivitiesViewController * listThreeMajorActivitiesVC=[[listThreeMajorActivitiesViewController alloc]init];
    listThreeMajorActivitiesVC.title=@"聚时尚";
    [self.navigationController pushViewController:listThreeMajorActivitiesVC animated:YES];
    
    
}



#pragma mark ---------查看活动详情----------
-(void)gotoSeeActivit{
    
    
    
    activityImageDetailsViewController *activityImageDetailsVC=
    [[activityImageDetailsViewController alloc]initWithNibName:@"activityImageDetailsViewController" bundle:nil];
    
    
    activityImageDetailsVC.sharemodel=self.sharemodel;
    
    
    
  
    [self.navigationController pushViewController:activityImageDetailsVC animated:YES];
    
    
    
    
}
-(void)Shrink
{
   [self.tabBarController setSelectedIndex:1];
}
#pragma mark - JRHomeHeaderViewDelegate
- (void)pushToPointViewControllerWithType:(NSUInteger)type {
    if (type==0) {
        return;
    }
    [self.tabBarController setSelectedIndex:1];
}
-(void)downLoadFinish
{
    LoginController *login=[[LoginController alloc] init];
    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:login];
    [self presentViewController:avc animated:YES completion:^{
        
    }];;

}
#pragma mark 下拉刷新
- (void)dowPullloadData
{

    
   // [BussArray removeAllObjects];

    [self downLoad];
    [_homeTableView.header endRefreshing];
   
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"longitude = %f", ((CLLocation *)[locations
                                             lastObject]).coordinate.longitude);
    NSLog(@"latitude = %f", ((CLLocation *)[locations lastObject]).coordinate.latitude);
    [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",((CLLocation *)[locations lastObject]).coordinate.latitude] forKey:@"latitude"];
    [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",((CLLocation *)[locations
                                                                               lastObject]).coordinate.longitude] forKey:@"longitude"];
    NSLog(@"我在定位");
    
   
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:[locations
                                      lastObject] completionHandler:^(NSArray *array, NSError *error)
     {
         if (array.count > 0)
         {
             CLPlacemark *placemark = [array objectAtIndex:0];
             
             
             //获取城市
             NSString *city = placemark.locality;
             if (!city) {
                 //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市
                 city = placemark.administrativeArea;
             }
             NSLog(@"city = %@", city);
             
             self.cityName = city;
             cityq=city;
                 [DiQu setTitle:cityq forState:UIControlStateNormal];
         }
         else if (error == nil && [array count] == 0)
         {
             NSLog(@"No results were returned.");
         }
         else if (error != nil)
         {
             CLGeocoder*geocoder=[CLGeocoder new];
             cityq=@"北京";
             [geocoder geocodeAddressString: cityq completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                 
                 //placemarks: 地标数组 --》主要的是CLLocation
                 //遍历数组
                 if (placemarks.count==0||error) {
                     NSLog(@"解析有问题");
                     return ;
                 }
                 for (CLPlacemark *placemark in placemarks) {
                     NSLog(@"LA:%f,",placemark.location.coordinate.latitude);
                     NSLog(@"long:%f",placemark.location.coordinate.longitude);
                     NSLog(@"name%@",placemark.name);
                     NSLog(@"%@",placemark.locality);
                     [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",placemark.location.coordinate.latitude] forKey:@"latitude"];
                     [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",placemark.location.coordinate.longitude] forKey:@"longitude"];
                 }
                 
                 
             }];
         }
     }];
    
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];

}
#pragma mark - 导航栏处理
- (void)setUpNav
{
    _search=[[Search alloc] init];
   
    _search.backgroundColor=[UIColor colorWithHexString : BunRed];
    _search.frame=CGRectMake(0,0,ScreenW ,64);
//     search.shouWoText.delegate=self;
    if (ScreenH==812) {
          _search.frame=CGRectMake(0,0,ScreenW ,88);
    }
    
    _search.jiao.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapLocal=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLocal)];
    
    [_search.jiao addGestureRecognizer:tapLocal];
    SearchBtn=_search.SearchBtn;
    [SearchBtn addTarget:self action:@selector(btnDiQu:) forControlEvents:UIControlEventTouchUpInside];
    ErWeiMaBtn=_search.xiaoXiBtn;
    ErWeiMaBtn.tag=1002;
    [ErWeiMaBtn addTarget:self action:@selector(btnDiQu:) forControlEvents:UIControlEventTouchUpInside];
    SearchBtn.tag=1000;
    DiQu=_search.diQu;
    [DiQu addTarget:self action:@selector(btnDiQu:) forControlEvents:UIControlEventTouchUpInside];
    _search.shouWoText.delegate=self;
    [self.view addSubview:_search];
    DiQu.tag=1001;

}
-(void)tapLocal{
    
    TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
    [cityPickerVC setDelegate:self];
    
    cityPickerVC.loactionCityName = self.cityName;
    //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:cityPickerVC];
    [self presentViewController:avc animated:YES completion:^{
        
    }];;
}
-(void)btnDiQu:(UIButton *)btn
{
   
    if (btn.tag==1001) {
        TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
        [cityPickerVC setDelegate:self];
       
         cityPickerVC.loactionCityName = self.cityName;
        //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
        cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:cityPickerVC];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
//        [self presentViewController:cityPickerVC animated:YES completion:^{
//            
//        }];
        //[self.navigationController pushViewController:cityPickerVC animated: YES];
    
    }
    else if(btn.tag==1002)
    {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if (device) {
            AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (status == AVAuthorizationStatusNotDetermined) {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            SGQRCodeScanningVC *vc = [[SGQRCodeScanningVC alloc] init];
                            [self.navigationController pushViewController:vc animated:YES];
                        });
                        // 用户第一次同意了访问相机权限
                        NSLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                        
                    } else {
                        // 用户第一次拒绝了访问相机权限
                        NSLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    }
                }];
            } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
                SGQRCodeScanningVC *vc = [[SGQRCodeScanningVC alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - 云惠生活] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"开启" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"]];
                }];
                UIAlertAction *alertB = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertC addAction:alertB];
                [alertC addAction:alertA];

                [self presentViewController:alertC animated:YES completion:nil];
                
            } else if (status == AVAuthorizationStatusRestricted) {
                NSLog(@"因为系统原因, 无法访问相册");
            }
        } else {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
        }
 
    }
    else{
        
      
        if (self.search.shouWoText.text.length>0) {
//            [FNUserDefaults setObject:@"1" forKey:@"touziyemian"];
//            [FNUserDefaults setObject:self.needSearchString forKey:@"namenihao"];
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"Shrink" object:nil];
//            self.needSearchString=nil;
            [self Tosearch];
        }
        
        
//        ShrinkViewController *nsaa=[[ShrinkViewController alloc] init];
//
//        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:nsaa];
//        [self presentViewController:avc animated:YES completion:^{
//
//        }];
    }

  
}
-(void)Tosearch{
    [self.search.shouWoText resignFirstResponder];
    [FNUserDefaults setObject:self.search.shouWoText.text forKey:@"namenihao"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Shrink" object:nil];
    self.search.shouWoText.text=@"";

}
#pragma mark - TLCityPickerDelegate
- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city
{ //创建一个CLGeocoder对象
    CLGeocoder*geocoder=[CLGeocoder new];
    NSLog(@"%@",city.cityName);
    cityq=city.cityName;
    
    [DiQu setTitle:city.cityName forState:UIControlStateNormal];
    [geocoder geocodeAddressString:city.cityName completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        //placemarks: 地标数组 --》主要的是CLLocation
        //遍历数组
        if (placemarks.count==0||error) {
            NSLog(@"解析有问题");
            return ;
        }
        for (CLPlacemark *placemark in placemarks) {
            NSLog(@"LA:%f,",placemark.location.coordinate.latitude);
            NSLog(@"long:%f",placemark.location.coordinate.longitude);
            NSLog(@"name%@",placemark.name);
            NSLog(@"%@",placemark.locality);
            [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",placemark.location.coordinate.latitude] forKey:@"latitude"];
            [FNUserDefaults setObject:[NSString stringWithFormat:@"%f",placemark.location.coordinate.longitude] forKey:@"longitude"];
        }
        
        
    }];
    

    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - 二维码扫码
- (void)richScanItemClick
{
//    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
//    style.centerUpOffset = 44;
//    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
//    style.photoframeLineW = 6;
//    style.photoframeAngleW = 24;
//    style.photoframeAngleH = 24;
//    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
//    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
//    SubLBXScanViewController *vc = [[SubLBXScanViewController alloc]init];
//    vc.title = @"扫一扫";
//    vc.style = style;
//    vc.isQQSimulator = YES;
//    
//    JRNavigationController *nav = [[JRNavigationController alloc]initWithRootViewController:vc];
//    [self presentViewController:nav animated:YES completion:nil];
//    
//    vc.scanResult = ^(NSString *strScanned){
//        NSLog(@"扫码结果");
//    };
}
#pragma mark - 消息
- (void)messageItemClick
{
//   JRNavigationController *messageVc = [[JRNavigationController alloc] init];
//    messageVc.title = @"消息中心";
//    [self.navigationController pushViewController:messageVc animated:YES];
}
//#pragma mark - TLCityPickerDelegate
//- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city
//{
//    //[self.cityPickerButton setTitle:city.cityName forState:UIControlStateNormal];
//    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
//        
//    }];
//}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController
{
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma makeui
-(void)MakeUi
{
    HomeHearView *makeUiHear=[[HomeHearView alloc] init];
  
    makeUiHear.frame=CGRectMake(0, ScreenW*0.421+40, ScreenW, 100);
    if (iPhone6p) {
        makeUiHear.frame=CGRectMake(0, ScreenW*0.421+40, ScreenW, 100);
    }
    jinPaiBtn=makeUiHear.jinPanBtn;
    [jinPaiBtn addTarget:self action:@selector(jinPanBtn:) forControlEvents:UIControlEventTouchUpInside];
    jinPaiBtn.tag=1000;
    yiGouBtn=makeUiHear.yiGouBtn;
    yiGouBtn.tag=1001;
    [yiGouBtn addTarget:self action:@selector(jinPanBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_homeTableView addSubview:makeUiHear];
    
    UIView *chai=[[UIView alloc] initWithFrame:CGRectMake(0, ScreenW*0.421+20+100+25, ScreenW, 40)];
    if (iPhone6p) {
        chai.frame=CGRectMake(0, ScreenW*0.421+20+110+25, ScreenW, 40);
    }
    chai.backgroundColor=[UIColor whiteColor];
    [_homeTableView addSubview:chai];
    UILabel *lab=[[UILabel alloc] init];
    lab.frame=CGRectMake(21, 12, ScreenW, 16);
    [chai addSubview:lab];
    lab.text=@"猜你喜欢";
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(15, 39, ScreenW-30, 0.5)];
   line.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
    [chai addSubview:line];
//    _topScrollView = [[FFScrollView alloc] initPageViewWithFrame:CGRectMake(0,0, kScreenSize.width, kScreenSize.width*0.4) views:nil andNSarray:nil];
//    _topScrollView.frame=CGRectMake(0, 20, kScreenSize.width, kScreenSize.width*0.4);
//    _topScrollView.backgroundColor=[UIColor blueColor];
//    _topScrollView.pageViewDelegate = self;
//    [strhome addSubview:_topScrollView];
//    UIImageView *heart=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner"]];
//    heart.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBanner:)];
//    [heart addGestureRecognizer:tap];
//    heart.frame=CGRectMake(0,40, kScreenSize.width, kScreenSize.width*0.4);
//    if (iPhone6p) {
//        heart.frame=CGRectMake(0,40, kScreenSize.width, kScreenSize.width*0.4);
//    }
//    [strhome addSubview:heart];

}
//-(SDCycleScrollView*)setupADScrollView{
//    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 280, kScreenSize.width, headerView.HearBabbrView.bounds.size.height) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
//
//    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
////    cycleScrollView2.titlesGroup = titles;
//    cycleScrollView2.currentPageDotColor = [UIColor whiteColor];
//    return cycleScrollView2;
//
//}
-(SDCycleScrollView *)adsScroView{
    if (!_adsScroView) {
       _adsScroView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenSize.width, headerView.HearBabbrView.bounds.size.height) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
       _adsScroView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        //    cycleScrollView2.titlesGroup = titles;
        _adsScroView.currentPageDotColor = [UIColor whiteColor];
        
        NSArray *imageArr = @[@"banner.png"];
        _adsScroView.imageURLStringsGroup=imageArr;
    }
    
    return _adsScroView;
}
//-(WDW3D_Animation*)setupADScrollView{
//
//    WDW3D_Animation *adAnimation = [[WDW3D_Animation alloc] initWithFrame:CGRectMake(0,0, kScreenSize.width, headerView.HearBabbrView.bounds.size.height)];
//
//    adAnimation.delegate=self;
//    return adAnimation;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ClickImg:(int)index
{
    NSLog(@"%d",index);
}
- (void)tapBanner:(UITapGestureRecognizer *)tap {
    DLog(@"----------");
    [self.tabBarController setSelectedIndex:1];
}
-(void)jinPanBtn:(UIButton*)btn
{
    if (btn.tag==1000) {
   
        JinPaiHeHuoRenViewController *nam=[[JinPaiHeHuoRenViewController alloc] init];
       
        [self.navigationController pushViewController:nam animated:YES];
    }
    else{
        wepViewController *nam=[[wepViewController alloc] init];
        nam.string=@"http://jrygou.com/wap";
         nam.sting2=@"云惠生活";
        
        [self.navigationController pushViewController:nam animated:YES];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return BussArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (iPhone6p) {
//
//        return kScreenSize.width*0.3;
//    }
//    else{
//        return 128;
//    }
    
    CGFloat cellHeight=90;
    
    commodle *mid=[[commodle alloc] init];
    mid= BussArray[indexPath.row];
    
//    if (![mid.acModel.atDiscounttypeString isEqualToString:@"-1"]) {
//        cellHeight+=25;
//    }
       
    if (![mid.acModel.fullReductiontypeString isEqualToString:@"-1"]&&![mid.acModel.atDiscounttypeString isEqualToString:@"-1"]) {
       cellHeight+=25;
    }
    return cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    commodle *mid=[[commodle alloc] init];
    mid=BussArray[indexPath.row];
    homeTheStoreListTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:homeListCell];
    cell.model=mid;
    cell.selectionStyle=UITableViewCellAccessoryNone;
    
    return cell;
    //    static NSString *cellName=@"cell";
//    CommodityTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
//    if (cell==nil) {
//        cell=[[[NSBundle mainBundle] loadNibNamed:@"CommodityTableViewCell" owner:self options:nil] lastObject];
//    }
//    cell.mi.hidden=YES;
//    cell.weizhi.hidden=YES;
//    cell.name.text=mid.name;
//    cell.pinlei.text=mid.category;
//    [cell.weizhi setTitle:[NSString stringWithFormat:@"   %@",mid.streetName] forState:UIControlStateNormal];
//    [cell.tuxiang sd_setImageWithURL:[NSURL URLWithString:mid.mainImageUrl] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
//    [cell.tuxiang sd_setImageWithURL:[NSURL URLWithString:mid.mainImageUrl] placeholderImage:nil options:SDWebImageProgressiveDownload];
////    cell.name12.hidden=YES;
//    [cell makeWuJiaoXing:5];

}

#pragma mark - 点击顶部轮播广告图片

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    commodle *mid=[[commodle alloc] init];
    mid= BussArray[indexPath.row];
    BusinessController *rigiste = [[BusinessController alloc] init];
    
    rigiste.idn=mid.idn;
    rigiste.model=mid;
   
    [self.navigationController pushViewController:rigiste animated:YES];

}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//
//    return 502;
//}
-(void)makeCatrgoreyView
{
//    JRHomeHeaderView *jrCategory=[[JRHomeHeaderView alloc] init];
//    jrCategory.TitleCatrgorey1.backgroundColor=[UIColor redColor];
    if (CategoryArray1.count<7) {
        return;
    }
    for (int i=0; i<8; i++) {

        CategoresModel *makdd=[[CategoresModel alloc]  init];
        if (i==7) {
            
        }else{
             makdd=CategoryArray1[i];
            
        }
       
        int x = 0;
        int y = 10;
        
        if(i < 4){
            x= i;
            y= 20;
        }else{
            x= i-4;
            
             y= 10+kScreenSize.width/10+5+20+30;
            
        }
        
        
        UIButton *makbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        makbtn.frame=CGRectMake(x*kScreenSize.width/4+kScreenSize.width/20, y, kScreenSize.width/10, kScreenSize.width/10);
    UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"fenlei0%d.png",i+1]]];
        

        


            [img sd_setImageWithURL:[NSURL URLWithString:makdd.img] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"fenlei0%d.png",i+1]] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [makbtn setImage:img.image forState:UIControlStateNormal];
        });
     
          makbtn.tag=i;
        [makbtn addTarget:self action:@selector(makebtnnna123:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label=[[UILabel alloc] init];
//        label.frame=CGRectMake(x*kScreenSize.width/4+kScreenSize.width/20, kScreenSize.width/10+15, kScreenSize.width/4, kScreenSize.width/10);
       
        if (i==7) {
            label.text=@"全部分类";
        }else{
            
             label.text=[NSString stringWithFormat:@"%@",makdd.tagsName];
        }
        
        label.font=[UIFont systemFontOfSize:13];
        label.textAlignment=NSTextAlignmentCenter;
        label.textColor=[UIColor colorWithHexString:@"#999999"];
            [headerView.TitleCatrgorey1  addSubview:makbtn];
         [headerView.TitleCatrgorey1  addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(kScreenWidth/4));
            make.top.equalTo(makbtn.mas_bottom).offset(5);
            make.height.equalTo(@20);
        make.centerX.equalTo(makbtn.mas_centerX);
            
            
            
        }];

    
    }
//    int j=0;
//    int m=0;
//    for (int i=0; i<9; i++) {
//        if (i==5) {
//            j=1;
//            m=0;
//            
//        }
//        CategoresModel *makdd=[[CategoresModel alloc]  init];
//        makdd=CategoryArray[i];
//
//        UIButton *makbtn=[UIButton buttonWithType:UIButtonTypeCustom];
//        UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
//        [img sd_setImageWithURL:[NSURL URLWithString:makdd.img] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
//        [img sd_setImageWithURL:[NSURL URLWithString:makdd.img] placeholderImage:nil options:SDWebImageProgressiveDownload];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [makbtn setImage:img.image forState:UIControlStateNormal];
//        });
//
//        makbtn.frame=CGRectMake(m*kScreenSize.width/5+kScreenSize.width/15,kScreenSize.width/5*j+5, kScreenSize.width/15, kScreenSize.width/15);
//        makbtn.tag=i;
//        [makbtn addTarget:self action:@selector(makebtnnna:) forControlEvents:UIControlEventTouchUpInside];
//        UILabel *label=[[UILabel alloc] init];
//        label.frame=CGRectMake(m*kScreenSize.width/5, kScreenSize.width/15+15+(kScreenSize.width/10+35)*j, kScreenSize.width/5, 20);
//        label.text=[NSString stringWithFormat:@"%@",makdd.tagsName];;
//        label.font=[UIFont systemFontOfSize:11];
//        label.textAlignment=1;
//        label.textColor=[UIColor colorWithHexString:@"#999999"];
//        [headerView.TitleCategorey2  addSubview:label];
//      
//        [headerView.TitleCategorey2  addSubview:makbtn];
//        m++;
//    }
//    UIButton *btnnn=[UIButton  buttonWithType:UIButtonTypeCustom];//fenLei-38
//    btnnn.frame=CGRectMake(4*kScreenSize.width/5+kScreenSize.width/15,kScreenSize.width/5*1+5, kScreenSize.width/15, kScreenSize.width/15);
//    btnnn.tag=9;
//  //  btnnn.backgroundColor=[UIColor blueColor];
//     [ btnnn setImage:[UIImage imageNamed:@"quanbu"] forState:UIControlStateNormal];
//    [btnnn addTarget:self action:@selector(makebtnnna:) forControlEvents:UIControlEventTouchUpInside];
//       [headerView.TitleCategorey2  addSubview:btnnn];
//    UILabel *label=[[UILabel alloc] init];
//    label.frame=CGRectMake(4*kScreenSize.width/5, kScreenSize.width/15+15+(kScreenSize.width/10+35)*1, kScreenSize.width/5, 20);
//    label.text=@"全部分类";;
//    label.font=[UIFont systemFontOfSize:11];
//    label.textAlignment=1;
//    label.textColor=[UIColor colorWithHexString:@"#999999"];
//    [headerView.TitleCategorey2  addSubview:label];
    // 添加3D广告轮播图
    
    
//   SDCycleScrollView *adAnimation = [self setupADScrollView];
    [headerView.HearBabbrView addSubview:self.adsScroView];
   
    
}
-(void)makebtnnna123:(UIButton *)btn
{
    if (btn.tag !=7){
        CategoresModel *makdd=[[CategoresModel alloc]  init];
        makdd=CategoryArray1[btn.tag];
        [FNUserDefaults setObject:makdd.tagsName  forKey:@"Categoriesname"];
        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",makdd.tagsId]     forKey:@"Categories"];
            [self.tabBarController setSelectedIndex:1];
    }
    else{
 
        AllCategoriesController *nsaa=[[AllCategoriesController alloc] init];
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:nsaa];
        [self presentViewController:avc animated:YES completion:^{
            
        }];
        
    }

   
}
-(void)makebtnnna:(UIButton *)btn
{
    if (btn.tag==9) {
        AllCategoriesController *nsaa=[[AllCategoriesController alloc] init];
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:nsaa];
        [self presentViewController:avc animated:YES completion:^{
            
        }];
    }else
    {
        CategoresModel *makdd=[[CategoresModel alloc]  init];
        makdd=CategoryArray[btn.tag];
        [FNUserDefaults setObject:makdd.tagsName  forKey:@"Categoriesname"];
        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",makdd.tagsId]     forKey:@"Categories"];
        [self.tabBarController setSelectedIndex:1];
        
    }
}
-(void)downLoad
{
    

      NSDictionary *dicPath;
    if([FNUserDefaults objectForKey:@"usersid"])
    {
        
         dicPath=@{@"access_token":[FNUserDefaults objectForKey:@"usersid"]};
        
    }
    
  
  

    [HttpTool getWithBaseURL:kBaseURL  path:@"" params:dicPath success:^(id data) {
        NSLog(@"%@",kBaseURL);

//        NSLog(@"data=======%@",data);
        CategoryArray=[[NSMutableArray alloc] init];
        CategoryArray1=[[NSMutableArray alloc] init];
        for (NSDictionary *sre1 in data[@"recommend"][@"merchantCategoryOneLevelModels"]) {
            CategoresModel *makdd=[[CategoresModel alloc]  initWithDict:sre1];
            [CategoryArray1 addObject:makdd];


        }
        for (NSDictionary *sre12 in data[@"recommend"][@"merchantCategoryTwoLevelModels"]) {
            CategoresModel *makdd=[[CategoresModel alloc]  initWithDict:sre12];
            // [nihao addObject:makdd];
            [CategoryArray addObject:makdd];
        }
        [self makeCatrgoreyView];
            BussArray=[[NSMutableArray alloc] init];
        NSMutableArray *nihao=[[NSMutableArray alloc] init];
        for (NSDictionary *sre in data[@"recommend"][@"merchantRecommendModels"]) {
           commodle *makdd=[[commodle alloc]  initWithDict:sre];
             [nihao addObject:makdd];


        }
        [self.bannerListArray removeAllObjects];
        for (NSDictionary *dic in data[@"bannerList"]) {
            
            [self.bannerListArray addObject:dic[@"url"]];
            
        }
        if (self.bannerListArray.count>0) {
           self.adsScroView.imageURLStringsGroup=self.bannerListArray;
        }
        [BussArray addObjectsFromArray:nihao];
         [_homeTableView reloadData];
        [self.sharemodel initWithDict:data[@"share"]];
        
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@",kBaseURL);
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)downLoad23
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    //   [Login loginRenZengPhone:nil andPwdnum:nil];
    NSLog(@"qqqqq%@",[FNUserDefaults objectForKey:@"usersid"]);
    [HttpTool getWithBaseURL:kBaseURL path:@"user_center/get_account" params:paramDic success:^(id data) {
    
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
#pragma mark ---------textFeledDelegate----------


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 收起键盘(取消第一响应者)
//    self.needSearchString=textField.text;
//    [textField resignFirstResponder];
    if (textField.text.length>0) {
         [self Tosearch];
    }
   
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{

    
}
    
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //变化后的字符串
    
    return YES;
}
#pragma mark ---------SDCycleScrollViewDelegate----------
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    
    
    
    
    
}










@end
