//
//  ChangeLoginPwdController.m
//  DHInvestment
//
//  Created by JJS on 15/9/30.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "ChangeLoginPwdController.h"
#import "UITextField+DH.h"
#import "ForgotPwdController.h"
#import "UserAccount.h"
#import "TuXingView.h"
#import "UIImageView+WebCache.h"
#import "UITextField+DH.h"
#import "LoginController.h"
#import "DHMainController.h"
#import "UIImage+renderOriginal.h"
@interface ChangeLoginPwdController ()<UITextFieldDelegate>
{
      __block int timeout; //倒计时时间
     TuXingView *make;
     UIView *guiZeView;
    UIButton *_guiZeBtn;
    int pageNum;
    UIButton *SuanXin;
    int total;
    UIButton*makejopBtn;
    UILabel *labelee;
    UIButton *makeche;
    NSString *userPortrait;
    NSString *mimaleixing;
    NSMutableDictionary *paramDic12;
    NSString *UrlString;
    
   dispatch_source_t _timer;
   
}
@property (weak, nonatomic) IBOutlet UITextField *yanma;

@property (weak, nonatomic) IBOutlet UITextField    *oldPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField    *firstPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField    *confirmNewPwdTextField;

@property (weak, nonatomic) IBOutlet UIButton       *forgotPwdBtn;
@property (weak, nonatomic) IBOutlet UIButton       *doneBtn;
@property (weak, nonatomic) IBOutlet UIButton *sendValidateBtn;

@end

@implementation ChangeLoginPwdController

- (void)viewDidLoad {
     timeout=60;
    [super viewDidLoad];
    
    [self addRightViewWith:self.oldPwdTextField withTag:100001];
    [self addRightViewWith:self.firstPwdTextField withTag:100002];
    [self addRightViewWith:self.confirmNewPwdTextField withTag:100003];
    if ([_code123 isEqualToString:@"1"]) {
        mimaleixing=@"person/password/sms";
    }else
    {
       mimaleixing=@"wallet/pay_password/sms";
    }
    [self setupUI];
}


#pragma mark 设置页面
- (void)setupUI
{
   // self.title = @"修改登录密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    guiZeView=[[UIView alloc] init];
    make=[[TuXingView  alloc] init];
//    [UITextField uitextFieldWith:_oldPwdTextField iconName:@"input_pwd"];
//    [UITextField uitextFieldWith:_firstPwdTextField iconName:@"input_pwd"];
//    [UITextField uitextFieldWith:_confirmNewPwdTextField iconName:@"input_pwd"];
    self.firstPwdTextField.delegate=self;
    self.confirmNewPwdTextField.delegate=self;
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    //_wanchengBtn.backgroundColor=[UIColor colorWithRed:0.98f green:0.81f blue:0.41f alpha:1.00f];
    _wanchengBtn.layer.cornerRadius=20;
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.oldPwdTextField];
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.firstPwdTextField];
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.confirmNewPwdTextField];
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"tokenRenZheng" object:nil];
    makejopBtn=make.queding;
    [makejopBtn addTarget:self action:@selector(btnmakejop) forControlEvents:UIControlEventTouchUpInside];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.firstPwdTextField)
    {
        if (range.location<18)
            return YES;
        
        else
            return NO;
    }else if(textField==self.confirmNewPwdTextField){
        if (range.location<18)
            return YES;
        
        else
            return NO;
        
    }else{
        return YES;
    }
}
#pragma mark 监听完成按钮
- (void)textFieldChange
{
    _doneBtn.enabled = ([self.oldPwdTextField.text length] > 0 && [self.firstPwdTextField.text length] > 0
                              && [self.confirmNewPwdTextField.text length] > 0);
}
-(void)downLoadFinish
{
    [self doneBtnClick:nil];
}
#pragma mark 完成
- (IBAction)doneBtnClick:(id)sender {
    
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    if (![_code123 isEqualToString:@"1"]) {
        if (_firstPwdTextField.text.length != 6 | _confirmNewPwdTextField.text.length != 6) {
            [MBProgressHUD showError:@"请输入6位支付密码"];
            return;
        }
    }
    if (_firstPwdTextField.text.length < 6 | _confirmNewPwdTextField.text.length < 6) {
        [MBProgressHUD showError:@"密码至少是6位"];
        return;
    }
    
    if (![_firstPwdTextField.text isEqual:_confirmNewPwdTextField.text]) {
        [MBProgressHUD showError:@"两次密码输入不一致"];
        return;
    }
    
    // 获取当前时间
   // NSString *currentDateStr = [NSString stringGetCurrentDateStr];
    
   
    

    
    [self downLoad];
  

}

#pragma mark 忘记密码
- (IBAction)forgotBtnClick:(UIButton *)sender {
    ForgotPwdController *forgotPwd = [[ForgotPwdController alloc] init];
    
    UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:forgotPwd];
    [self presentViewController:avc animated:YES completion:^{
        
    }];
}
-(NSString *)bs64:(NSData *)data
{
    
    NSData  *str2=[data  base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    NSString *str=[[NSString alloc] initWithData:str2  encoding:NSUTF8StringEncoding];
    return str;
}
- (IBAction)yanzhengma:(id)sender {
    
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
    NSString *ponee=[FNUserDefaults objectForKey:@"usersid"];
   userPortrait=[NSString stringWithFormat:@"%@kaptcha.jpg?access_token=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
    //make.tuXing ;
    
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    SuanXin= make.SuanXin;
    
    [  SuanXin addTarget:self action:@selector(AdvertisingBtn1) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    
}
-(void)downLoad
{

    [self.view endEditing:YES];

    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    

    
    
    // 再次验证手机号是否合法
    if([mimaleixing isEqualToString:@"wallet/pay_password/sms"])
    {
        UrlString=@"wallet/pay_password";
        paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                        @"code":_yanma.text,
                                                                                        @"newPayPassword":_confirmNewPwdTextField.text,
                                                                                        @"oldPayPassword":_oldPwdTextField.text,
                                                                                        
                                                                                        }];
    }
    else{
        
        if ([self.title isEqualToString:@"修改支付密码"]) {
             UrlString=@"wallet/pay_password";
        }else{
            
             UrlString=@"person/password";
            
        }
        
      paramDic12 = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                        @"code":_yanma.text,
                                                                                        @"newPassword":_confirmNewPwdTextField.text,
                                                                                        @"oldPassword":_oldPwdTextField.text,
                                                                                        
                                                                                        }];
        // uid
    }
  
    
    
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic12 options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@%@?access_token=%@",kBaseURL,UrlString,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"PUT"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        NSLog(@"%@",dict);
        //5.回到主线程,进行更新页面
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"]) {
                [YYAnimationIndicator              stopAnimationWithLoadText:@"YES" withType:YES];
                // 倒计时
                 [MBProgressHUD showError:@"修改成功"];
                [self startTime];
                [self.navigationController popViewControllerAnimated:YES];
               // [MBProgressHUD showError:@"发送验证码成功"];
                
//                LoginController *login=[[LoginController alloc] init];
//                UINavigationController *avc=[[UINavigationController alloc] initWithRootViewController:login];
//                [self presentViewController:avc animated:YES completion:^{
//                    
//                }];;
//                NSFileManager *fileManager = [NSFileManager defaultManager];
//                
//                if ([fileManager isDeletableFileAtPath:kFilePath]) {
//                    [fileManager removeItemAtPath:kFilePath error:nil];
//                    
//                }
//                [FNUserDefaults removeObjectForKey:@"usersid"];
//                // [FNUserDefaults removeObjectForKey:@"usersid"];
//                
//                [FNUserDefaults setObject:@"2" forKey:@"guimijihuaguanggao"];
//                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//                [defaults removeObjectForKey:@"renzheng1234"];
//                [FNUserDefaults removeObjectForKey:@"status123"];
//                
//                if ([_zhangtai isEqualToString:@"1"]) {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"123" object:nil];
//                    [self.navigationController popViewControllerAnimated:YES];
//                    [FNUserDefaults removeObjectForKey:@"dengluren"];
//                }
//                else
//                {
//                    self.view.window.rootViewController = [[DHMainController alloc] init];
//                    [self.navigationController popViewControllerAnimated:YES];
//                }
//

                [guiZeView removeFromSuperview];
                [make removeFromSuperview];
            }
            [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
            
            if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
                [MBProgressHUD showError:dict[@"msg"]];
                
            }
            
        });
        
        
        
        
        
        
    }];

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
    NSString *ponee=[FNUserDefaults objectForKey:@"usersid"];
  userPortrait=[NSString stringWithFormat:@"%@kaptcha.jpg?access_token=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
    //make.tuXing ;
    
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [make.tuXing sd_setImageWithURL:[NSURL URLWithString:userPortrait] placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    
}

-(void)btnmakejop{
    [self.view endEditing:YES];
    
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
    //    if (![NSString stringValidateMobile:self.mobileNumTextField.text]) {
    //        [MBProgressHUD showError:@"手机号码不正确"];
    //        return;
    //    }
    
    
    
    // 再次验证手机号是否合法
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"captcha":make.ma.text,
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@%@?access_token=%@",kBaseURL,mimaleixing,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
     
            
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
            
            
      
        
        
        
    }];
    
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
    [FNUserDefaults setObject:@"1" forKey:@"yanzengma"];
    if (IOS_7) {
        _sendValidateBtn.enabled = YES;
    }
}
-(void)addRightViewWith:(UITextField *)textField withTag:(NSInteger)tag{
    UIView *bgVIew =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 13)];
    bgVIew.userInteractionEnabled=YES;
    
    
    
    UIButton *rightImageV = [[UIButton alloc] init];
    textField.secureTextEntry = YES;
    rightImageV.tag=tag;
    [rightImageV addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    //    [UIImage]
    [rightImageV setBackgroundImage:[UIImage  imageWithRenderOriginalName:@"byanjing"] forState:UIControlStateNormal];
    rightImageV.frame = CGRectMake(0, 0, 21, 13);
    //    rightImageV.centerY = self.centerY;
    [bgVIew addSubview:rightImageV];
    textField.rightView = bgVIew;
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
        
        if (btn.tag==100001) {
            self.oldPwdTextField.secureTextEntry=YES;
        }else if(btn.tag==100002){
            self.firstPwdTextField.secureTextEntry=YES;
            
            
        }else{
            self.confirmNewPwdTextField.secureTextEntry=YES;
            
            
        }
        
        
//        self.pwdTextField.secureTextEntry = YES;
    }else{
        //        self.font = [UIFont systemFontOfSize:16];
        [btn setBackgroundImage:[UIImage imageWithRenderOriginalName:@"kyangjing"] forState:UIControlStateSelected];
        btn.frame=CGRectMake(0, 0, 23, 11);
        if (btn.tag==100001) {
        self.oldPwdTextField.secureTextEntry=NO;
        }else if(btn.tag==100002){
        self.firstPwdTextField.secureTextEntry=NO;
        }else{
    self.confirmNewPwdTextField.secureTextEntry=NO;
        }
    }
    [self becomeFirstResponder];//放弃第一响应者
}

@end
