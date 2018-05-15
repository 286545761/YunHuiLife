//
//  listThreeMajorActivitiesViewController.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/14.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
// 三大活动列表

#import "listThreeMajorActivitiesViewController.h"
#import "listThreeMajorActivitiesTableViewCell.h"

static NSString *cellString=@"listThreeMajorActivitiesTableViewCell";
@interface listThreeMajorActivitiesViewController ()<UITableViewDelegate,UITableViewDataSource>
/*
 *
 */
@property(strong,nonatomic)UITableView *listTableView;

@end

@implementation listThreeMajorActivitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.listTableView reloadData];
}

-(UITableView *)listTableView{
    
    if (!_listTableView) {
        _listTableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _listTableView.delegate=self;
        _listTableView.dataSource=self;
        _listTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    
    [_listTableView registerNib:[UINib nibWithNibName:NSStringFromClass([listThreeMajorActivitiesTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellString];
        [self.view addSubview:_listTableView];
        
    }
    return _listTableView;
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

   listThreeMajorActivitiesTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellString];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
       self.navigationController.navigationBarHidden = NO;
    
    
}




@end
