//
//  SheZhiZhiFuViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/14.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "SheZhiZhiFuViewController.h"
#import "UserAccount.h"
#import "TuXingView.h"
#import "UIImageView+WebCache.h"
#import "UITextField+DH.h"
#import "UIImage+renderOriginal.h"
@interface SheZhiZhiFuViewController ()<UITextFieldDelegate>
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
     dispatch_source_t _timer;
}
@end

@implementation SheZhiZhiFuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addRightViewWith:self.NewMima withTag:100001];
    [self addRightViewWith:self.queNewMima withTag:100002];
    timeout=60;
    [super viewDidLoad];
    
    [self setupUI];
}
- (void)setupUI
{
    // self.title = @"修改登录密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    guiZeView=[[UIView alloc] init];
    make=[[TuXingView  alloc] init];
    //    [UITextField uitextFieldWith:_oldPwdTextField iconName:@"input_pwd"];
    //    [UITextField uitextFieldWith:_firstPwdTextField iconName:@"input_pwd"];
    //    [UITextField uitextFieldWith:_confirmNewPwdTextField iconName:@"input_pwd"];
    self.NewMima.delegate=self;
    self.queNewMima.delegate=self;
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    //_queding.backgroundColor=[UIColor colorWithRed:0.98f green:0.81f blue:0.41f alpha:1.00f];
    _queding.layer.cornerRadius=20;
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.NewMima];
    [notificaionCenter addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification
                            object:self.queNewMima];
    
    makejopBtn=make.queding;
    [makejopBtn addTarget:self action:@selector(btnmakejop) forControlEvents:UIControlEventTouchUpInside];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.NewMima)
    {
        if (range.location<18)
            return YES;
        
        else
            return NO;
    }else if(textField==self.queNewMima){
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
    _queding.enabled = ( [self.NewMima.text length] > 0
                        && [self.queNewMima.text length] > 0);
}
- (IBAction)huquyanzhema:(id)sender {
    
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

- (IBAction)queding:(id)sender {
    
    [self.view endEditing:YES];
    
    
    if (_NewMima.text.length !=6 | _queNewMima.text.length != 6) {
        [MBProgressHUD showError:@"请输入6位支付密码"];
        return;
    }
    
    if (![_NewMima.text isEqual:_queNewMima.text]) {
        [MBProgressHUD showError:@"两次密码输入不一致"];
        return;
    }
    
    [self downLoad];
    
    
}
-(void)btnmakejop{
    [self.view endEditing:YES];
    
    [self.view endEditing:YES];
    
    
    // 再次验证手机号是否合法
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"captcha":make.ma.text,
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
//    http://p.jryunhui.com/api/wallet/pay_password/sms?access_token=6d32e1aa-323b-4fc8-ba8a-ea0b77e74d84
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@wallet/pay_password/sms?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
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
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_huquyaanzhenma setTitle:@"获取验证码" forState:UIControlStateNormal];
                _huquyaanzhenma.userInteractionEnabled = YES;
                timeout=60;
                [FNUserDefaults setObject:@"1" forKey:@"otheryanzengma"];
                if (IOS_7) {
                    _huquyaanzhenma.enabled = YES;
                }
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_huquyaanzhenma setTitle:[NSString stringWithFormat:@"重新发送(%@)",strTime] forState:UIControlStateNormal];
                [FNUserDefaults setObject:strTime forKey:@"othertimeyanzeng"];
                [FNUserDefaults setObject:@"2" forKey:@"otheryanzengma"];
                _huquyaanzhenma.userInteractionEnabled = NO;
                if (IOS_7) {
                    _huquyaanzhenma.enabled = NO;
                }
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
-(void)downLoad
{
   
    [self.view endEditing:YES];
    


    

    
    
    // 再次验证手机号是否合法
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"code":_YanZengma.text,
                                                                                    @"payPassword":_NewMima.text,
                                                                               
                                                                                    
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
//    POST /wallet/pay_password
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@wallet/pay_password?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
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
                [self.navigationController popViewControllerAnimated:YES];
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
    dispatch_async(dispatch_get_main_queue(), ^{
        [_huquyaanzhenma setTitle:@"获取验证码" forState:UIControlStateNormal];
        _huquyaanzhenma.userInteractionEnabled = YES;
        timeout=60;
        [FNUserDefaults setObject:@"1" forKey:@"otheryanzengma"];
        if (IOS_7) {
            _huquyaanzhenma.enabled = YES;
        }
    });
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
        btn.frame=CGRectMake(0, 0, 21, 11);
        
        if (btn.tag==100001) {
            self.NewMima.secureTextEntry=YES;
        }else if(btn.tag==100002){
            self.queNewMima.secureTextEntry=YES;
        }
    }else{
        [btn setBackgroundImage:[UIImage imageWithRenderOriginalName:@"kyangjing"] forState:UIControlStateSelected];
        btn.frame=CGRectMake(0, 0, 23, 11);
        if (btn.tag==100001) {
            self.NewMima.secureTextEntry=NO;
        }else if(btn.tag==100002){
            self.queNewMima.secureTextEntry=NO;
        }
    }
    [self becomeFirstResponder];//放弃第一响应者
}

@end
