                                                               //
//  AppDelegate.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/21.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "DCTabBarController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "BusinessUserViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApiObject.h"
#import "WXApi.h"
#import "checkSubmit.h"
@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[DCTabBarController alloc] init];
    
    [self.window makeKeyAndVisible];
//    [WXApi registerApp:@"wxa96aae43da92d535"];
        [WXApi registerApp:@"wxe055fccf022ee5bb"];
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"5aa8e9cab27b0a5aa50000d5"];
//      [[UMSocialManager defaultManager]
////       setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxa96aae43da92d535" appSecret:@"62a5fbc20957050c70808b539e1858d2" redirectURL:nil];
          [[UMSocialManager defaultManager]
           setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxe055fccf022ee5bb" appSecret:@"0edf1c5efdc9b663955cc26abf82e316" redirectURL:nil];
//    1106676725
//    APP KEYLusccMvgEOy1kzvE
    
       [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1106676725"/*设置QQ平台的appID*/  appSecret:@"LusccMvgEOy1kzvE" redirectURL:@"http://mobile.umeng.com/social"];
    [[checkSubmit shareTools] checkIsSubmit];
    
    
    return YES;
}
-(void)onResp:(BaseResp*)resp{
      NSLog(@"支付失败，retcode=%d",resp.errCode);
    NSNotification * notification = [NSNotification notificationWithName:@"WXPay" object:[ NSString stringWithFormat:@"%d",resp.errCode] ];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp*response=(PayResp*)resp;
        switch(response.errCode){
            caseWXSuccess:
                //服务器端查询支付通知或查询API返回的结果再提示成功
                NSLog(@"支付成功");
                break;
            default:
                NSLog(@"支付失败，retcode=%d",resp.errCode);
                break;
        }
    }
}


//被废弃的方法. 但是在低版本中会用到.建议写上
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WXApi handleOpenURL:url delegate:self];
}
//被废弃的方法. 但是在低版本中会用到.建议写上

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([url.host isEqualToString:@"safepay"]) {

        //支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK   defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//            NSNotification * notification = [NSNotification notificationWithName:@"Alipay" object:[ NSString stringWithFormat:@"%d",resultDic.errCode] ];
//            [[NSNotificationCenter defaultCenter] postNotification:notification];

        }];
    }
    
    if ([url.host isEqualToString:@"pay"]){//微信支付，处理支付结果
    
        
        return [WXApi handleOpenURL:url delegate:self];
        
        
        
    }
    return YES;
}

//新的方法
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    
    if ([url.host isEqualToString:@"safepay"]) {

        //支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK   defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {

        }];
}

    if ([url.host isEqualToString:@"pay"]){//微信支付，处理支付结果

    
        return [WXApi handleOpenURL:url delegate:self];
        
        
        
    }
    return YES;
    

}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

    
    
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
     [[checkSubmit shareTools] checkIsSubmit];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  [[checkSubmit shareTools] reomveSu];
    
}


@end
