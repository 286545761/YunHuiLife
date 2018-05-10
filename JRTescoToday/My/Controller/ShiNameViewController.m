//
//  ShiNameViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/7.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShiNameViewController.h"
#import "TuXingView.h"
@interface ShiNameViewController ()
{
    UIButton *_guiZeBtn;
    UIView *guiZeView;
    int pageNum;
   
    int total;
    UIButton*makejopBtn;
    UILabel *labelee;
    TuXingView *make;
    UIButton *makeche;
   
}
@end

@implementation ShiNameViewController

-(void)viewWillAppear:(BOOL)animated{
     self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"实名认证";
     guiZeView=[[UIView alloc] init];
     make=[[TuXingView  alloc] init];
     [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
}
- (IBAction)yanzhengma:(id)sender {
    
    guiZeView.backgroundColor=[UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:0.3f];
  
        guiZeView.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
        make.frame=CGRectMake((kScreenSize.width-280)/2, kScreenSize.height/5-5,280, 190);
    make.Views.  layer.cornerRadius=10;
    [self.tabBarController.view addSubview:guiZeView];
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
    [ makeche addTarget:self action:@selector(AdvertisingBtn) forControlEvents:UIControlEventTouchUpInside];
   
 
    
}
-(void)AdvertisingBtn
{
    [guiZeView removeFromSuperview];
    [make removeFromSuperview];
    
}
- (IBAction)queding:(id)sender {
    [self downLoad1:nil];//单迎卓
}
-(void)downLoad1:(NSString *)idnn
{
    
    if ([_UserId.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"身份证号不能为空"];
        return;
    }
    if ([_UserName.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"姓名不能为空"];//单迎卓
        return;
    }
  
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"identity":_UserId.text,
                                                                                     @"name":_UserName.text,
                                                                                    }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@wallet/auth?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
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
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
                {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                    [MBProgressHUD showError:@"实名成功"];
                }else
                {
                    [MBProgressHUD showError:dict[@"msg"]];
                }
            });
            
            
            

        
        
        
        
        
    }];
    
    
}

@end
