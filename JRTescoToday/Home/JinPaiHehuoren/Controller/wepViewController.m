//
//  wepViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "wepViewController.h"

@interface wepViewController ()

@end

@implementation wepViewController
-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_return_all"
                                                           higlightedImage:nil target:self action:@selector(back)];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=_sting2;
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-49);
    self.view.backgroundColor = [UIColor colorWithHexString:kAllViewBgColor];
    
    NSURL *url = [NSURL URLWithString:_string];
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
- (void)back
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
