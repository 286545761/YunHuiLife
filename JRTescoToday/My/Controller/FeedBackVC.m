//
//  FeedBackVC.m
//  DHInvestment
//
//  Created by Andy on 15/9/5.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "FeedBackVC.h"
#import "FeedBackView.h"
#import "UserAccount.h"
#import "WSStarRatingView.h"
#import "UIImageView+WebCache.h"
@interface FeedBackVC ()<StarRatingViewDelegate>
{
    NSString* mailText;
    NSString* ideaText;
    NSInteger existTextNum;
    NSString *strf;
}
@end

@implementation FeedBackVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加评论";
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight; 
    
    _feedBackView = [[FeedBackView alloc]init];
     strf=@"5";
    [_feedBackView.imageaa sd_setImageWithURL:[NSURL URLWithString:_imageString] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
    [_feedBackView.imageaa sd_setImageWithURL:[NSURL URLWithString:_imageString] placeholderImage:nil options:SDWebImageProgressiveDownload];
    _feedBackView.jiaqian.text=[NSString stringWithFormat:@"￥%@",_jiaQian];
    _feedBackView.jiaqian.textColor=[UIColor colorWithHexString:@"#f22f33"];
     _feedBackView.name.text=[NSString stringWithFormat:@"%@",_name];
    _feedBackView.frame = CGRectMake(0, 0, kScreenSize.width, kScreenSize.height - kDockHeight);
    
    _feedBackView.mailText.delegate = self;
     [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    _feedBackView.ideaText.delegate = self;
    WSStarRatingView *starRatingView = [[WSStarRatingView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.28, 140, self.view.frame.size.width*0.46, 30) numberOfStar:5];
    starRatingView.delegate = self;
    [_feedBackView addSubview:starRatingView];
    
//    [starRatingView setScore:0.5 withAnimation:YES completion:^(BOOL finished) {
//        scoreLabel.text = [NSString stringWithFormat:@"%0.1f分",0.5 * 5 ];
//    }];

    [self.view addSubview: _feedBackView];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"tokenRenZheng" object:nil];
    [_feedBackView.sendButton addTarget:self action:@selector(sendButtonAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)starRatingView:(WSStarRatingView *)view score:(float)score
{
    //scoreLabel.text = [NSString stringWithFormat:@"%0.1f分",score * 5 ];
    
    strf=[NSString stringWithFormat:@"%f",score * 5];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView == _feedBackView.ideaText) {
        
        NSInteger remainTextNum = 100;
        
        existTextNum = [textView.text length];
        
        remainTextNum =100-existTextNum;
      
        _feedBackView.numLabel.text = [NSString stringWithFormat:@"%ld/100",(long)existTextNum];

        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] > 8.0) {
            
            
            NSLog(@"[[[UIDevice currentDevice] systemVersion] floatValue]%f",[[[UIDevice currentDevice] systemVersion] floatValue]);
            
            
            
            if (textView.text.length > 99) {
                
                existTextNum = 99;
                
                [MBProgressHUD showError:@"输入的字数必须小于100字"];
                    
                textView.text = [textView.text substringToIndex:99];
                
            }else
                
            {
                
                
               _feedBackView.sendButton.enabled = YES;
                
                
            }

           
        }else if (textView.text.length > 100){
            
            
            
//            _feedBackView.numLabel.text = [NSString stringWithFormat:@"%ld/100",(long)existTextNum];

            [MBProgressHUD showError:@"输入的字数必须小于100字"];
            
            _feedBackView.sendButton.enabled = NO;
            
            
        }else
            
        {
            
            _feedBackView.sendButton.enabled = YES;
            
        
        }
}
    
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField;
{
    if (textField.text.length != 0) {
        
        _feedBackView.sendButton.enabled = YES;
        
        mailText = textField.text;
    }
}
-(void)downLoadFinish
{
    [self sendButtonAction];
}
#pragma mark
- (void)sendButtonAction
{
    if (![self checkNet]) {
        
        [MBProgressHUD showError:@"无法连接到网络"];

        
           [self.view addSubview:noNetView];

        return;
    }

    
    if (0 == [_feedBackView.ideaText.text length]) {
        [MBProgressHUD showError:@"请输入您的宝贵意见"];
        return;
    }
    if (0 == [strf length]) {
        [MBProgressHUD showError:@"请添加分数"];
        return;
    }
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"commentInfo":_feedBackView.ideaText.text,
                                                                                    @"commentGrade":strf,
                                                                                    @"orderNo":_orderCode
                                                                                    
                                                                                    }];
    


    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    

    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];

  
    NSLog(@"nihao%@",_idnn);
     NSString *urlstring=[NSString stringWithFormat:@"%@/comment/saveUserComment?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError==nil) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            
            NSLog(@"%@",dict);
            //5.回到主线程,进行更新页面
            if (!dict)
            {
                [Login loginRenZengPhone:[UserAccount getUserLoginInfo].userMobile andPwdnum:[FNUserDefaults objectForKey:@"MD5Pwd"]];
            }
            else
            {
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"]) {
                   
                    [MBProgressHUD showError:@"评价成功"];
                   // [self.navigationController popToRootViewControllerAnimated:YES];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"removeVC" object:nil];
                    [self.navigationController popViewControllerAnimated:YES];
                  
                }
                
                [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
               
                if ([[NSString  stringWithFormat:@"%@",dict[@"open"]] isEqualToString:@"1"]) {
                   
                    [MBProgressHUD showError:dict[@"msg"]];
                }
                
            });
            
            }
        }
        
        else{
            [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
        }
        
        
        
    }];

}
-(NSString *)bs64:(NSData *)data
{
    
    NSData  *str2=[data  base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    NSString *str=[[NSString alloc] initWithData:str2  encoding:NSUTF8StringEncoding];
    return str;
}

@end
