//
//  JREditCategoryViewController.m
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JREditCategoryViewController.h"
#import "JRCategoryCell.h"
#import "JRProductCatogryModel.h"
#import "JREditCategoryCell.h"
#import "JRBusinessCenterCore.h"
#import "MJExtension.h"
#import "JRBusinessCenterCore.h"
#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]

typedef NS_ENUM(NSInteger, JRProductState) {
    JRProductState_Add = 0, //添加
    JRProductState_Edit = 1, //编辑
};

@interface JREditCategoryViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, JREditCategoryCellDelegate>
@property (nonatomic, strong)UITableView *categoryTableView;
@property (nonatomic, strong)NSMutableArray *categoryArr;

@property (nonatomic, strong)UIView *endAddCateryView;
@property (nonatomic, assign)NSInteger selfType;

@property (nonatomic, copy)NSString *editedTitle;
@property (nonatomic, assign)NSInteger editIndex;
@property (nonatomic, assign)BOOL editChange;

@property (nonatomic, copy)NSString *selectedCategoryTitle;
@property (nonatomic, copy)NSString *selectedCategoryID;
@end

@implementation JREditCategoryViewController
{
    UIButton *rightButton;
}
- (void)viewWillAppear:(BOOL)animated {
    self.selfType = JRProductState_Add;
    [self dealWithLocalData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"商品分类";
    //
    self.selfType = JRProductState_Add;
    //返回按钮
    UIButton *leftButton = [[UIButton alloc] init];
    leftButton.frame = CGRectMake(0, 0, 50, 50);
    [leftButton setImage:[UIImage imageNamed:@"nav_return_black"] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButonItems = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *nagetiveSpagcer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    nagetiveSpagcer.width = -15;
    self.navigationItem.leftBarButtonItems = @[nagetiveSpagcer,leftBarButonItems];
    //
//    //右侧编辑按钮
//    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightButton.frame =CGRectMake(0, 0, 50, 50);
//    [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
//    [rightButton setTitle:@"完成" forState:UIControlStateSelected];
//    [rightButton setTitleColor:UIColorFromRGB_16(0xe62f47, 1) forState:UIControlStateNormal];
//    [rightButton setTitleColor:UIColorFromRGB_16(0xe62f47, 1) forState:UIControlStateSelected];
//    [rightButton addTarget:self action:@selector(clickEdit:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//    self.navigationItem.rightBarButtonItem = rightBarItem;
    //
   
    [self.view addSubview:self.categoryTableView];

    [self.view addSubview:self.endAddCateryView];
    [self dealWithLocalData];
}
- (UITableView *)categoryTableView {
    if (!_categoryTableView) {
        _categoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49 - 15) style:UITableViewStylePlain];
        _categoryTableView.delegate = self;
        _categoryTableView.dataSource = self;
        _categoryTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JRCategoryCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JRCategoryCell class])];
        //
        [_categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JREditCategoryCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JREditCategoryCell class])];
        //
    }
    return _categoryTableView;
}
- (void)clickBack:(UIButton *)sender {
    switch (self.selfType) {
        case JRProductState_Add: {
            [self.delegate getTheProductCacegoryName:_selectedCategoryTitle andID:_selectedCategoryID];
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case JRProductState_Edit: {
            self.selfType = JRProductState_Add;
            self.endAddCateryView.hidden = NO;
            rightButton.selected = NO;
            _editedTitle = @"";
            [self.categoryTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}
- (UIView *)endAddCateryView {
    if (!_endAddCateryView) {
        _endAddCateryView = [[UIView alloc] initWithFrame:CGRectMake(15, [UIScreen mainScreen].bounds.size.height-49-15, [UIScreen mainScreen].bounds.size.width - 30, 49)];
        _endAddCateryView.backgroundColor = [UIColor whiteColor];
        UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _endAddCateryView.frame.size.width, _endAddCateryView.frame.size.height)];
        [addBtn setImage:[UIImage imageNamed:@"addNewCategory12.png"] forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(clickAdd:) forControlEvents:UIControlEventTouchUpInside];
        [_endAddCateryView addSubview:addBtn];
        _endAddCateryView.hidden = NO;
    }
    return _endAddCateryView;
}
#pragma mark - 添加商品分类
- (void)clickAdd:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加分类" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    UITextField *txtName = [alert textFieldAtIndex:0];
    txtName.placeholder = @"请输入分类名称";
    [alert show];
}

#pragma mark - 点击代理
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        UITextField *txt = [alertView textFieldAtIndex:0];
        
        if (!txt.text.length) {
            [MBProgressHUD showError:@"请输入分类名称" toView:nil];
            return;
        }
    
        NSString *token = [FNUserDefaults objectForKey:@"usersid"];
        MBProgressHUD *hud;
        if ([FNUserDefaults objectForKey:@"usersid"]) hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        [JRBusinessCenterCore uploadCreatedBussinessProductCategoryWithToken:token goodsCategoryCreateModel:txt.text Successed:^(NSDictionary *data) {
//            JRProductCatogryModel *model = [[JRProductCatogryModel alloc] init];
//            model.titleName = txt.text;
//            model.isSelected = NO;
//            [self.categoryArr insertObject:model atIndex:0];
//            [self.categoryTableView reloadData];
            NSString *token = [FNUserDefaults objectForKey:@"usersid"];
            [JRBusinessCenterCore query_requestBussinessProductCategoryWithToken:token Successed:^(id data) {
                if (self.categoryArr.count) {
                    [self.categoryArr removeAllObjects];
                }
                NSArray *arr = data;
                for (NSDictionary *dict in arr) {
                    JRProductCatogryModel *model = [JRProductCatogryModel mj_objectWithKeyValues:dict];
                    model.isSelected = NO;
                    [self.categoryArr addObject:model];
                }
                [self.categoryTableView reloadData];
                [hud hideAnimated:YES];

            } failed:^(NSString *erro) {
                [hud hideAnimated:YES];

            }];
        } failed:^(NSString *erro) {
            [hud hideAnimated:YES];

        }];
        
    }
    
}
        
        
- (void)dealWithLocalData {
//    NSMutableArray *localArr = [[NSMutableArray alloc] initWithObjects:@"火锅",@"休闲/餐饮/娱乐",@"全城最火",@"全程最热",@"鸡肉火锅",@"最好吃的", nil];
//    for (NSString *str in localArr) {
//        JRProductCatogryModel *model = [[JRProductCatogryModel alloc] init];
//        model.titleName = str;
//        model.isSelected = NO;
//        [self.categoryArr addObject:model];
//    }
    NSString *token = [FNUserDefaults objectForKey:@"usersid"];
    [JRBusinessCenterCore query_requestBussinessProductCategoryWithToken:token Successed:^(id data) {
        if (self.categoryArr.count) {
            [self.categoryArr removeAllObjects];
        }
        NSArray *arr = data;
        for (NSDictionary *dict in arr) {
            JRProductCatogryModel *model = [JRProductCatogryModel mj_objectWithKeyValues:dict];
            model.isSelected = NO;
            [self.categoryArr addObject:model];
        }
        [self.categoryTableView reloadData];
        
    } failed:^(NSString *erro) {
        
    }];
    
    
}

- (NSMutableArray *)categoryArr {
    if (!_categoryArr) {
        _categoryArr = [[NSMutableArray alloc] init];
    }
    return _categoryArr;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (self.selfType) {
        case JRProductState_Add: {
            
            JRCategoryCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JRCategoryCell class])];
            JRProductCatogryModel *model = self.categoryArr[indexPath.row];
            cell.titleLabel.text = model.titleName;
            cell.iSelected = model.isSelected;
            return cell;

        }
            break;
        case JRProductState_Edit: {
            JREditCategoryCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JREditCategoryCell class])];
            cell.delegate = self;
            cell.defaultState = JRProductState_Edit;
            JRProductCatogryModel *model = self.categoryArr[indexPath.row];
            cell.titleLabel.text = model.titleName;
            cell.editTextField.text = @"";
            cell.index = indexPath.row;
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (self.selfType) {
        case JRProductState_Add: {
            for (JRProductCatogryModel *model in self.categoryArr) {
                model.isSelected = NO;
            }
            JRProductCatogryModel *model = self.categoryArr[indexPath.row];
            model.isSelected = YES;
            self.selectedCategoryTitle = model.titleName;
            self.selectedCategoryID = model.ID;
            
            [self.categoryTableView reloadData];
            [self.delegate getTheProductCacegoryName:_selectedCategoryTitle andID:_selectedCategoryID];
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case JRProductState_Edit: 
            break;
            
        default:
            break;
    }
   
}
#pragma mark - 点击编辑
- (void)clickEdit:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        //编辑状态
        self.selfType = JRProductState_Edit;
        self.endAddCateryView.hidden = YES;
    } else {
        self.selfType = JRProductState_Add;
        self.endAddCateryView.hidden = NO;
        //
        if (_editedTitle.length) {
            JRProductCatogryModel *model = [[JRProductCatogryModel alloc] init];
            model.titleName = _editedTitle;
            model.isSelected = NO;
            [self.categoryArr replaceObjectAtIndex:_editIndex withObject:model];
        }
    }
    [self.categoryTableView reloadData];
}

#pragma mark - JREditCategoryCellDelegate
- (void)editedProductCategoryName:(NSString *)categoryTitle indexPath:(NSInteger)index {
    _editIndex = index;
    _editedTitle = categoryTitle;
    
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
