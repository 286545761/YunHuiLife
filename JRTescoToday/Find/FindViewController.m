//
//  FindViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/11/8.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController
-(void)viewWillAppear:(BOOL)animated
{
    UIView *mak=[[UIView alloc] init];
    mak.backgroundColor=[UIColor whiteColor];
    mak.frame=CGRectMake(0, 0, kScreenSize.width, 20);
    [self.view addSubview:mak];
        self.navigationController.navigationBarHidden = YES;
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 20, kScreenSize.width, kScreenSize.height);
    self.view.backgroundColor = [UIColor colorWithHexString:kAllViewBgColor];
   
    NSURL *url = [NSURL URLWithString:@"http://static.jregou.com/view/find.html"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 加载网页请求
    [webView loadRequest:request];
    
    // [webView loadHTMLString:@"<html><title></title><body>Hello iOS</body></html>" baseURL:nil];
    
    
    /*
     // 返回
     [webView goBack];
     // 前进
     [webView goForward];
     // 刷新
     [webView reload];
     */
    
    // 让内容进行缩放充满控件frame而不溢出
    [webView sizeToFit];
    
    [self.view addSubview:webView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   // self.title=_sting2;
   
}


@end
