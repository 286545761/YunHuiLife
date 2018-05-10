//
//  CommSpotViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/22.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "CommSpotViewController.h"
#import "UIImageView+WebCache.h"
#import "ConsumptionController.h"
#import "OtherWaysLoginController.h"
#import "GoodsLabelModel.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "ShangPinMingCheng00ViewController.h"
@interface CommSpotViewController (){
    NSString *str;
    UIAlertView *alert;
    NSArray *array3;
    NSString *idn;
    NSString *img;
    NSString*name;
    NSString *qian;
    NSString *zhe;
    NSString * Dizhi123;
    NSString *theOriginalPrice;// 原价
}
@property (nonatomic, strong) CLGeocoder *geoC;
@property (nonatomic, assign) CLLocationCoordinate2D endCoordinate;
@property (nonatomic, strong) NSString *urlScheme;
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hight;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *mor2;
@property (weak, nonatomic) IBOutlet UILabel *mor1;
@property (weak, nonatomic) IBOutlet UILabel *geshu;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *shanjia;
@property (weak, nonatomic) IBOutlet UIButton *weizhi;
@property (weak, nonatomic) IBOutlet UIButton *dianhua;

@end

@implementation CommSpotViewController
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    self.title=@"商品详情";
    self.navigationController.navigationBarHidden = NO;
//    self.navigationController.navigationBar.barTintColor=RGB(252, 199, 46);

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlScheme = @"demoURI://";
    self.appName = @"demoURI";
    NSString *lat=  [FNUserDefaults objectForKey:@"latitude"];
    NSString *log= [FNUserDefaults objectForKey:@"longitude"];
    self.coordinate = CLLocationCoordinate2DMake([lat floatValue],[log floatValue]);
      alert.delegate=self;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 0.5)];
    line.backgroundColor=[UIColor colorWithHexString:@"#cccccc"];
    [self downLoad];
    [_shanjiaxinxi addSubview:line];
}
- (IBAction)dianhua:(id)sender {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",str]]];

    
}
#pragma mark alertView代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (0 == buttonIndex) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",str]]];
    }
    
    
    
    
}
#pragma mark 地图定位
- (IBAction)weishi:(id)sender {
    
    [self geoCode];

        //添加白名单列表
        __block NSString *urlScheme = self.urlScheme;
        __block NSString *appName = self.appName;
        __block CLLocationCoordinate2D coordinate = self.coordinate;
        NSString *lat=  [FNUserDefaults objectForKey:@"latitude"];
        NSString *log= [FNUserDefaults objectForKey:@"longitude"];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择地图" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        //这个判断其实是不需要的
        if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://maps.apple.com/"]])
        {
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                CLGeocoder*geocoder=[CLGeocoder new];
                
                [geocoder geocodeAddressString:Dizhi123 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                    
           
                
                //实现地理编码方法 可能出现重明的问题。一定要给用户提供个选择
                

                    //placemarks: 地标数组 --》主要的是CLLocation
                    //遍历数组
                    if (placemarks.count==0||error) {
                        NSLog(@"解析有问题");
                        return ;
                    }
                    
                    CLPlacemark *pm=placemarks.firstObject;
                    MKPlacemark *mkpm=[[MKPlacemark alloc] initWithPlacemark:pm];
                    //
                    //    //创建MKMapItem
                    MKMapItem *destinationItem=[[MKMapItem alloc] initWithPlacemark:mkpm];
                    //    //MKMapItem 地图上的点
                    //openMapsWithItem 调用此方法就可以打开系统自带地图
                    [MKMapItem openMapsWithItems:@[destinationItem]launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
                    
                    
                }];
                
            }];
            
            [alert addAction:action];
            
            
            
            
            
        }
        
//        if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]])
//        {
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//
//                NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=%@&mode=driving&coord_type=gcj02",coordinate.latitude, coordinate.longitude,Dizhi123] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//                NSLog(@"%@",urlString);
//
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
//
//            }];
//
//            [alert addAction:action];
//        }
    
        
        if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]])
        {
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
                NSString *gaodeParameterFormat = @"iosamap://navi?sourceApplication=%@&poiname=%@&poiid=BGVIS&lat=%f&lon=%f&dev=1&style=2";
                NSString *urlString = [[NSString stringWithFormat:
                                        gaodeParameterFormat,
                                        @"yourAppName",
                                        @"yourAppUrlSchema",
                                        //   @"",
                            self.endCoordinate.latitude,
                                        self.endCoordinate.longitude]
                                       stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString
                
                                                            ]];
                
            }];
            
            [alert addAction:action];
        }
        
//        if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]])
//        {
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"谷歌地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//
//                NSString *urlString = [[NSString stringWithFormat:@"comgooglemaps://?x-source=%@&x-success=%@&saddr=&daddr=%f,%f&directionsmode=driving",appName,urlScheme,coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//                NSLog(@"%@",urlString);
//
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
//
//            }];
//
//            [alert addAction:action];
//        }
    
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
        
        
        
    }
    
    
    


-(void)downLoad
{
   
    [HttpTool getWithBaseURL:kBaseURL path:[NSString stringWithFormat:@"merchants/goods/%@",_strbtn]  params:nil success:^(id data) {
        
        array3=@[@"美食",@"酒店娱乐",@"生活服务你好多福多寿",@"生活服务你好多福多寿"];
        _text.text=[NSString stringWithFormat:@"%@",data[@"descp"]];
        _name.text=[NSString stringWithFormat:@"%@",data[@"merchantName"]];
        _shanjia.text=@"商家信息";
        _yuanjia.text=[NSString stringWithFormat:@"¥%@",data[@"originalPrice"]];// 原价
        if (!data[@"originalPrice"]) {
            _yuanjia.hidden=YES;
            _line12.hidden=YES;
        }
        idn=[NSString stringWithFormat:@"%@",data[@"id"]];
        _shopName.text=[NSString stringWithFormat:@"%@",data[@"name"]];
        Dizhi123=[NSString stringWithFormat:@"%@",data[@"address"]] ;
        [_weizhi setTitle:[NSString stringWithFormat:@"  %@",data[@"address"]] forState:UIControlStateNormal];
        _mor2.text=[NSString stringWithFormat:@"¥%@",data[@"goodsPrice"]];
        _mor2.textColor=[UIColor colorWithHexString:@"#f22f33"];
        str=[NSString stringWithFormat:@"%@",data[@"merchantPhone"]];
        img=data[@"mainImage"];
        qian=data[@"goodsPrice"];
        theOriginalPrice=data[@"originalPrice"];
        if ([data[@"mainImage"] isEqualToString:@"<null>"]) {
            
        }
        else{
            [_head sd_setImageWithURL:[NSURL URLWithString:data[@"mainImage"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
            [_head sd_setImageWithURL:[NSURL URLWithString:data[@"mainImage"]] placeholderImage:nil options:SDWebImageProgressiveDownload];
        }
        _mainView.frame=CGRectMake(0, 0, kScreenSize.width, 300);
        int i=0;
        int j=0;
        int sum=0;
        int sum1=0;
         int sum2=0;
         int sum3=0;
        int sum4=0;
        NSMutableArray *dataarray=[[NSMutableArray alloc] init];
        NSMutableArray *dataarray1=[[NSMutableArray alloc] init];
        for (NSDictionary *dict in data[@"goodsLabels"]) {
            GoodsLabelModel *ma=[[GoodsLabelModel alloc] initWithDict:dict];
            [dataarray1 addObject:ma];
        }
  
        for (GoodsLabelModel *string in dataarray1) {
           
           
            UIButton *mabe=[UIButton buttonWithType:UIButtonTypeCustom];
            
             sum=sum+(int)string.content.length*15+5;
             sum4=sum2+(int)string.content.length*15+5;
            mabe.layer.borderWidth=0.5f;
            mabe.layer.cornerRadius=3.f;
            if (sum<=kScreenSize.width) {
                if (i==0) {
                    
                    mabe.frame=CGRectMake(8, 75 ,string.content.length*15, 15);
                     [mabe setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                    mabe.layer.borderColor=[UIColor redColor].CGColor;
                }else
                {
                    mabe.frame=CGRectMake(8+sum1, 75,string.content.length*15, 15);
                    [mabe setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                    mabe.layer.borderColor=[UIColor blueColor].CGColor;
                  
                }
                  mabe.layer.masksToBounds=YES;
                sum1=sum1+(int)string.content.length*15+10;
               // [dataarray addObject:mabe];
            }else
            {
               
                
                if (sum4 <=kScreenSize.width) {
                        mabe.frame=CGRectMake(8+sum2, 95,string.content.length*15, 15);
                        sum2=sum2+(int)string.content.length*15+10;
                }
                else
                {
                    
                   
                        mabe.frame=CGRectMake(8+sum3, 115,string.content.length*15, 15);
                        sum3=sum3+(int)string.content.length*15+10;
                    NSLog(@"113333333%d",sum3);
                    
                  //  _hight.constant=170;
                  
                }
                
               
                //[dataarray1 addObject:mabe];
            }
           
//            [mabe setBackgroundImage:[UIImage  imageNamed:@"fenleiyuanjiao"] forState:UIControlStateNormal];
            [mabe setTitle:string.content forState:UIControlStateNormal];
            mabe.titleLabel.font=[UIFont systemFontOfSize:10];
           
            [_mainView addSubview:mabe];
            i++;
        }
        if (sum3!=0) {
         self.hight.constant+=30;
        }
//        for (UIButton *btnnn in dataarray) {
//            //btnnn.frame=
//        }
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        [MBProgressHUD showError:alertInfo];
        
    }];
}

- (IBAction)liJiQianggou:(id)sender {
  
}
- (IBAction)sss:(id)sender {
    
    if (![FNUserDefaults objectForKey:@"usersid"]) {
        OtherWaysLoginController *rigiste = [[OtherWaysLoginController alloc] init];
        // rigiste.inviter=_inviter;
        
        UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:rigiste];
        [self presentViewController:avc animated:YES completion:^{
            
        }];;
        
    }else
    {
        ShangPinMingCheng00ViewController *na=[[ShangPinMingCheng00ViewController alloc] init];
        na.acModel=self.acModel;
               na.strbtn= idn;
        na.strbtn1=img;
        na.strbtn2=[NSString stringWithFormat:@"%@",qian];
        na.strbtn4=[NSString stringWithFormat:@"%@",theOriginalPrice];
        na.strbtn3=_name.text;
        na.theStoreNewID=_code;
        na.theStoreID= _shopingCode;
        na.orderType=_orderType;
              //na.title=_name.text;
        [self.navigationController pushViewController:na animated:YES];
    }
    
}
-(void)setAcModel:(activityModel *)acModel{
    _acModel=acModel;
    
    
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




@end
