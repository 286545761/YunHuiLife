//
//  OtherWaysLoginController.m
//  DHInvestment
//
//  Created by JJS on 15/9/23.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//  其他方式登录

#import "OtherWaysLoginController.h"
#import "UITextField+DH.h"
//#import "MobClick.h"
#import "UserAccount.h"
#import "UIImageView+WebCache.h"
#import "UIBarButtonItem+DH.h"
#import "CLLockVC.h"
#import "TuXingView.h"
#import "checkTool.h"

@interface OtherWaysLoginController ()
{
    UIButton *_guiZeBtn;
    UIView *guiZeView;
    int pageNum;
    UIButton *SuanXin;
    int total;
    UIButton*makejopBtn;
    UILabel *labelee;
    TuXingView *make;
    UIButton *makeche;
    NSString *userPortrait;
      dispatch_source_t _timer;
}
@property (weak, nonatomic) IBOutlet UITextField        *mobileNumTextField;           // 手机号
@property (weak, nonatomic) IBOutlet UITextField        *validateTextField;            // 验证码
@property (weak, nonatomic) IBOutlet UIButton           *sendValidateBtn;              // 发送验证码
@property (weak, nonatomic) IBOutlet UIButton           *loginBtn;                     //


@end

@implementation OtherWaysLoginController{
    __block int timeout; //倒计时时间
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//     self.navigationController.navigationBar.barTintColor=[UIColor colorWithHexString:BunRed];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"blue"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage=[[UIImage alloc] init];
    self.navigationController.navigationBar.shadowImage=[[UIImage alloc] init];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    timeout=60;
    _sendValidateBtn.enabled = YES;
   self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"nav_return_all"higlightedImage:nil target:self action:@selector(back)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    timeout=60;
    guiZeView=[[UIView alloc] init];
    make=[[TuXingView  alloc] init];
    
    
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    self.title = @"验证码登录";
    if ([[FNUserDefaults  objectForKey:@"otheryanzengma"] isEqualToString:@"2"]) {
        timeout=[[FNUserDefaults objectForKey:@"othertimeyanzeng"] intValue];
//        [self startTime];
    }
    SuanXin= make.SuanXin;
//    [UITextField uitextFieldWith:_mobileNumTextField iconName:@"input_phone"];
//    [UITextField uitextFieldWith:_validateTextField iconName:@"input_validate"];
   // _loginBtn.backgroundColor=[UIColor colorWithRed:0.98f green:0.81f blue:0.41f alpha:1.00f];
    //_loginBtn.layer.cornerRadius=20;
    [_sentBtn setTitleColor:[UIColor colorWithHexString:kSelectedlColor] forState:UIControlStateNormal];
    
    [_sendValidateBtn setTitleColor:[UIColor colorWithRed:0.99f green:0.76f blue:0.62f alpha:1.00f] forState:UIControlStateNormal];
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    [notificaionCenter addObserver:self selector:@selector(textFieldChangeForValidateBtn) name:UITextFieldTextDidChangeNotification object:_mobileNumTextField];
    [notificaionCenter addObserver:self selector:@selector(textFieldChangeForLoignBtn) name:UITextFieldTextDidChangeNotification object:_validateTextField];
    makejopBtn=make.queding;
    [makejopBtn addTarget:self action:@selector(btnmakejop) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor=[UIColor whiteColor];

}


#pragma mark 监听发送验证码按钮是否可点击
- (void)textFieldChangeForValidateBtn
{
    _sendValidateBtn.enabled = [_mobileNumTextField.text length] > 0;
}

#pragma mark 监听登录按钮是否可点击
- (void)textFieldChangeForLoignBtn
{
    _loginBtn.enabled = ([_mobileNumTextField.text length] > 0 && [_validateTextField.text length] > 0);
}

#pragma mark 登录
- (IBAction)loginBtnClick:(UIButton *)sender
{
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
    // 还原确认用户是否认证
    NSUserDefaults *myUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str=@"2";
//    NSDictionary *dic=@{
//                        @"phone": _mobileNumTextField.text,
//                        @"code": _validateTextField.text,
//                        @"grant_type": @"phone_code"
//
//
//                        };
//    [myUserDefaults setObject:str forKey:@"renzhen"];
//    [HttpTool postWithBaseURL:kBaseURL path:@"/uaa/login/code" params:dic success:^(id data) {
//
//
//
//
//    } failure:^(NSError *error) {
//
//    } alertInfo:^(NSString *alertInfo) {
//
//    }];
    
   
 
    NSDictionary *headers = @{@"content-type": @"application/x-www-form-urlencoded",
                              };

     NSString *uuid =@"phone_code";
      [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",uuid]forKey:@"usersuuid"];
    NSMutableData*postData=[[NSMutableData alloc] initWithData:[[NSString  stringWithFormat:@"phone=%@",_mobileNumTextField.text]dataUsingEncoding:NSUTF8StringEncoding]];
    [postData  appendData:[[NSString  stringWithFormat:@"&code=%@",_validateTextField.text]dataUsingEncoding:NSUTF8StringEncoding]];
//    [postData  appendData:[[NSString  stringWithFormat:@"&inviter=%@",_inviter]dataUsingEncoding:NSUTF8StringEncoding]];
//    [postData  appendData:[[NSString stringWithFormat:@"&grant_type=%@",uuid]  dataUsingEncoding:NSUTF8StringEncoding]];
     [postData  appendData:[[NSString stringWithFormat:@"&grant_type=%@",@"phone_code"]  dataUsingEncoding:NSUTF8StringEncoding]];
   

    NSString *urlstring=[NSString  stringWithFormat:@"%@/uaa/login/code",kBaseURL];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"jrygou-person", @"jrygou-person-secret"];
    NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];

    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
        [FNUserDefaults setObject:_validateTextField.text forKey:@"MD5Pwd"];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        if (connectionError==nil) {

            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
            dispatch_sync(dispatch_get_main_queue(), ^{
     if ([[NSString  stringWithFormat:@"%@",dict[@"status"]] isEqualToString:@"500"]) {
                                        [MBProgressHUD showError:dict[@"message"]];
         
     }else{
                
//                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"500"]) {
                    [YYAnimationIndicator              stopAnimationWithLoadText:@"YES" withType:YES];
                    // 保存信息
                    UserAccount *account = [[UserAccount alloc] init];
                    account.userMobile = self.mobileNumTextField.text;
                    account.userPassword = @"123";
                    [account saveUserLoginInfo:account];
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"My1" object:nil];
                    // 保存用户是否绑卡状态
//                    if (self.logoBackBlock) {
//                        self.logoBackBlock();
//                    }
//
                
//                    [self download1];
                
                [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",  dict[@"access_token"]] forKey:@"usersid"];
                [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"refresh_token"]]forKey:@"oldusersid"];
                [FNUserDefaults setObject:@"person"forKey:@"oldusersid12"];
                [[NSNotificationCenter defaultCenter] postNotificationName:FRESH_RICE object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"maketou" object:nil];
                [FNUserDefaults setObject:@"2" forKey:@"maker"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"otherLogin"object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_SUCCESS object:nil];
                [self  dismissViewControllerAnimated:YES completion:^{
                    
                }];
     }
                

            });
//
//                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//                 [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1" object:nil];
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"My1" object:nil];
//                if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
//                    [MBProgressHUD showError:dict[@"msg"]];
//
//                }



//        }
//        else{
//            [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
//        }


        
        }else{
            
                            [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                             [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1" object:nil];
                            [[NSNotificationCenter defaultCenter] postNotificationName:@"My1" object:nil];
//                            if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
//                                [MBProgressHUD showError:dict[@"msg"]];
            
//                            }
            
            
        }
        
    
    
    
    
    }];
        
        



}

#pragma mark 发送验证码
- (IBAction)sendValidateBtnClick:(id)sender {
    
    
    if (![NSString stringValidateMobile:self.mobileNumTextField.text]) {
        [MBProgressHUD showError:@"手机号码不正确"];
        return;
    }
    
    
    
    
    guiZeView.backgroundColor=[UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:0.3f];
    
    guiZeView.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    make.frame=CGRectMake((kScreenSize.width-280)/2, kScreenSize.height/5-5,280, 190);
    make.Views.  layer.cornerRadius=10;
    [self.view addSubview:guiZeView];
    [guiZeView addSubview:make];
    
    
    if (iPhone6p) {
        makejopBtn.frame=CGRectMake(50, 0, 30, 30);
    }
    else if(iPhone6)
    {
        makejopBtn.frame=CGRectMake(30, 0, 30, 30);
    }
    else
    {
        makejopBtn.frame=CGRectMake(10, 0, 30, 30);
    }
    makeche=make.QuXaio;
   

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYYMMddHHmmss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"%@",currentTimeString);
    [ makeche addTarget:self action:@selector(AdvertisingBtn) forControlEvents:UIControlEventTouchUpInside];
    NSString *ponee=_mobileNumTextField.text;
    userPortrait=[NSString stringWithFormat:@"%@/kaptcha.jpg?phone=%@&timeee=%@",kBaseURL , ponee,currentTimeString];
    //make.tuXing ;
    
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
 SuanXin= make.SuanXin;
    
    [  SuanXin addTarget:self action:@selector(AdvertisingBtn1) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
   }

-(void)AdvertisingBtn
{
    [guiZeView removeFromSuperview];
    [make removeFromSuperview];
    
}
-(void)AdvertisingBtn1
{
    make.ma.text=@"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYYMMddHHmmss"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"%@",currentTimeString);
    [ makeche addTarget:self action:@selector(AdvertisingBtn) forControlEvents:UIControlEventTouchUpInside];
    NSString *ponee=_mobileNumTextField.text;
    userPortrait=[NSString stringWithFormat:@"%@/kaptcha.jpg?phone=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
    //make.tuXing ;
    
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];

    
}



#pragma mark 倒计时
- (void)startTime
{
//    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_sendValidateBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                _sendValidateBtn.userInteractionEnabled = YES;
                  timeout=60;
                 [FNUserDefaults setObject:@"1" forKey:@"otheryanzengma"];
                if (IOS_7) {
                    _sendValidateBtn.enabled = YES;
                }
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_sendValidateBtn setTitle:[NSString stringWithFormat:@"重新发送(%@)",strTime] forState:UIControlStateNormal];
                [FNUserDefaults setObject:strTime forKey:@"othertimeyanzeng"];
                [FNUserDefaults setObject:@"2" forKey:@"otheryanzengma"];
                _sendValidateBtn.userInteractionEnabled = NO;
                if (IOS_7) {
                    _sendValidateBtn.enabled = NO;
                }
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark 退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)download1
{
    
    
    
    NSString *urlstring=[NSString  stringWithFormat:@"%@/v3.0/user/user-info",kBaseURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstring]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request  setValue:[FNUserDefaults objectForKey:@"usersid"] forHTTPHeaderField:@"x-auth-token"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSLog(@"%@",response);
        
        //4.解析
        if (!data) {
            return;
        }
        NSDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        NSLog(@"%@",dict1);
        //5.回到主线程,进行更新页面
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            if (!dict1)
            {
                [Login loginRenZengPhone:[UserAccount getUserLoginInfo].userMobile andPwdnum:[FNUserDefaults objectForKey:@"MD5Pwd"]];
            }
            else if ([[NSString  stringWithFormat:@"%@",dict1[@"code"]] isEqualToString:@"5000"]  ) {
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
               
               
                NSString *status = [defaults objectForKey:@"status"];
                
                if ([[NSString stringWithFormat:@"%@",  status] isEqual:@""] |![[NSString stringWithFormat:@"%@",  status] isEqualToString:[NSString stringWithFormat:@"%@",  dict1[@"data"][@"status"]]]) {
                    
                    [defaults setObject:[NSString stringWithFormat:@"%@",  dict1[@"data"][@"status"]] forKey:@"status"];
                    [defaults synchronize];
                }
                
               
                [[NSNotificationCenter defaultCenter] postNotificationName:FRESH_RICE object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"maketou" object:nil];
               [FNUserDefaults setObject:@"2" forKey:@"maker"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"otherLogin"object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_SUCCESS object:nil];
                [self  dismissViewControllerAnimated:YES completion:^{
                    
                }];
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"removeVC" object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"vipMakeBtn" object:nil];
                
            }
            
            
            
        });
        
        
        
    }];
    
}
- (void)back
{
    [self  dismissViewControllerAnimated:YES completion:^{
        
        
        
    }];
}
-(void)btnmakejop{
    [self.view endEditing:YES];
    
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
    
    
    
    
    
        if (![NSString stringValidateMobile:self.mobileNumTextField.text]) {
            [MBProgressHUD showError:@"手机号码不正确"];
            return;
        }
    
    
    
    // 再次验证手机号是否合法
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_mobileNumTextField.text,
                                                                                    @"captcha":make.ma.text,
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/uaa/login/sms",kBaseURL];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError==nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            
            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"]) {
                    [YYAnimationIndicator              stopAnimationWithLoadText:@"YES" withType:YES];
                    // 倒计时
                    [self startTime];
                    [MBProgressHUD showError:@"发送验证码成功"];
                    [guiZeView removeFromSuperview];
                    [make removeFromSuperview];
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
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_timer) {
        [self stopTimer];
    }
    
    
}
- (void)stopTimer
{
    
    
    dispatch_source_cancel(_timer);
    _timer = nil; // OK
    [_sendValidateBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _sendValidateBtn.userInteractionEnabled = YES;
    timeout=60;
    [FNUserDefaults setObject:@"2" forKey:@"yanzengma"];
    if (IOS_7) {
        _sendValidateBtn.enabled = YES;
    }
}
@end
