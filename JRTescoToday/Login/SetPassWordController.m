//
//  SetPassWordController.m
//  DHInvestment
//
//  Created by JJS on 15/9/22.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//  设置密码

#import "SetPassWordController.h"
#import "UIBarButtonItem+DH.h"
#import "LoginController.h"
#import "UITextField+DH.h"
#import "UserAccount.h"

@interface SetPassWordController ()

@property (weak, nonatomic) IBOutlet UITextField *fistPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation SetPassWordController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"设置密码";
    
    [UITextField uitextFieldWith:_fistPwdTextField iconName:@"input_pwd"];
    [UITextField uitextFieldWith:_confirmPwdTextField iconName:@"input_pwd"];
    
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    [notificaionCenter addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification
                            object:_fistPwdTextField];
    [notificaionCenter addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification
                            object:_confirmPwdTextField];
    
}


#pragma mark 监听发送验证码
- (void)textChange
{
    _nextBtn.enabled = ([_fistPwdTextField.text length] > 0 && [_confirmPwdTextField.text length] > 0);
}

#pragma mark 下一步
- (IBAction)nextBtnClick:(id)sender {
    
    [self.view endEditing:YES];
    
    if (![self checkNet]) {
        [MBProgressHUD showError:NO_CONNECT_NET];
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
    
    // 获取当前时间
    NSString *currentDateStr = [NSString stringGetCurrentDateStr];
    
    NSString *MD5Pwd = [NSString md5:[NSString md5:[NSString stringWithFormat:@"%@%@",_confirmPwdTextField.text,@"duohao8888"]]];
    
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":[UserAccount getUserLoginInfo].userMobile,@"newPassword":MD5Pwd}];
    
    // uid
    NSString *uid = [NSString getUIDWihtCurrentDateStr:currentDateStr dic:paramDic];
    
    [paramDic setObject:currentDateStr forKey:@"times"];
    [paramDic setObject:uid forKey:@"uid"];

    [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在设置密码..."];
    
    [HttpTool postWithBaseURL:kBaseURL path:@"manage/user/resetLoginPassword" params:paramDic success:^(id data) {
        
        UserAccount *account = [[UserAccount alloc] init];
        account.userPassword = self.confirmPwdTextField.text;
        [account saveUserLoginInfo:account];

        
        [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
        
        LoginController *login = [[LoginController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
            

        
    } failure:^(NSError *error) {
        [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
        
    } alertInfo:^(NSString *alertInfo) {
        [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
        [MBProgressHUD showError:alertInfo];
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"removeVC" object:nil];
}

#pragma mark 退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark 返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
  
}
@end
