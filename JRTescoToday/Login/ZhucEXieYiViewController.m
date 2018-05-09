//
//  ZhucEXieYiViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/25.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ZhucEXieYiViewController.h"

@interface ZhucEXieYiViewController (){
  UIScrollView *makeView12;
    NSString *txtpath;
     NSString *txtpath1;
}

@end

@implementation ZhucEXieYiViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_return_all"
                                                           higlightedImage:nil target:self action:@selector(back)];
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    makeView12=[[UIScrollView alloc] init];
    self.title=@"注册协议";
    makeView12.frame=CGRectMake(0,10, kScreenSize.width, kScreenSize.height);
//    if (iPhone6p) {
//        makeView12.frame=CGRectMake(0, 108, kScreenSize.width/3, kScreenSize.height);
//    }
    
    makeView12.contentSize=CGSizeMake(kScreenSize.width, 1300);
    makeView12.backgroundColor=[UIColor whiteColor];
    
    NSError *error=nil;
    NSLog(@"%@",_nihao);
    if ([_nihao isEqualToString:@"商家"]) {
           txtpath1 = [[NSBundle mainBundle] pathForResource:@"txtpat1" ofType:@"txt"];  //设置需要读取的文本名称路径
        NSLog(@"%@",txtpath1);
        NSString *txt = [NSString stringWithContentsOfFile:txtpath1 encoding:NSUTF8StringEncoding error:&error];
        //NSString *text=[NSString stringWithCString:(char )txt encoding:NSUTF8StringEncoding];
        if (error)
        {
            NSLog(@"读取文件出错：%@", error);
            return;
        }
          makeView12.contentSize=CGSizeMake(kScreenSize.width, 1300);
        //把文本写到UILabel控件里
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 224, makeView12.frame.size.width-10.0*2,1300)];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.numberOfLines = 0;
        contentLabel.font =  [UIFont systemFontOfSize:11];
        contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        contentLabel.text = txt;
        [makeView12 addSubview:contentLabel];
        [self.view addSubview:makeView12];

    }
    else
    {
           txtpath = [[NSBundle mainBundle] pathForResource:@"txtpat" ofType:@"txt"];  //设置需要读取的文本名称路径
        NSString *txt = [NSString stringWithContentsOfFile:txtpath encoding:NSUTF8StringEncoding error:&error];
        //NSString *text=[NSString stringWithCString:(char )txt encoding:NSUTF8StringEncoding];
        if (error)
        {
            NSLog(@"读取文件出错：%@", error);
            return;
        }
        //把文本写到UILabel控件里
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, makeView12.frame.size.width-10.0*2,1300)];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.numberOfLines = 0;
        contentLabel.font =  [UIFont systemFontOfSize:11];
        contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        contentLabel.text = txt;
        [makeView12 addSubview:contentLabel];
        [self.view addSubview:makeView12];

    }
 
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
