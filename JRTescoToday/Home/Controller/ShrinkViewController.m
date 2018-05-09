//
//  ShrinkViewController.m
//  XFAppliance
//
//  Created by hduokeji on 16/3/10.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "ShrinkViewController.h"
#import "UIBarButtonItem+DH.h"
#import "SearchView.h"
#import "ShrinkModel.h"
#import "ToSearchView.h"
#import "DHMainController.h"
//#import "XFLabelDetailController.h"
@interface ShrinkViewController ()<UITextFieldDelegate>
{
    UIScrollView *_scrollView;
    int num;
    NSMutableArray *wangQiArray;
    CGFloat bannerViewHeight;
    CGFloat bannerViewHeight1;
    int j;
    NSMutableArray *_item;
    UIButton *_quXiao;
    SearchView *shouSuo;
    UIButton*biaoQianBtn;
    NSMutableArray *_item1;
    NSMutableArray *_wangQiArray1;
    int m;
    ShrinkModel *shrink;
    UIButton*deleBtn;
}
@end

@implementation ShrinkViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);
    num=0;
    j=0;
      wangQiArray=[[NSMutableArray alloc] init];
    for (NSString *str in [FNUserDefaults objectForKey:@"wangQiArray"]) {
        [wangQiArray addObject:str];
    }
    _scrollView=[[UIScrollView alloc] init];
    _scrollView.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT
                                 +wangQiArray.count*44);
 
      _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+wangQiArray.count*44+80);
    [self.view addSubview:_scrollView];
     shouSuo=[[SearchView alloc] init];
    _quXiao=shouSuo.quXiao;
    _wangQiArray1=[[NSMutableArray alloc] init];
    shouSuo.shouText.keyboardType= UIKeyboardTypeDefault;
    shouSuo.shouText.returnKeyType=UIReturnKeySearch;
    shouSuo.shouText.delegate = self;
   
    [_quXiao addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    _item1=[[NSMutableArray alloc] init];
    shouSuo.frame=CGRectMake(0, 0, SCREEN_WIDTH, 64);
    NSLog(@"%f",SCREEN_WIDTH);
    [self.view addSubview:shouSuo];
    _item=[[NSMutableArray alloc] init];
    UILabel *HotLabel=[[UILabel alloc] init];
    HotLabel.frame=CGRectMake(13, 54, SCREEN_WIDTH/4, 16);
    HotLabel.text=@"热门标签";
    HotLabel.font=[UIFont systemFontOfSize:13];
    HotLabel.textColor=[UIColor  colorWithHexString:@"#bfbdbd"];
    [_scrollView addSubview:HotLabel];
    [self makeUi];
    //[self DownLoad];
   
}
-(void)makeUi
{
    bannerViewHeight1=iPhone4 ? 90 : 109;

    for (int i=1; i<_item.count; i++)    {
        num++;
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(15+(num-1)*((SCREEN_WIDTH-20)/3), 64+10+j*(10+32), bannerViewHeight1, 32);
        [btn.layer setBorderWidth:1.0];
        [btn setTitle:_item[i-1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor  colorWithHexString:@"#808080"] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont  boldSystemFontOfSize:13];
        [btn addTarget:self action:@selector(btnBtn:) forControlEvents:UIControlEventTouchUpInside];
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
       CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0.79f, 0.78f,0.78f, 1 });
        [btn.layer setBorderColor:colorref];
        if (i%3==0)
        {
            j++;
            num=0;
        }
        [btn.layer setCornerRadius:15];
        btn.tag=i;
        [_scrollView addSubview:btn];
  
    }
    UILabel *recentlyLabel=[[UILabel alloc] init];
    recentlyLabel.frame=CGRectMake(13, 64+20+j*(10+32)+40, SCREEN_WIDTH/4, 16);
    recentlyLabel.text=@"最近搜索";
    recentlyLabel.font=[UIFont systemFontOfSize:13];
    recentlyLabel.textColor=[UIColor  colorWithHexString:@"#bfbdbd"];
    [_scrollView addSubview:recentlyLabel];
    [self ToSearch];
}

-(void)ToSearch
{   m=0;
    [FNUserDefaults objectForKey:@"wangQiArray"];
    
    
    for (int i=(int)wangQiArray.count; i>0; i--) {
        
        ToSearchView *searchView=[[ToSearchView alloc] init];
        searchView.frame=CGRectMake(0, 64+20+4*(10+32)+m*44, SCREEN_WIDTH, 44);
        biaoQianBtn=searchView.biaoQianBtn;
        [biaoQianBtn addTarget:self action:@selector(biaoQianBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_wangQiArray1 addObject:searchView];
        deleBtn=searchView.deleBtn;
          [deleBtn addTarget:self action:@selector(deleBtn:) forControlEvents:UIControlEventTouchUpInside];
        deleBtn.tag=i-1;
        biaoQianBtn.tag=i-1;
        searchView.title.text=wangQiArray[i-1];
        [_scrollView addSubview:searchView];
        m++;
        
            }
}
#pragma mark 跳转标签
-(void)biaoQianBtn:(UIButton *)btn
{
    
//    if ([[FNUserDefaults objectForKey:@"panduanio"] isEqualToString:@"3"] ) {
//        if ([[FNUserDefaults objectForKey:@"guimijihua"] isEqualToString:@"1"] ) {
//            i=2;
//        }
//        else
//        {
//            i=0;
//        }
//        
//    }
//    else
//    {
//        if ([[FNUserDefaults objectForKey:@"touziyemian"] isEqualToString:@"1"] ) {
//            i=1;
//        }
//        else
//        {
//            i=0;
//        }
//    }
    //[FNUserDefaults setObject:@"3" forKey:@"panduanio"];
    [FNUserDefaults setObject:@"1" forKey:@"touziyemian"];
     [FNUserDefaults setObject:wangQiArray[btn.tag] forKey:@"namenihao"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Shrink" object:nil];
    [self  dismissViewControllerAnimated:YES completion:^{
        
    }];
    
//    XFLabelDetailController *label=[[XFLabelDetailController alloc] init];
//    label.tags= wangQiArray[btn.tag];
//    label.title=wangQiArray[btn.tag];
//    [self.navigationController pushViewController:label animated:YES];
}
-(void)deleBtn:(UIButton *)btn
{
    [wangQiArray removeObjectAtIndex:btn.tag];
    for (ToSearchView *sec in _wangQiArray1) {
        [sec removeFromSuperview];
    }
    [FNUserDefaults  setObject:wangQiArray forKey: @"wangQiArray"];
    [self ToSearch];
}
-(void)DownLoad
{

}

- (void)back
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)btnBtn:(UIButton *)btn
{
    [FNUserDefaults setObject:@"1" forKey:@"touziyemian"];
     //[self.tabBarController setSelectedIndex:1];
    [FNUserDefaults setObject:shrink.tagsName forKey:@"namenihao"];
 [[NSNotificationCenter defaultCenter] postNotificationName:@"Shrink" object:nil];
    [self  dismissViewControllerAnimated:YES completion:^{
        
    }];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // 收起键盘(取消第一响应者)
   
    

   
  
    if (wangQiArray.count>9) {
        [wangQiArray removeObjectAtIndex:0];
    }
      [wangQiArray addObject:shouSuo.shouText.text];
    [FNUserDefaults setObject:@"1" forKey:@"touziyemian"];
     [FNUserDefaults setObject:shouSuo.shouText.text forKey:@"namenihao"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Shrink" object:nil];
    [self  dismissViewControllerAnimated:YES completion:^{
        
    }];

    [FNUserDefaults  setObject:wangQiArray forKey: @"wangQiArray"];
    [textField resignFirstResponder];
    return YES;
}
@end
