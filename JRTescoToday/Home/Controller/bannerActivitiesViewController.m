//
//  bannerActivitiesViewController.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/15.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "bannerActivitiesViewController.h"
#import "bannerActivitiesHeadView.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}
-(bannerActivitiesHeadView *)headView{
    if (!_headView) {
        _headView =[[bannerActivitiesHeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 387)];
    }
    
    return _headView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:self.view.bounds];
        
        _tableView.delegate=self;
        _tableView.dataSource=self;

        
        
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
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellS"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end
