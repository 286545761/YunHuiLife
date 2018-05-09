//
//  MapViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/5.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface MapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property(nonatomic ,strong)CLLocationManager *mgr;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mgr=[CLLocationManager new];
    // 用户请求授权
    if ([self.mgr respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.mgr requestWhenInUseAuthorization];
    }
    self.map .userTrackingMode=MKUserTrackingModeFollow;
    
    
    //获取用户信息
    self.map.delegate=self;

    //设置代理
    self.mgr.delegate=self;
    // 调用定位方法
    [self.mgr startUpdatingLocation];
    //持续定位对电量优化
    //距离筛选器。
    self.mgr.distanceFilter=1;//当位置发生一定改变时调用 当1米时调用代理方法
    self.mgr.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"location:%@",locations);
    CLLocation *location=locations.lastObject;
    NSLog(@"%f,%f",location.coordinate.latitude,location.coordinate.longitude);
    //停止定位
    
    
   
}
#pragma mark 获取系统范围 地图显示区域发生变化时调用
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"%f,%f",mapView.region.span.latitudeDelta,mapView.region.span.longitudeDelta);
}
#pragma mark 完成用户位置更新的时候，调用 userLocation :大头针模型
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //现是大头针信息 反地理编码
    CLGeocoder*geocoder=[CLGeocoder new];
    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //放错处理
        if (placemarks.count==0||error) {
            return ;
        }
        CLPlacemark *placemark=placemarks.lastObject;
        //userLocation.location.coordinate
        NSLog(@"%@",userLocation.location);
        userLocation.title=[NSString stringWithFormat:@"%@",placemark.locality];
        userLocation.subtitle=placemark.name;
    }];
    
    
    
}
#pragma mark 次方发在图像出来前调用
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views{
    
    
    
    for (MKAnnotationView *annoView in views) {
        //记录原本frame
        if ([annoView.annotation isKindOfClass:[MKUserLocation class]]) {
            return;
        }
        CGRect enfFrame=annoView.frame;
        //将View 的frame的Y值设为零
        annoView.frame=CGRectMake(enfFrame.origin.x, 0, enfFrame.size.width, enfFrame.size.height);
        //将其还原
        [UIView animateWithDuration:2 animations:^{
            annoView.frame=enfFrame;
        }];
    }
}

@end
