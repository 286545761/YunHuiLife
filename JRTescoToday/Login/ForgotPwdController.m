//
//  ForgotPwdController.m
//  DHInvestment
//
//  Created by JJS on 15/9/22.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//  忘记密码

#import "ForgotPwdController.h"
#import "UIBarButtonItem+DH.h"
#import "UITextField+DH.h"
#import "SetPassWordController.h"
#import "UIImageView+WebCache.h"
#import "UserAccount.h"
#import "LoginController.h"
#import "TuXingView.h"
#import "checkTool.h"

@interface ForgotPwdController ()<UITextFieldDelegate>
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

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *validateTextField;

@property (weak, nonatomic) IBOutlet UIButton *sendValidateBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;             // 完成按钮

@property (weak, nonatomic) IBOutlet UITextField *fistPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;

@end

@implementation ForgotPwdController
{
      __block int timeout; //倒计时时间
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"忘记密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    timeout=60;
    guiZeView=[[UIView alloc] init];
    make=[[TuXingView  alloc] init];
//    if ([[FNUserDefaults  objectForKey:@"fotgotyanzengma"] isEqualToString:@"2"]) {
//        timeout=[[FNUserDefaults objectForKey:@"forgottimeyanzeng"] intValue];
//        [self startTime];
//    }

    _fistPwdTextField.delegate=self;
    _confirmPwdTextField.delegate=self;
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    [notificaionCenter addObserver:self selector:@selector(textChangeForSendValidateBtn) name:UITextFieldTextDidChangeNotification
                            object:_phoneNumTextField];
    [notificaionCenter addObserver:self selector:@selector(textChangeForNextBtn) name:UITextFieldTextDidChangeNotification
                            object:_validateTextField];
    [notificaionCenter addObserver:self selector:@selector(textChangeForNextBtn) name:UITextFieldTextDidChangeNotification
                            object:_fistPwdTextField];
    [notificaionCenter addObserver:self selector:@selector(textChangeForNextBtn) name:UITextFieldTextDidChangeNotification
                            object:_confirmPwdTextField];
    makejopBtn=make.queding;
    [makejopBtn addTarget:self action:@selector(btnmakejop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
   // self.navigationController.navigationBar.barTintColor=[UIColor colorWithHexString:BunRed];
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
    }
    
    if ([UserAccount getUserLoginInfo].userMobile) {
        self.phoneNumTextField.text = [UserAccount getUserLoginInfo].userMobile;
//      self.phoneNumTextField.enabled = NO;
        self.sendValidateBtn.enabled = YES;
    }
    self.navigationController.navigationBarHidden=NO;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    //self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"blue"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage=[[UIImage alloc] init];
    self.navigationController.navigationBar.shadowImage=[[UIImage alloc] init];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(back) name:@"otherLogin" object:nil];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"nav_return_all"higlightedImage:nil target:self action:@selector(back)];
    self.view.backgroundColor=[UIColor whiteColor];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    if (_timer) {
        [self stopTimer];
    }
    
    
}
- (void)stopTimer
{


    dispatch_source_cancel(_timer);
        _timer = nil; // OK

    dispatch_async(dispatch_get_main_queue(), ^{
        [_sendValidateBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _sendValidateBtn.userInteractionEnabled = YES;
        timeout=60;
        [FNUserDefaults setObject:@"1" forKey:@"otheryanzengma"];
        if (IOS_7) {
            _sendValidateBtn.enabled = YES;
        }
    });
    
    
}




#pragma mark 监听发送验证码
- (void)textChangeForSendValidateBtn
{
    _sendValidateBtn.enabled = [_phoneNumTextField.text length] > 0;
                            
}

#pragma mark 监听完成按钮
- (void)textChangeForNextBtn
{
    _nextBtn.enabled = ([_validateTextField.text length] > 0) && ([_fistPwdTextField.text length] > 0)
                                                              && ([_confirmPwdTextField.text length] > 0);
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==_fistPwdTextField)
    {
        if (range.location<18)
            return YES;
        
        else
            return NO;
    }else if(textField==_confirmPwdTextField){
        if (range.location<18)
            return YES;
        
        else
            return NO;
        
    }else{
        return YES;
    }
}
#pragma mark 发送验证码
- (IBAction)sendValidateBtnClick:(id)sender {
    
    if ([checkTool wl_isMobileNumberClassification:self.phoneNumTextField.text]==NO) {
        
        [MBProgressHUD showError:@"请检查手机号"];
        
        return ;
    }
    
   // guiZeView.backgroundColor=[UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:0.3f];
    
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
    NSString *ponee=_phoneNumTextField.text;
   userPortrait=[NSString stringWithFormat:@"%@kaptcha.jpg?phone=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
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
    NSString *ponee=_phoneNumTextField.text;
userPortrait=[NSString stringWithFormat:@"%@kaptcha.jpg?phone=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
    //make.tuXing ;
    
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    
}


#pragma mark 完成
- (IBAction)nextBtnClick:(id)sender {
    
    [self.view endEditing:YES];
    NSUserDefaults *myUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str=@"2";
    [myUserDefaults setObject:str forKey:@"renzhen"];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
    // 再次验证手机号码 防止 避验证码输入
    if (![NSString stringValidateMobile:_phoneNumTextField.text]) {
        [MBProgressHUD showError:@"手机号码不正确"];
        return;
    }
    
    // 检验验证码  是否为数字
    if (![NSString stringValidateCureNum:_validateTextField.text]) {
        [MBProgressHUD showError:@"验证码有误"];
        return;
    }
    
   
    if (_fistPwdTextField.text.length < 6 | _confirmPwdTextField.text.length < 6) {
        [MBProgressHUD showError:@"密码至少是6位"];
        return;
    }
    
    if (![_fistPwdTextField.text isEqual:_confirmPwdTextField.text]) {
        [MBProgressHUD showError:@"两次输入不一致"];
        return;
    }

    
 
    // key排序
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_phoneNumTextField.text,
                                                                                    @"code":_validateTextField.text,
                                                                                    @"password":_confirmPwdTextField.text}];
 
    
    [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在..."];
    
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@forget",kBaseURL];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError==nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            
            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"]) {

                    
                            [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
                            

                    [self dismissViewControllerAnimated:YES completion:^{
                        
                    }];

                
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

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark 返回


#pragma mark 倒计时
- (void)startTime
{

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
_timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_sendValidateBtn setTitle:@"验证码" forState:UIControlStateNormal];
                 [FNUserDefaults setObject:@"1" forKey:@"fotgotyanzengma"];
                timeout=60;
                _sendValidateBtn.userInteractionEnabled = YES;
                if (IOS_7) {
                    _sendValidateBtn.enabled = YES;
                }
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_sendValidateBtn setTitle:[NSString stringWithFormat:@"重新发送(%@)",strTime] forState:UIControlStateNormal];
                
                [FNUserDefaults setObject:strTime forKey:@"forgottimeyanzeng"];
                [FNUserDefaults setObject:@"2" forKey:@"fotgotyanzengma"];
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
- (void)back
{
    
    [self  dismissViewControllerAnimated:YES completion:^{
        
        
        
    }];
}
-(void)btnmakejop
{
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
 
    
    
    // 再次验证手机号是否合法];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_phoneNumTextField.text,
                                                                                    @"captcha":make.ma.text,
                                                                                    }];
    

    [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在发送验证码..."];
    
    
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@forget/sms",kBaseURL];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    //[request  setValue:str1 forHTTPHeaderField:@"Authorization"];
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
                    [MBProgressHUD showError:@"验证码发送成功"];
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

@end
