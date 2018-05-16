//
//  bannerActivitiesViewController.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/15.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "bannerActivitiesViewController.h"
#import "bannerActivitiesHeadView.h"
#import "bannerActivitiesTableViewCell.h"
#import "UIViewController+BaseMethods.h"
static NSString *cellString=@"bannerActivitiesTableViewCell";
@interface bannerActivitiesViewController ()<UITableViewDataSource,UITableViewDelegate>
/*
 *
 */
@property(strong,nonatomic)UITableView *tableView;
/*
 *
 */
@property(strong,nonatomic)bannerActivitiesHeadView *headView;

@end

@implementation bannerActivitiesViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden = NO;
    [self setNavgationBackgroundColor:[UIColor whiteColor] andTitleColor:[UIColor blackColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor=RGB(128, 180, 115);
    [self.tableView reloadData];
}
-(bannerActivitiesHeadView *)headView{
    if (!_headView) {
        _headView =[[bannerActivitiesHeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 397)];
    }
    
    return _headView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableHeaderView=self.headView;
        _tableView.delegate=self;
        _tableView.dataSource=self;
            [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([bannerActivitiesTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellString];
        [self.view addSubview:self.tableView];

        
        
    }
    
    
    return _tableView;
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  bannerActivitiesTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellString];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.01;

}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{


    return [[UIView alloc]initWithFrame:CGRectZero];

}


@end
