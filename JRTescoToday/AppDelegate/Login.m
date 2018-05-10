///
//  Login.m
//  DHInvestment
//
//  Created by Andy on 16/9/8.
//  Copyright © 2016年 DuohaoTechnolog. All rights reserved.
//

#import "Login.h"

@implementation Login
+(NSString *)loginRenZengPhone:(NSString *)phone andPwdnum:(NSString *)pwdnum
{
    NSString *token;
 
    
    
    // 还原确认用户是否认证
    NSDictionary *headers = @{@"content-type": @"application/x-www-form-urlencoded",
                              };
    
    // NSString *uuid = [[NSUUID UUID] UUIDString];
 //   NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSMutableData*postData=[[NSMutableData alloc] initWithData:[[NSString stringWithFormat:@"refresh_token=%@",[FNUserDefaults objectForKey:@"oldusersid"]]  dataUsingEncoding:NSUTF8StringEncoding]];
   
    [postData  appendData:[@"&grant_type=refresh_token"dataUsingEncoding:NSUTF8StringEncoding]];
   //  [postData  appendData:[[NSString stringWithFormat:@"&sign=%@",uuid]  dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *urlstring=[NSString  stringWithFormat:@"%@login/%@",kBaseURL,[FNUserDefaults objectForKey:@"oldusersid12"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSLog(@"%@",[FNUserDefaults objectForKey:@"usersuuid"]);
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
 
    [request setHTTPBody:postData];
    NSLog(@"xxxxx%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
//        if ([[NSString  stringWithFormat:@"%ld",httpResponse.statusCode] isEqualToString:@"401"])
//        {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"tokenRenZheng1234" object:nil];
//
//        }
        if (connectionError==nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            
            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
        // [MBProgressHUD showError:dict[@"msg"]];
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"]) {
                   [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"data"][@"access_token"]]forKey:@"usersid"];
                      [FNUserDefaults synchronize];
                    // 保存信息
          
//                    
                }
              
                

//                
            });
            
            
        }
        else{
              [[NSNotificationCenter defaultCenter] postNotificationName:@"tokenRenZheng1234" object:nil];
        }
        
        
        
    }];

    return token;
}


@end
