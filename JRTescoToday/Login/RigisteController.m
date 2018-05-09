//
//  RigisteController.m
//  DHInvestment
//
//  Created by JJS on 15/9/8.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//  注册

#import "UIBarButtonItem+DH.h"
#import "RigisteController.h"
#import "LoginController.h"
#import "HttpTool.h"
#import "UITextField+DH.h"
#import "AFNetworking.h"
#import "NSString+DH.h"
#import "UITextField+DH.h"
#import "IQKeyboardManager.h"
#import "TuXingView.h"
#import "UIImageView+WebCache.h"
#import "wepViewController.h"
#import "checkTool.h"
//#import "XiaoXiWebViewController.h"
#import "ZhucEXieYiViewController.h"
#import "UIImage+renderOriginal.h"

@interface RigisteController ()<UITextFieldDelegate>
{
    UIButton *_guiZeBtn;
    UIView *guiZeView;
    int pageNum;
    
    int total;
    UIButton*makejopBtn;
    UILabel *labelee;
    TuXingView *make;
    UIButton *makeche;
    NSString *userPortrait;
    NSString *leixing;
    UIButton *SuanXin;
    dispatch_source_t _timer;
}
@property (weak, nonatomic) IBOutlet UITextField *mobileNumTextField;           // 手机号
@property (weak, nonatomic) IBOutlet UITextField *validateTextField;            // 验证码
@property (weak, nonatomic) IBOutlet UITextField *firstPwdTextField;            // 首次密码
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;          // 确认密码
@property (weak, nonatomic) IBOutlet UITextField *friendMobileNumTextField;     // 好友推荐码
@property (weak, nonatomic) IBOutlet UIButton *sendValidateBtn;
@property (weak, nonatomic) IBOutlet UIButton *nowRigisteBtn;
@property (weak, nonatomic) IBOutlet UIButton *agreementBtn;

@end

@implementation RigisteController
{
    NSMutableDictionary *_dictionary;
     __block int timeout;
}


#pragma mark 注册协议
- (IBAction)agreementBtnClick:(UIButton *)sender {
    
//    if (![self checkNet]) {
//        [MBProgressHUD showError:NO_CONNECT_NET];
//        return;
//    }
    
    ZhucEXieYiViewController *    ZhucEXieYVC=[[ZhucEXieYiViewController alloc]init];
    
    
//    wepViewController *nam=[[wepViewController alloc] init];
//    nam.string=@"http://static.jregou.com/view/rule.html";
//    nam.sting2=@"注册协议";
    [self.navigationController pushViewController:ZhucEXieYVC animated:YES];
  

}
-(void)viewWillAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_return_all"
                                                                     higlightedImage:nil target:self action:@selector(back)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // NSLog(@"_inviter%@",_inviter);
    if (_inviter) {
        _Tui.text=_inviter;
    }else
    {
      _Tui.text=@"";
    }
    [self addRightViewWith:self.firstPwdTextField withTag:10011];
   
    [self addRightViewWith:self.confirmPwdTextField withTag:10012];
    
    
    guiZeView=[[UIView alloc] init];
    make=[[TuXingView  alloc] init];
    makejopBtn=make.queding;
    [makejopBtn addTarget:self action:@selector(btnmakejop) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"注册";
     timeout=60; //倒计时时间
    if (![_nihao isEqualToString:@"商家"]) {
         leixing=@"person";
       // _viewname.frame=CGRectMake(0, -160, kScreenSize.width, kScreenSize.height);
        _shangjai.hidden=YES;
        _shangjiatext.hidden=YES;
//        UIView *makeView=[[UIView alloc] init];
//        makeView.frame=CGRectMake(0, 0, kScreenSize.width, 20);
//        makeView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
//        [self.view addSubview:makeView];
    }
    else{
       leixing=@"merchant";
       // _viewname.frame=CGRectMake(0, -160, kScreenSize.width, kScreenSize.height);
        _shangjai.hidden=YES;
        _shangjiatext.hidden=YES;
//        UIView *makeView=[[UIView alloc] init];
//        makeView.frame=CGRectMake(0, 0, kScreenSize.width, 20);
//        makeView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
//        [self.view addSubview:makeView];
    }
  
//    if ([[FNUserDefaults  objectForKey:@"yanzengma"] isEqualToString:@"2"]) {
//        timeout=[[FNUserDefaults objectForKey:@"timeyanzeng"] intValue];
//         [self startTime];
//    }
     _rigistBtn.layer.cornerRadius=20;
    [_agreementBtn setTitleColor:[UIColor colorWithHexString:kSelectedlColor] forState:UIControlStateNormal];
    
    [_sendValidateBtn setTitleColor:[UIColor colorWithRed:0.99f green:0.76f blue:0.62f alpha:1.00f] forState:UIControlStateNormal];
    
    self.mobileNumTextField.delegate=self;
    self.firstPwdTextField.delegate=self;
    self.confirmPwdTextField.delegate=self;
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    [notificaionCenter addObserver:self selector:@selector(textFieldChangeForValidateBtn)                                     name:UITextFieldTextDidChangeNotification
                            object:self.mobileNumTextField];
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.validateTextField];
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.firstPwdTextField];
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.confirmPwdTextField];
}

#pragma mark 监听发送验证码按钮
- (void)textFieldChangeForValidateBtn
{
     _sendValidateBtn.enabled = [self.mobileNumTextField.text length] > 0;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.firstPwdTextField)
    {
        if (range.location<18)
            return YES;
        
        else
            return NO;
    }else if(textField==self.confirmPwdTextField){
        if (range.location<18)
            return YES;
        
        else
            return NO;
    
    }else if(textField==self.mobileNumTextField){
        if (range.location>=11)
            return NO;
        
        else
            return YES;
        
    }else{
        return YES;
    }
}

#pragma mark 监听注册按钮
- (void)textFieldChange
{
    _nowRigisteBtn.enabled = ([self.validateTextField.text length] > 0 && [self.firstPwdTextField.text length] > 0
                                      && [self.confirmPwdTextField.text length] > 0);
}

#pragma mark 发送验证码
- (IBAction)sendValidateBtnClick:(id)sender
{
    if ([checkTool wl_isMobileNumberClassification:self.mobileNumTextField.text]==NO) {
        
        [MBProgressHUD showError:@"请检查手机号"];
        
        return ;
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
    userPortrait=[NSString stringWithFormat:@"%@/kaptcha.jpg?phone=%@&timeee=%@",kBaseURL,ponee,currentTimeString];
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

#pragma mark 马上注册
- (IBAction)registBtnClick:(id)sender{
        leixing=@"person";
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }

    if (![_firstPwdTextField.text isEqual:_confirmPwdTextField.text]) {
        [MBProgressHUD showError:@"两次密码不一致"];
        return;
    }

    if (_firstPwdTextField.text.length < 6 | _confirmPwdTextField.text.length < 6) {
        [MBProgressHUD showError:@"密码至少是6位"];
        return;
    }
    // 获取当前时间
   
    
    
   // NSString *MD5Pwd = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_confirmPwdTextField.text,@"duohao8888"]]];
    // key排序
    NSMutableDictionary *paramDic;
    if (_Tui.text.length>0) {
        paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":self.mobileNumTextField.text,
                                                                                        @"password":_confirmPwdTextField.text,
                                                                                        @"code":_validateTextField.text,
                                                                                        @"inviter":_Tui.text
                                                                                        }];
    }else{
        
        
paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":self.mobileNumTextField.text,
                                                                                        @"password":_confirmPwdTextField.text,
                                                                                        @"code":_validateTextField.text
                                                                                        }];
    }
    
  
    // uid
   

    [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在注册..."];
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/regist",kBaseURL];
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
                    [FNUserDefaults setObject:_confirmPwdTextField.text forKey:@"MD5Pwd"];
                        [MBProgressHUD showError:@"注册成功"];
                       [self loginBtnClick:nil];
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

#pragma mark 登录
- (IBAction)loginBtnClick:(UIButton *)sender
{
      [self.navigationController popViewControllerAnimated:YES];
}
- (void)stopTimer
{

    
    dispatch_source_cancel(_timer);
    _timer = nil; // OK
    dispatch_async(dispatch_get_main_queue(), ^{
        [_sendValidateBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _sendValidateBtn.userInteractionEnabled = YES;
        timeout=60;
        [FNUserDefaults setObject:@"1" forKey:@"yanzengma"];
        if (IOS_7) {
            _sendValidateBtn.enabled = YES;
        }
        
    });
}
#pragma mark 倒计时
- (void)startTime
{
    
       //timeout=60; //倒计时时间
    
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
                   [FNUserDefaults setObject:@"1" forKey:@"yanzengma"];
                if (IOS_7) {
                    _sendValidateBtn.enabled = YES;
                }
            });
        }else{
            int seconds = timeout % 120;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_sendValidateBtn setTitle:[NSString stringWithFormat:@"重新发送(%@)",strTime] forState:UIControlStateNormal];
                 [FNUserDefaults setObject:strTime forKey:@"timeyanzeng"];
                [FNUserDefaults setObject:@"2" forKey:@"yanzengma"];
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
-(void)btnmakejop
{
    
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
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_mobileNumTextField.text,
                                                                                    @"captcha":make.ma.text,
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/regist/sms",kBaseURL];
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
#pragma mark 退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return [self.view endEditing:YES];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)back
{
     [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_HAND_PWD12333" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
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
- (IBAction)zhuceBtn:(id)sender {
    leixing=@"merchant";
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
    if (![_firstPwdTextField.text isEqual:_confirmPwdTextField.text]) {
        [MBProgressHUD showError:@"两次密码不一致"];
        return;
    }
    
    if (_firstPwdTextField.text.length < 6 | _confirmPwdTextField.text.length < 6) {
        [MBProgressHUD showError:@"密码至少是6位"];
        return;
    }
    // 获取当前时间
    
    
    
    // NSString *MD5Pwd = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_confirmPwdTextField.text,@"duohao8888"]]];
    // key排序
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":self.mobileNumTextField.text,
                                                                                    @"password":_confirmPwdTextField.text,
                                                                                    @"code":_validateTextField.text,
                                                                                    @"inviter":_Tui.text
                                                                                    
                                                                                    }];
    // uid
    
    
    [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在注册..."];
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/register/%@",kBaseURL,leixing];
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
                    [FNUserDefaults setObject:_confirmPwdTextField.text forKey:@"MD5Pwd"];
                    [MBProgressHUD showError:@"注册成功"];
                    [self loginBtnClick:nil];
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
- (IBAction)shangjiszhuce:(id)sender {
    leixing=@"merchant";
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
        return;
    }
    
    if (![_firstPwdTextField.text isEqual:_confirmPwdTextField.text]) {
        [MBProgressHUD showError:@"两次密码不一致"];
        return;
    }
    
    if (_firstPwdTextField.text.length < 6 | _confirmPwdTextField.text.length < 6) {
        [MBProgressHUD showError:@"密码至少是6位"];
        return;
    }
    // 获取当前时间
    
    
    
    // NSString *MD5Pwd = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_confirmPwdTextField.text,@"duohao8888"]]];
    // key排序
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":self.mobileNumTextField.text,
                                                                                    @"password":_confirmPwdTextField.text,
                                                                                    @"code":_validateTextField.text,
                                                                                    @"inviter":_Tui.text
                                                                                    
                                                                                    }];
    // uid
    
    
    [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在注册..."];
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/register/%@",kBaseURL,leixing];
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
                    [FNUserDefaults setObject:_confirmPwdTextField.text forKey:@"MD5Pwd"];
                    [MBProgressHUD showError:@"注册成功"];
                    [self loginBtnClick:nil];
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
- (IBAction)ShangjiaZuCe:(id)sender
{
    

    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_timer) {
        [self stopTimer];
    }
    
    
}
-(void)addRightViewWith:(UITextField *)textField withTag:(NSInteger)tag{
    
    UIButton *rightImageV = [[UIButton alloc] init];
    textField.secureTextEntry = YES;
    rightImageV.tag=tag;
    [rightImageV addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    [rightImageV setBackgroundImage:[UIImage  imageWithRenderOriginalName:@"byanjing"] forState:UIControlStateNormal];
    rightImageV.frame = CGRectMake(0, 0, 21, 11);
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
        [btn setBackgroundImage:[UIImage imageWithRenderOriginalName:@"byanjing"] forState:UIControlStateNormal];
        btn.frame=CGRectMake(0, 0, 21, 11);
        if (btn.tag==10011) {
        self.firstPwdTextField.secureTextEntry = YES;
            
        }else{
             self.confirmPwdTextField.secureTextEntry = YES;
            
        }
//        self.pwdTextField.secureTextEntry = YES;
    }else{
        //        self.font = [UIFont systemFontOfSize:16];
         btn.frame=CGRectMake(0, 0, 23, 11);
        [btn setBackgroundImage:[UIImage imageWithRenderOriginalName:@"kyangjing"] forState:UIControlStateSelected];
        if (btn.tag==10011) {
            self.firstPwdTextField.secureTextEntry = NO;
            
        }else{
            self.confirmPwdTextField.secureTextEntry = NO;
            
        }
    }
    [self becomeFirstResponder];//放弃第一响应者
}


@end
