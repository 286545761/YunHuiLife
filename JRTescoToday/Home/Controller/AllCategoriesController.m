//
//  AllCategoriesController.m
//  JRTescoToday
//
//  Created by 123 on 2017/11/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "AllCategoriesController.h"
#import "AllCategoriesView.h"
@interface AllCategoriesController ()
{
    NSInteger m;
}
@end

@implementation AllCategoriesController

- (void)viewDidLoad {
    [super viewDidLoad];
    m=0;
    self.title=@"全部分类";
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:@"nav_return_all"
                                                         higlightedImage:nil target:self action:@selector(back)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"Categories" object:nil];
    UIButton *left=[UIButton buttonWithType:UIButtonTypeCustom];
    left.frame=CGRectMake(5, 20, 40, 44);
    [self downLoad];
    [left setImage:[UIImage imageNamed:@"fanhui123"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark 返回
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
-(void)downLoadFinish
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Shrink" object:nil];
    [self  dismissViewControllerAnimated:YES completion:^{

    }];
}
-(void)MakeUiView:(NSArray *)array
{
    AllCategoriesView *view=[[AllCategoriesView alloc] init];
    m=[view MakeUiVieWDict:array controller:self];
    view.frame=CGRectMake(0, 0, kScreenSize.width, m);
    
    UIScrollView *scrollView=[[UIScrollView alloc] init];
    scrollView.frame=CGRectMake(0,0, kScreenSize.width, kScreenSize.height);
     //makeFenleiView1.contentSize=CGSizeMake(kScreenSize.width/2, 44*(maqq.count+1)+10);
    scrollView.contentSize=CGSizeMake(kScreenSize.width, m);
    scrollView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
    [self.view addSubview:scrollView];
    [scrollView addSubview:view];
}
-(void)downLoad
{
    [HttpTool getWithBaseURL:kBaseURL path:@"merchants/categories" params:nil success:^(id data) {
        NSLog(@"%@",kBaseURL);
  [self MakeUiView:data];
        NSLog(@"%@",data);
        //#import "CategoresModel.h"
        
//        CategoryArray=[[NSMutableArray alloc] init];
//        CategoryArray1=[[NSMutableArray alloc] init];
//        for (NSDictionary *sre1 in data[@"merchantCategoryOneLevelModels"]) {
//            CategoresModel *makdd=[[CategoresModel alloc]  initWithDict:sre1];
//            // [nihao addObject:makdd];
//            [CategoryArray1 addObject:makdd];
//
//
//        }
//        for (NSDictionary *sre12 in data[@"merchantCategoryTwoLevelModels"]) {
//            CategoresModel *makdd=[[CategoresModel alloc]  initWithDict:sre12];
//            // [nihao addObject:makdd];
//            [CategoryArray addObject:makdd];
//
//
//        }
//        [self makeCatrgoreyView];
//        BussArray=[[NSMutableArray alloc] init];
//
//
//        NSMutableArray *nihao=[[NSMutableArray alloc] init];
//        // NSLog(@"1213%@",data);
//        for (NSDictionary *sre in data[@"merchantRecommendModels"]) {
//            commodle *makdd=[[commodle alloc]  initWithDict:sre];
//            [nihao addObject:makdd];
//
//
//        }
//        [BussArray addObjectsFromArray:nihao];
//
//        [_homeTableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
@end
