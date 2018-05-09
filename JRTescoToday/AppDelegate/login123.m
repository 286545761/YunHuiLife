//
//  login123.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/25.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "login123.h"

@implementation login123
-(void)btnmakejop
{
    
    
    
    // 还原确认用户是否认证
    NSUserDefaults *myUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str=@"2";
    [myUserDefaults setObject:str forKey:@"renzhen"];
    
    
    // 获取当前时间
    //    NSString *currentDateStr = [NSString stringGetCurrentDateStr];
    //
    //   NSString *MD5Pwd = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_pwdTextField.text,@"duohao8888"]]];
    //
    //    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":self.mobileNumTextFileld.text,
    //                                                                                    @"password":_pwdTextField.text,
    //                                                                                    }];
    // uid
    [NSString  stringWithFormat:@""];
    // 提示框
    
    [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在登录..."];
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    NSDictionary *headers = @{@"content-type": @"application/x-www-form-urlencoded",
                              };
    
    NSString *uuid =@"password";
    
    
    //[FNUserDefaults setObject:[NSString stringWithFormat:@"%@",uuid]forKey:@"usersuuid"];
    //    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSMutableData*postData=[[NSMutableData alloc] initWithData:[[NSString  stringWithFormat:@"username=%@",uuid]dataUsingEncoding:NSUTF8StringEncoding]];
  
    // [postData  appendData:[@"&origin=ios"dataUsingEncoding:NSUTF8StringEncoding]];
    [postData  appendData:[[NSString stringWithFormat:@"&grant_type=%@",uuid]  dataUsingEncoding:NSUTF8StringEncoding]];
    //NSData *postData = [NSJSONSerialization dataWithJSNObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/login/",kBaseURL];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSLog(@"%@",connectionError);
        if (connectionError==nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            
            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"]) {
                    [FNUserDefaults setObject:@"登录成功"forKey:@"denglushibai"];
                    [YYAnimationIndicator              stopAnimationWithLoadText:@"YES" withType:YES];
                    // 保存信息
                    
                    [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                    
                    
                    
                }
                else{
                    
                    
                    
                }
                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                
                if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
                    [MBProgressHUD showError:dict[@"msg"]];
                    
                }
                
            });
            
            
        }
        else{
            
            [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
        }
        
        
        
    }];
    
    
}

@end
