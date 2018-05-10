#import "LoginController.h"
#import "UIBarButtonItem+DH.h"
#import "UserAccount.h"
#import "UITextField+DH.h"
#import "RigisteController.h"
#import "ForgotPwdController.h"
#import "OtherWaysLoginController.h"
#import "BusinessUserViewController.h"
#import "UITextField+DH.h"
//#import "MobClick.h"
#import "CLLockVC.h"
#import "TuXingView.h"
#import "UIImageView+WebCache.h"
#import "UIImage+renderOriginal.h"
@interface LoginController ()<UITextFieldDelegate>
{
    UIButton *_guiZeBtn;
    UIView *guiZeView;
    int pageNum;
    UIView *lineView;
    int total;
    UIButton*makejopBtn;
    UILabel *labelee;
    TuXingView *make;
    UIButton *makeche;
    NSString *userPortrait;
    NSString *string1;
    NSString *leixing;
        UIButton *SuanXin;
}
@property (weak, nonatomic) IBOutlet UIView *GeRenLine;

@property (weak, nonatomic) IBOutlet UITextField *mobileNumTextFileld;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *geRenBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *othreLoginBtn;

- (IBAction)loginBtnClick:(UIButton *)sender;
- (IBAction)forgetPwdBtnClick:(UIButton *)sender;
- (IBAction)otherwaysLoginBtnClick:(UIButton *)sender;
- (IBAction)registerBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ShangJiaBtn;
@property (weak, nonatomic) IBOutlet UIView *ShangJiaLine;

@end

@implementation LoginController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     NSString *status = [FNUserDefaults objectForKey:@"maker"];
    if ([status isEqualToString:@"2"]) {
        [FNUserDefaults removeObjectForKey:@"maker"];
        [self  dismissViewControllerAnimated:YES completion:^{
            
            
            
        }];
        
    }
     self.navigationController.navigationBarHidden=NO;
    if ([_dianjihuodong isEqualToString:@"1000"]) {
        self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"nav_back_btn"higlightedImage:nil target:self action:@selector(back)];
        self.navigationController.navigationBarHidden=YES;
    }
   
   
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settingBtn.frame=CGRectMake(kScreenSize.width-70, 10, 60, 60);
   
    [settingBtn addTarget:self action:@selector(enterTeamCard) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setTitle:@"注册" forState:UIControlStateNormal];
    [settingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    settingBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    // [settingBtn setImage:[UIImage imageNamed:@"nav_btn_share"] forState:UIControlStateNormal];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];
    if ([UserAccount getUserLoginInfo].userMobile) {
        self.mobileNumTextFileld.text = [UserAccount getUserLoginInfo].userMobile;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(back) name:@"otherLogin" object:nil];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"register_nav_btn_cancel"higlightedImage:nil target:self action:@selector(back)];
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(back) name:@"otherLogin" object:nil];
   // self.navigationItem.rightBarButtonItem=[ui]
   
  

}
-(void)enterTeamCard
{
    RigisteController *rigister = [[RigisteController alloc] init];
    //rigister.nihao=@"商家";
    [self.navigationController pushViewController:rigister animated:YES];
}
- (void)back
{
   
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"huodong" object:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self  dismissViewControllerAnimated:YES completion:^{
        }];
        [self.navigationController popViewControllerAnimated:NO];
    });
  
}
- (void)back1
{
    [self removeFromParentViewController];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    guiZeView=[[UIView alloc] init];
    make=[[TuXingView  alloc] init];
    [self addRightViewWith:self.pwdTextField];
    makejopBtn=make.queding;
    leixing=@"person";
    [makejopBtn addTarget:self action:@selector(btnmakejop) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"登录";
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:17],
    NSForegroundColorAttributeName:[UIColor blackColor]}];
     

     _logbtn.layer.cornerRadius=5;

    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"nav_back_btn"higlightedImage:nil target:self action:@selector(back)];

    self.view.backgroundColor=[UIColor whiteColor];
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                                          object:self.mobileNumTextFileld];
    
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.pwdTextField];
  
    lineView=[[UIView alloc] init];
    
    lineView.frame = CGRectMake(0, 0, kScreenSize.width/2, 1);
    lineView.backgroundColor = [UIColor colorWithHexString:BunRed];;
    [_line addSubview:lineView];
}


#pragma mark 监听用户输入
- (void)textFieldChange
{
    _loginBtn.enabled = ([self.mobileNumTextFileld.text length] > 0 && [self.pwdTextField.text length] > 0);
     _userzhuce.enabled=([self .mobileNumTextFileld.text length]>0&&[self.pwdTextField.text length]>0);
}
-(void)addRightViewWith:(UITextField *)textField{
    
    UIButton *rightImageV = [[UIButton alloc] init];
    textField.secureTextEntry = YES;
    [rightImageV addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [UIImage]
    [rightImageV setBackgroundImage:[UIImage  imageWithRenderOriginalName:@"byanjing"] forState:UIControlStateNormal];
    rightImageV.frame = CGRectMake(0, 0, 21, 13);
    //    rightImageV.centerY = self.centerY;
    textField.rightView = rightImageV;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
}

//监听右边按钮的点击,切换密码输入明暗文状态
-(void)btnClick:(UIButton *)btn{
    //解决明暗文切换后面空格的问题的两种方式
    //NSString* text = self.text;
    //self.text = @" ";
    //self.text = text;
    //[self becomeFirstResponder];
    [self resignFirstResponder];//取消第一响应者
    btn.selected = !btn.selected;
    if (!btn.selected) {
//        self.font = [UIFont systemFontOfSize:16];
            [btn setBackgroundImage:[UIImage  imageWithRenderOriginalName:@"byanjing"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"byanjing"] forState:UIControlStateNormal];
                btn.frame=CGRectMake(0, 0, 21, 11);
      self.pwdTextField.secureTextEntry = YES;
    }else{
//        self.font = [UIFont systemFontOfSize:16];
        [btn setBackgroundImage:[UIImage imageWithRenderOriginalName:@"kyangjing"] forState:UIControlStateSelected];
           btn.frame=CGRectMake(0, 0, 23, 11);

        self.pwdTextField.secureTextEntry = NO;
    }
    [self becomeFirstResponder];//放弃第一响应者
}

#pragma mark 点击登录
- (IBAction)loginBtnClick:(UIButton *)sender
{
    string1=@"2";
    leixing=@"person";
    if ([[FNUserDefaults objectForKey:@"denglushibai"] isEqualToString:@"登录失败"]) {
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
        NSString *ponee=self.mobileNumTextFileld.text;
        userPortrait=[NSString stringWithFormat:@"%@kaptcha.jpg?phone=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
        //make.tuXing ;
        
        [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
        [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];
        
        SuanXin= make.SuanXin;
        
        [  SuanXin addTarget:self action:@selector(AdvertisingBtn1) forControlEvents:UIControlEventTouchUpInside];
    }
  
    
    
    else{
        [self.view endEditing:YES];
        
        if (![self checkNet]) {
            [MBProgressHUD showError:NO_CONNECT_NET];
            return;
        }
        
        
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
        
        
        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",uuid]forKey:@"usersuuid"];
      
        NSMutableData*postData=[[NSMutableData alloc] initWithData:[[NSString  stringWithFormat:@"username=%@",self.mobileNumTextFileld.text]dataUsingEncoding:NSUTF8StringEncoding]];
       
        [postData  appendData:[[NSString  stringWithFormat:@"&password=%@",_pwdTextField.text]dataUsingEncoding:NSUTF8StringEncoding]];
       
        [postData  appendData:[[NSString stringWithFormat:@"&grant_type=%@",uuid]  dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSString *urlstring=[NSString  stringWithFormat:@"%@uaa/login",kBaseURL];
        NSURL *url = [NSURL URLWithString:urlstring];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        [request setHTTPMethod:@"POST"];
        [request setAllHTTPHeaderFields:headers];
        NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"jrygou-person", @"jrygou-person-secret"];
        NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
        NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
        [request setValue:authValue forHTTPHeaderField:@"Authorization"];
        //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
        [request setHTTPBody:postData];
        NSLog(@"%@", [request allHTTPHeaderFields]);
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            NSLog(@"%@",connectionError);
            if (connectionError==nil) {
                
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                NSLog(@"%ld",httpResponse.statusCode);
                NSLog(@"%@",connectionError);
                NSLog(@"%@",dict);
                //5.回到主线程,进行更新页面
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                    if ([[NSString  stringWithFormat:@"%ld",httpResponse.statusCode] isEqualToString:@"200"])
                    {
                        [FNUserDefaults setObject:@"登录成功"forKey:@"denglushibai"];
                        [YYAnimationIndicator              stopAnimationWithLoadText:@"YES" withType:YES];
                        // 保存信息
                        UserAccount *account = [[UserAccount alloc] init];
                        account.userMobile = self.mobileNumTextFileld.text;
                        account.userPassword = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_pwdTextField.text,@"duohao8888"]]];
                        [account saveUserLoginInfo:account];
                        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"access_token"]]forKey:@"usersid"];
                        // 保存用户是否绑卡状态
//                        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"data"][@"refresh_token"]]forKey:@"oldusersid"];
                         [FNUserDefaults setObject:leixing forKey:@"oldusersid12"];
                        [FNUserDefaults setObject:_pwdTextField.text forKey:@"MD5Pwd"];
                         [FNUserDefaults setObject:leixing forKey:@"dengluren"];
                          [FNUserDefaults synchronize];
              
                        //[MobClick profileSignInWithPUID:account.userMobile];
                        // [MobClick setBackgroundTaskEnabled:YES];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1" object:nil];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"My1" object:nil];
                        [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                        
                        
                        NSString *usersid=  [FNUserDefaults objectForKey:@"usersid"];
                        NSLog(@"_+_+=======%@",usersid);
                        if ([string1 isEqualToString:@"1"]) {
                            //[MBProgressHUD showError:dict[@"msg"]];
                            if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
                                self.navigationController.interactivePopGestureRecognizer.enabled =NO;
                            }
                            BusinessUserViewController *bus=[[BusinessUserViewController alloc] init];;
                            [self.navigationController pushViewController:bus animated:YES];
                            
                            [self back];
                        }
                        else{
                        
                       
                            [self back];
                        }
                    }
                    else
                    {
                       
           
                        NSString *messageS=[NSString stringWithFormat:@"%@",dict[@"message"]];
                        if ([messageS isEqualToString:@"图片验证码错误"]) {
                            [FNUserDefaults setObject:@"登录失败"forKey:@"denglushibai"];
                            [self imageAuthenticationCode];
                        }
                        
                 [MBProgressHUD showError:dict[@"message"]];
                        
                    }
                    [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                    
                    if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
      [MBProgressHUD showError:dict[@"message"]];
                        
                    }
                    
                });
                
                
            }
            else{
               [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
            }
            
            
            
        }];
        

        
    }
    
}

-(void)AdvertisingBtn
{
    make.ma.text=@"";
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
    
    //----------将nsdate按formatter格式转成nsstring [[SDImageCache sharedImageCache]removeImageForKey:url];  
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"%@",currentTimeString);
    [ makeche addTarget:self action:@selector(AdvertisingBtn) forControlEvents:UIControlEventTouchUpInside];
    NSString *ponee=self.mobileNumTextFileld.text;
   userPortrait=[NSString stringWithFormat:@"%@kaptcha.jpg?phone=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
    //make.tuXing ;
    
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    
}

#pragma mark 忘记密码
- (IBAction)forgetPwdBtnClick:(UIButton *)sender {
    
    ForgotPwdController *forgotPwd = [[ForgotPwdController alloc] init];
    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:forgotPwd];
    [self presentViewController:avc animated:YES completion:^{
        
    }];
  
}


#pragma mark 其他方式登录
- (IBAction)otherwaysLoginBtnClick:(UIButton *)sender {
    
    OtherWaysLoginController *otherWays = [[OtherWaysLoginController alloc] init];
    otherWays.logoBackBlock = ^{
        [self back];
    };
    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:otherWays];
    
    [self presentViewController:avc animated:YES completion:^{
        
    }];;
}


#pragma mark 不是米粉去注册
- (IBAction)registerBtnClick:(id)sender {
    
    
}

#pragma mark 退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark 返回
-(void)download1
{
    
    
  
    NSString *urlstring=[NSString  stringWithFormat:@"%@v3.0/user/user-info",kBaseURL];
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
              //  [Login loginRenZengPhone:[UserAccount getUserLoginInfo].userMobile andPwdnum:[FNUserDefaults objectForKey:@"MD5Pwd"]];
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
                if ([_shouYe isEqualToString:@"shouye"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"shouye" object:nil];
                }
               [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1" object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"huodong" object:nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_SUCCESS object:nil];
                [self  dismissViewControllerAnimated:YES completion:^{
                    
                }];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"removeVC" object:nil];
                
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"vipMakeBtn" object:nil];
            }
            
            
            
        });
        
        
        
    }];
    
}

//商家注册
- (IBAction)shangjiazuce:(id)sender {
    
}
//记住账号
- (IBAction)jizhuzhanghuao:(id)sender {
}
//忘记密码
- (IBAction)wangjimima:(id)sender {
}
//商家切换
- (IBAction)Sahngjia:(id)sender {
    _zhuceshanjiaBtn .hidden=NO;
    _othreLoginBtn.hidden=YES;
    _userzhuce.hidden=YES;
    string1=@"1";
    leixing=@"merchant";
    [_ShangJiaBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
   // _ShangJiaLine .backgroundColor=[UIColor  redColor];
    [_geRenBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //_GeRenLine .backgroundColor=[UIColor clearColor];
    [UIView animateWithDuration:0.3 animations:^{
        lineView.frame = CGRectMake(kScreenSize.width/2, 0,kScreenSize.width/2, 1);
    }];
    
    
}
//个人切换
- (IBAction)GeRen:(id)sender {
    _zhuceshanjiaBtn .hidden=YES;
    _othreLoginBtn.hidden=NO;
    _userzhuce.hidden=NO;
     string1=@"2";
    leixing=@"person";
   [_geRenBtn setTitleColor:[UIColor colorWithHexString:BunRed] forState:UIControlStateNormal];
    // _GeRenLine  .backgroundColor=[UIColor  redColor];
 [_ShangJiaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   // _ShangJiaLine.backgroundColor=[UIColor clearColor];
    [UIView animateWithDuration:0.3 animations:^{
        lineView.frame = CGRectMake(0, 0, kScreenSize.width/2, 1);
    }];
}
#pragma mark ---------图片验证码----------
-(void)imageAuthenticationCode{
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
    NSString *ponee=self.mobileNumTextFileld.text;
    userPortrait=[NSString stringWithFormat:@"%@kaptcha.jpg?phone=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
    //make.tuXing ;
    
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    SuanXin= make.SuanXin;
    
    [  SuanXin addTarget:self action:@selector(AdvertisingBtn1) forControlEvents:UIControlEventTouchUpInside];
    
    
}
#pragma mark ---------///个人注册----------
- (IBAction)GeRenZuCe:(id)sender {
     leixing=@"merchant";
      string1=@"1";
    if ([[FNUserDefaults objectForKey:@"denglushibai"] isEqualToString:@"登录失败"]) {
        [self imageAuthenticationCode];
       
    }
    
    
    
    else{
        [self.view endEditing:YES];
        
        if (![self checkNet]) {
            [MBProgressHUD showError:NO_CONNECT_NET];
            return;
        }
        
        
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
        
        
        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",uuid]forKey:@"usersuuid"];
        
        NSMutableData*postData=[[NSMutableData alloc] initWithData:[[NSString  stringWithFormat:@"username=%@",self.mobileNumTextFileld.text]dataUsingEncoding:NSUTF8StringEncoding]];
        
        [postData  appendData:[[NSString  stringWithFormat:@"&password=%@",_pwdTextField.text]dataUsingEncoding:NSUTF8StringEncoding]];
        
        [postData  appendData:[[NSString stringWithFormat:@"&grant_type=%@",uuid]  dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSString *urlstring=[NSString  stringWithFormat:@"%@uaa/login",kBaseURL];
        NSURL *url = [NSURL URLWithString:urlstring];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        [request setHTTPMethod:@"POST"];
        NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"jrygou-person", @"jrygou-person-secret"];
        NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
        NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
        [request setValue:authValue forHTTPHeaderField:@"Authorization"];
        //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
        [request setHTTPBody:postData];
        [request setAllHTTPHeaderFields:headers];
     
        //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
        [request setHTTPBody:postData];
        NSLog(@"%@", [request allHTTPHeaderFields]);
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
            NSLog(@"%ld",httpResponse.statusCode);
            NSLog(@"%@",connectionError);
            if (connectionError==nil) {
                
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                
                NSLog(@"%@",dict);
                //5.回到主线程,进行更新页面
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                    if ([[NSString  stringWithFormat:@"%ld",httpResponse.statusCode] isEqualToString:@"200"])
                    {
                        [FNUserDefaults setObject:@"登录成功"forKey:@"denglushibai"];
                        [YYAnimationIndicator              stopAnimationWithLoadText:@"YES" withType:YES];
                        // 保存信息
                        UserAccount *account = [[UserAccount alloc] init];
                        account.userMobile = self.mobileNumTextFileld.text;
                        account.userPassword = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_pwdTextField.text,@"duohao8888"]]];
                        [account saveUserLoginInfo:account];
                        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"access_token"]]forKey:@"usersid"];
                        // 保存用户是否绑卡状态
                        [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"data"][@"refresh_token"]]forKey:@"oldusersid"];
                        [FNUserDefaults setObject:leixing forKey:@"oldusersid12"];
                        [FNUserDefaults setObject:_pwdTextField.text forKey:@"MD5Pwd"];
                        [FNUserDefaults setObject:leixing forKey:@"dengluren"];
                        //[MobClick profileSignInWithPUID:account.userMobile];
                        // [MobClick setBackgroundTaskEnabled:YES];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1" object:nil];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"My1" object:nil];
                        [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                        if ([string1 isEqualToString:@"1"]) {
                            //[MBProgressHUD showError:dict[@"msg"]];
                            BusinessUserViewController *bus=[[BusinessUserViewController alloc] init];;
                            [self.navigationController pushViewController:bus animated:YES];
                            
                            [self dismissViewControllerAnimated:NO completion:^{
                                
                            }];
                        }
                        else{
                            [self dismissViewControllerAnimated:YES completion:^{
                                
                            }];
                        }
                        
                        //[self download1];
                        
                    }
                    else
                    {
                        NSString *messageS=[NSString stringWithFormat:@"%@",dict[@"message"]];
                        if ([messageS isEqualToString:@"图片验证码错误"]) {
                            [FNUserDefaults setObject:@"登录失败"forKey:@"denglushibai"];
                            [self imageAuthenticationCode];
                        }
             
                        [self AdvertisingBtn];
                        
                    }
                    [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                    
                    if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
         [MBProgressHUD showError:dict[@"message"]];
                        
                    }
                    
                });
                
                
            }
            else{
                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
            }
            
            
            
        }];
        
        
        
    }
    
}
//验证码登录
- (IBAction)yanZengMaDenglu:(id)sender {
    
    
    
    
}
-(void)btnmakejop
{
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
    
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
    NSMutableData*postData=[[NSMutableData alloc] initWithData:[[NSString  stringWithFormat:@"username=%@",self.mobileNumTextFileld.text]dataUsingEncoding:NSUTF8StringEncoding]];
    [postData  appendData:[[NSString  stringWithFormat:@"&captcha=%@",make.ma.text]dataUsingEncoding:NSUTF8StringEncoding]];
    [postData  appendData:[[NSString  stringWithFormat:@"&password=%@",_pwdTextField.text]dataUsingEncoding:NSUTF8StringEncoding]];
    // [postData  appendData:[@"&origin=ios"dataUsingEncoding:NSUTF8StringEncoding]];
    [postData  appendData:[[NSString stringWithFormat:@"&grant_type=%@",uuid]  dataUsingEncoding:NSUTF8StringEncoding]];
    //NSData *postData = [NSJSONSerialization dataWithJSNObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@uaa/login",kBaseURL];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"jrygou-person", @"jrygou-person-secret"];
    NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64Encoding]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:postData];
    [request setAllHTTPHeaderFields:headers];
    //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSLog(@"%@",response);
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        NSLog(@"%ld",httpResponse.statusCode);
        if (connectionError==nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            
            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if ([[NSString  stringWithFormat:@"%ld",httpResponse.statusCode] isEqualToString:@"200"]) {
                    [FNUserDefaults setObject:@"登录成功"forKey:@"denglushibai"];
                    [YYAnimationIndicator              stopAnimationWithLoadText:@"YES" withType:YES];
                    // 保存信息
                    UserAccount *account = [[UserAccount alloc] init];
                    account.userMobile = self.mobileNumTextFileld.text;
                    account.userPassword = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_pwdTextField.text,@"duohao8888"]]];
                    [account saveUserLoginInfo:account];
                    [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"access_token"]]forKey:@"usersid"];
                     [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",dict[@"refresh_token"]]forKey:@"oldusersid"];
                     [FNUserDefaults setObject:leixing forKey:@"oldusersid12"];
                    // 保存用户是否绑卡状态
                    [FNUserDefaults setObject:leixing forKey:@"dengluren"];
                    [FNUserDefaults setObject:_pwdTextField.text forKey:@"MD5Pwd"];
                    //[MobClick profileSignInWithPUID:account.userMobile];
                    // [MobClick setBackgroundTaskEnabled:YES];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD1" object:nil];
                     [[NSNotificationCenter defaultCenter] postNotificationName:@"My1" object:nil];
                    [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                    [self dismissViewControllerAnimated:YES completion:^{
                        
                    }];
                    if ([string1 isEqualToString:@"1"]) {
                        
                        BusinessUserViewController *bus=[[BusinessUserViewController alloc] init];;
                        [self.navigationController pushViewController:bus animated:YES];
                        [self dismissViewControllerAnimated:NO completion:^{
                            
                        }];
                    }
                    
                }
                else{
                    
                    NSString *messageS=[NSString stringWithFormat:@"%@",dict[@"message"]];
//                    if (![messageS isEqualToString:@"该用户未注册"]) {
//                        [FNUserDefaults setObject:@"登录失败"forKey:@"denglushibai"];
//                    }
                    
                    if ([messageS isEqualToString:@"图片验证码错误"]) {
                        [FNUserDefaults setObject:@"登录失败"forKey:@"denglushibai"];
                        [self imageAuthenticationCode];
                    }
                    
                   
                   [self AdvertisingBtn]; dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                           [MBProgressHUD showError:dict[@"message"]];

                        
                    });
                  
             
                }
                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                
                if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
                     [self AdvertisingBtn];
                    [MBProgressHUD showError:dict[@"message"]];
                   
                }
                
            });
            
            
        }
        else{
         
            [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
        }
        
        
        
    }];
    

}
@end
