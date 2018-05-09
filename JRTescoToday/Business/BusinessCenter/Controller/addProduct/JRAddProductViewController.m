//
//  JRAddProductViewController.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRAddProductViewController.h"
#import "JRProductPhoto.h"
#import "JRProducDetailView.h"
#import "JRProductTagView.h"
#import "JRProductCategoryView.h"
#import "JRProductDealView.h"
#import "JREditCategoryViewController.h"
#import "UIImageView+WebCache.h"
#import "JRBusinessCenterCore.h"
#import "JRReleaseRulesAlter.h"
#import "UIButton+touch.h"
#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]

@interface JRAddProductViewController ()<JRProductTagView,JRProductCategoryViewDelegate,JREditCategoryViewControllerDelegate,JRProductPhotoDelegate>

@property (nonatomic, strong)UIScrollView *mainScrollView;
@property (nonatomic, strong)JRProductPhoto *photoView;
@property (nonatomic, strong)JRProducDetailView *detailView;
@property (nonatomic, strong)JRProductTagView *tagView;
@property (nonatomic, strong)JRProductCategoryView *categoryView;
@property (nonatomic, strong)JRProductDealView *dealView;
@property (nonatomic, strong)UIView *alterView;

@property (nonatomic, strong)JRReleaseRulesAlter *rulesView;

@end

@implementation JRAddProductViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
 }

- (UIView *)alterView {
    if (!_alterView) {
        _alterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _alterView.backgroundColor = [UIColor blackColor];
        _alterView.alpha = 0.8;
    }
    return _alterView;
}
- (JRReleaseRulesAlter *)rulesView {
    if (!_rulesView) {
        _rulesView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JRReleaseRulesAlter class]) owner:self options:nil] lastObject];
        _rulesView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/3*2, [UIScreen mainScreen].bounds.size.height/3*1);
        _rulesView.alpha = 1;
        [_rulesView.agreeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_rulesView.agreeButton addTarget:self action:@selector(clickAgree:) forControlEvents:UIControlEventTouchUpInside];
        _rulesView.center = CGPointMake(self.view.center.x, self.view.center.y);
        [[UIApplication sharedApplication].keyWindow addSubview:_rulesView];
    }
    return _rulesView;
}
- (void)clickAgree:(UIButton *)sender {
    [_alterView removeFromSuperview];
    [_rulesView removeFromSuperview];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self clickAgree:nil];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"添加商品";
    [self creatUI];
}
#pragma mark - 编辑状态下获取数据
- (void)setEditingModel:(JREditProductModel *)editingModel {
    self.editingModel = editingModel;
     [_photoView.imageView sd_setImageWithURL:[NSURL URLWithString:editingModel.mainImage]];
    [_detailView giveTitle:editingModel.name andDescription:editingModel.descp];
    _categoryView.presentPriceTextField.text = editingModel.goodsPrice;
    _categoryView.originalPriceTextField.text = editingModel.originalPrice;
    _categoryView.categoryLabel.text = @"选取分类";
    
    _tagView.tagArr = editingModel.goodsLabels;
}
- (void)creatUI {
    _mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _mainScrollView.contentOffset = CGPointMake(0 , 0);
    [self.view addSubview:_mainScrollView];
    //添加照片
    _photoView = [[JRProductPhoto alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    _photoView.addProductVC = self;
    _photoView.delegate = self;
    [_mainScrollView addSubview:_photoView];
    //商品详情
    _detailView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JRProducDetailView class]) owner:self options:nil] lastObject];
    _detailView.frame = CGRectMake(0, CGRectGetMaxY(_photoView.frame), [UIScreen mainScreen].bounds.size.width, 44+1+105+20);
    [_mainScrollView addSubview:_detailView];
    //商品标签
    _tagView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JRProductTagView class]) owner:self options:nil] lastObject];
    _tagView.frame = CGRectMake(0, CGRectGetMaxY(_detailView.frame), [UIScreen mainScreen].bounds.size.width, 44);
    _tagView.delegate = self;
    [_mainScrollView addSubview:_tagView];
    //选择分类
    _categoryView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JRProductCategoryView class]) owner:self options:nil] lastObject];
    _categoryView.frame = CGRectMake(0, CGRectGetMaxY(_tagView.frame), [UIScreen mainScreen].bounds.size.width, 108);
    _categoryView.delegate = self;
    [_mainScrollView addSubview:_categoryView];
    _dealView  = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JRProductDealView class]) owner:self options:nil] lastObject];
    _dealView.frame = CGRectMake(0, CGRectGetMaxY(_categoryView.frame)+54, [UIScreen mainScreen].bounds.size.width, 49);
    [_dealView.saveBtn addTarget:self action:@selector(clickSave:) forControlEvents:UIControlEventTouchUpInside];
    [_dealView.releaseBtn addTarget:self action:@selector(clickRelease:) forControlEvents:UIControlEventTouchUpInside];
    [_mainScrollView addSubview:_dealView];
    //按钮多次点击延迟2秒
    _dealView.saveBtn.timeInterval = 2;
    _dealView.releaseBtn.timeInterval  = 2;
    
    _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(_detailView.frame)+29);
}
- (void)clickSave:(UIButton *)sender {
    
    UIImage *image = _photoView.imageView.image;
    NSString *title = _detailView.titleTextField.text;
    NSString *description = _detailView.detailTextView.text;
    NSMutableArray *tagArr = _tagView.tagBtnLocalData;
    NSString *presentPrice = _categoryView.presentPriceTextField.text;
    NSString * originalPrice = _categoryView.originalPriceTextField.text;
    NSString *categoryID= _categoryView.selectCategoryID;
    NSString *token = [FNUserDefaults objectForKey:@"usersid"];
    

    if (!image || !title.length || !description.length || !presentPrice.length || !originalPrice.length ||
        !categoryID.length) {
        [self.view addSubview:self.alterView];
        [[UIApplication sharedApplication].keyWindow addSubview:self.rulesView];
        self.rulesView.titleLabel.text = @"完成保存需要条件";

        return;
    }

    [JRBusinessCenterCore uploadADD_ProductWithAccess_tokenToken:token productID:nil name:title mainImage:image descp:description goodsPrice:presentPrice originalPrice:originalPrice goodsCategoryId:categoryID type:@"0" labels:tagArr Successed:^(NSDictionary *data) {
        [MBProgressHUD showError:@"保存成功"];
        [self.navigationController popViewControllerAnimated:YES];
        
    } failed:^(NSString *erro) {
        if (erro.length) [MBProgressHUD showError:erro toView:nil];
    }];
 
    
}
- (void)clickRelease:(UIButton *)sender {
    UIImage *image = _photoView.imageView.image;
    NSString *title = _detailView.titleTextField.text;
    NSString *description = _detailView.detailTextView.text;
    NSMutableArray *tagArr =  _tagView.tagBtnLocalData;
    NSString *presentPrice = _categoryView.presentPriceTextField.text;
    NSString * originalPrice = _categoryView.originalPriceTextField.text;
    NSString *categoryID= _categoryView.selectCategoryID;
    NSString *token = [FNUserDefaults objectForKey:@"usersid"];
    
   
    if (!image || !title.length || !description.length || !presentPrice.length || !originalPrice.length ||
        !categoryID.length) {
        [self.view addSubview:self.alterView];
        [[UIApplication sharedApplication].keyWindow addSubview:self.rulesView];
        self.rulesView.titleLabel.text = @"完成发布需要条件";

        return;
    }

    [JRBusinessCenterCore uploadADD_ProductWithAccess_tokenToken:token productID:nil name:title mainImage:image descp:description goodsPrice:presentPrice originalPrice:originalPrice goodsCategoryId:categoryID type:@"0" labels:tagArr Successed:^(NSDictionary *data) {
        [MBProgressHUD showError:@"发布成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } failed:^(NSString *erro) {
        if (erro.length) [MBProgressHUD showError:erro toView:nil];
    }];
    
}
- (void)reloadFrameWhenClickPullWithMaxY:(CGFloat)tagViewMaxY {
    _categoryView.frame = CGRectMake(0, tagViewMaxY, [UIScreen mainScreen].bounds.size.width, 108);
    _dealView.frame = CGRectMake(0, tagViewMaxY+108+54, [UIScreen mainScreen].bounds.size.width, 49);
    _mainScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, tagViewMaxY+98+54+49+29);

}
- (void)selectTheCatagoryOfProduct {
    
    JREditCategoryViewController *VC= [[JREditCategoryViewController alloc] init];
    VC.delegate = self;
    [self.navigationController pushViewController:VC animated:YES];
}
#pragma mark -JRPhotoViewDelegate
- (void)getSelectedPhoto:(UIImage *)photo {

    NSData *fileData = UIImageJPEGRepresentation(photo, 1);
    NSLog(@"+++++%@",fileData);
    _photoView.photoImage = photo;
}

#pragma mark -JREditCategoryViewControllerDelegate
- (void)getTheProductCacegoryName:(NSString *)catetogryTitle andID:(NSString *)categoryID{
        _categoryView.categoryLabel.text = catetogryTitle;
    _categoryView.selectCategoryID = [NSString stringWithFormat:@"%@",categoryID];
        _categoryView.categoryLabel.textColor = UIColorFromRGB_16(0xff2d48, 1);

}

@end
