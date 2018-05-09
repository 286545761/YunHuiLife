//
//  JiaoYiJiLuViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JiaoYiJiLuViewController.h"
#import "JiaoYiJiLuTableViewCell.h"
@interface JiaoYiJiLuViewController ()<UITableViewDelegate,UITableViewDataSource>{
  UITableView *_homeTableView;
     UIView *guiZeView;
    NSString *makNstring;
      NSMutableArray *_arrayid;
    UIView *mihao;
   NSInteger num;
     NSInteger num1;
    NSInteger j;
    NSInteger m;
    NSString *str1;
    NSString *strmake11;
      NSString *strmake112;
}

@end

@implementation JiaoYiJiLuViewController
-(void)viewWillAppear:(BOOL)animated{
      self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _homeTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH) style:UITableViewStylePlain];
    _homeTableView.delegate=self;
    _homeTableView.dataSource=self;
    _homeTableView.showsVerticalScrollIndicator =
    NO;
    makNstring=@"1";
    guiZeView=[[UIView alloc] init];
    num=0;
    m=1;
  _arrayid=[[NSMutableArray alloc] initWithObjects:@"水果对双方都十分的舒服",@"老将",@"你回复的技术开发和圣诞节粉红色",@"你好我爱你俄文问我",@"天",@"够狗", nil];
    mihao=[[UIView alloc] init];
    for (int i=0; i<_arrayid.count; i++) {
        NSString *str=_arrayid[i];
        if (i<_arrayid.count-1) {
           str1=_arrayid[i+1];
        }
//
        if ([strmake11 isEqualToString:@"2"]) {
          j++;
              m=1;
             num=0;
            strmake112=@"100";
              strmake11=@"1";
        }
         //
     
        if (num==0&&[strmake112 isEqualToString:@"100"]&&i!=0) {
          NSString *   str12=_arrayid[i];
                     num1=str12.length;
            NSLog(@"44432222111%ld",num1);
                    strmake112=@"1001";
                   }
        else{
            num1=num;
        }
         NSLog(@"%ld",i*10+num*20);
         NSLog(@"dsfdfsf%ld",str1.length*20+10);
         NSLog(@"%d",i);
        NSLog(@"%ldsdsdsds  sdd=ld",num);
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
        if (kScreenSize.width-30-(i*10+num1*20)<=str1.length*20+10) {
           
            NSLog(@"%d",i);
          
            NSLog(@"%ld",i*10+num*20+str1.length*20+10);
            strmake11=@"2";
        }else{
          
        }
        btn.backgroundColor=[UIColor redColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.frame=CGRectMake(10+(20*num)+10*(m-1), 10+j*35,20*str.length , 30);
        [btn setTitle:str forState:UIControlStateNormal];
        num=str.length+num;
        [mihao addSubview:btn];
    
     m++;
    }
    
    _homeTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_homeTableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
        return 50;
   
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cell";
    JiaoYiJiLuTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"JiaoYiJiLuTableViewCell" owner:self options:nil] lastObject];
    }
    
    
    
    return cell;
}

-(void)guiZeBtn
{
    
}
- (IBAction)leixing:(id)sender {
    
  
    
    if ([makNstring isEqualToString:@"1"]) {
           makNstring=@"2";
        
        guiZeView.backgroundColor=[UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:0.3f];
         mihao.frame=CGRectMake(0, 1, kScreenSize.width, 1);
        guiZeView.frame=CGRectMake(0, 0, kScreenSize.width, 1);
        [UIView animateWithDuration:1.0 animations:^{
          
            mihao.frame=CGRectMake(0, 1, kScreenSize.width, 50+j*30);
            mihao.backgroundColor=[UIColor whiteColor];
            guiZeView.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
            [guiZeView addSubview:mihao];
            [_homeTableView addSubview:guiZeView];
        }];
        
    }else
    {
        guiZeView.backgroundColor=[UIColor colorWithRed:0.29f green:0.29f blue:0.29f alpha:0.3f];
        //guiZeView.frame=CGRectMake(0, 0, kScreenSize.width, 1);
        [UIView animateWithDuration:1.0 animations:^{
            guiZeView.frame=CGRectMake(0, 0, kScreenSize.width, 1);
            [_homeTableView addSubview:guiZeView];
        }];
         makNstring=@"1";
    }
    
    
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
