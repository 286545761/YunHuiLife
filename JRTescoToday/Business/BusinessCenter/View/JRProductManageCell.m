//
//  JRProductManageCell.m
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRProductManageCell.h"
#import "UIImageView+WebCache.h"

#import "JREditProductTagModel.h"

#define UISIZE [UIScreen mainScreen].bounds.size
#define BigMargin 0
#define SPACE_SPACE 10
#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]

typedef NS_ENUM(NSInteger, JRProductState) {
    JRProductState_All = 0, //全部
    JRProductState_Pending = 1, //待上架
    JRProductState_OnSchelvew = 2, //已上架
    JRProductState_OffScelvew = 3, //已下架
};

typedef NS_ENUM(NSInteger, JRPendState) {
    JRPendState_InReview = 0, //审核中
    JRPendState_Reject = 1, //审核失败
    JRPendState_Wating = 2, //未审核
};
typedef NS_ENUM(NSInteger, JRClickType) {
    JRClickType_edit = 0, //编辑
    JRClickType_delete = 1, //删除
    JRClickType_release = 2, //发布
};

@interface JRProductManageCell ()
@property (nonatomic, strong)NSMutableArray *tagBtnLocalData;
@property (nonatomic, strong)NSMutableArray *tagBtnArr;//存放所有按钮标签对象

@property (nonatomic, strong)UIView *footerViewPending;
//footerViewoffShelve
@property (nonatomic, strong)UIView *footerViewoffShelve;
//footerViewEdit_Delete_Release
@property (nonatomic, strong)UIView *footerViewEdit_Delete_Release;
//footerViewEdit_Delete
@property (nonatomic, strong)UIView *footerViewEdit_Delete;

//
@property (nonatomic, strong)UIView *footerViewEdit_Release;
//footerViewHadOff
@property (nonatomic ,strong)UIView *footerViewHadOff;
//
@property (nonatomic, copy)NSString *ID;
@end
@implementation JRProductManageCell{
    CGFloat twoBtnsY;
}
- (void)removeAllFuYong {
    [self.tagVIew.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.productStateView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if(self.tagBtnArr.count > 0){
        for (UILabel *btn in self.tagBtnArr) {
            [btn removeFromSuperview];
        }
        [self.tagBtnArr removeAllObjects];
    }
    
    if (self.tagBtnLocalData.count) {
        [self.tagBtnLocalData removeAllObjects];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.tagBtnLocalData = [[NSMutableArray alloc] initWithObjects:@"2222222", @"2222222", @"2222222", @"2222222", @"2222222", @"2222222", @"2222222", @"2222222", nil];
    self.iconImageView.alpha = 1;
    self.stateImageView.alpha = 0.7;
    self.lineLable.backgroundColor = [UIColor lightGrayColor];
    self.lineLable.textColor = [UIColor lightGrayColor];
    self.productPriceLabel.font = [UIFont systemFontOfSize:18];
    [self.productStateView addSubview:self.footerViewEdit_Delete_Release];
}

/*
JRProductState_All = 0, //全部
JRProductState_Pending = 1, //待上架
JRProductState_OnSchelvew = 2, //已上架
JRProductState_OffScelvew = 3, //已下架
 */

/*
 JRPendState_InReview = 0, //审核中
 JRPendState_Reject = 1, //审核失败
 JRPendState_Wating = 2, //未审核
 */
- (NSMutableArray *)tagBtnLocalData {
    if (!_tagBtnLocalData) {
        _tagBtnLocalData = [[NSMutableArray alloc] init];
    }
    return _tagBtnLocalData;
}
- (void)loadData:(JRManagerProductModel *)model andType:(NSInteger)type {
    self.managerType = type;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.mainImage]];
    NSString *goodPrice = [NSString stringWithFormat:@"%@",model.goodsPrice];
    NSString *originalPrice = [NSString stringWithFormat:@"%@",model.originalPrice];

    self.productPriceLabel.text = [NSString stringWithFormat:@"¥%.2f",[goodPrice doubleValue]];
    self.productOriginalLabel.text = (model.originalPrice) ? [NSString stringWithFormat:@"¥%.2f",[originalPrice doubleValue]] : @"";
    self.lineLable.text = (model.originalPrice) ? [NSString stringWithFormat:@"¥%.2f",[originalPrice floatValue]] : @"";
    self.productTitleLabel.text = model.goodsName;
    self.ID = model.ID;

    if (model.goodsLabels.count) {
        for (JREditProductTagModel *tagModel in model.goodsLabels) {
            [self.tagBtnLocalData addObject:tagModel.content];
        }
        
        [self pullDisplayAllTagWithWidth:model.tagViewMaxWidth andHeight:model.tagViewMaxHeight];

    }
//    NSLog(@"+++++++++++++++%lf+++++++++ %f",model.tagViewMaxWidth, model.tagViewMaxHeight);

    NSLog(@"%@  %@",model.goodsName, model.status);
    [self judgethefooterWithStatus:model.status];

}
- (void)judgethefooterWithStatus:(NSString *)status {

    /*
     *0保存
     *1发布 审核中
     *2审核成功 已上架
     *-1已下架
     *-2审核未通过
     */
    switch ([status integerValue]) {
        case 0:
            self.stateImageView.image = [UIImage imageNamed:@""];
            [_productStateView addSubview:self.footerViewEdit_Delete_Release];
            
            break;
        case 1:
            self.stateImageView.image = [UIImage imageNamed:@"pending.png"];
            [_productStateView addSubview:self.footerViewPending];
            
            break;
        case 2:
            self.stateImageView.image = [UIImage imageNamed:@""];
            [_productStateView addSubview:self.footerViewoffShelve];

            break;
        case -1:
            self.stateImageView.image = [UIImage imageNamed:@""];
            [_productStateView addSubview:self.footerViewEdit_Release];
            
            break;
        case -2:
            self.stateImageView.image = [UIImage imageNamed:@"reject.png"];
            [_productStateView addSubview:self.footerViewEdit_Delete_Release];
            
            break;
        default:
            break;
    }
}

#pragma mark - footer
- (UIView *)footerViewEdit_Delete_Release {
    if (!_footerViewEdit_Delete_Release) {
        _footerViewEdit_Delete_Release = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        _footerViewEdit_Delete_Release.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //编辑100 删除101 发布102
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"编辑",@"删除",@"发布", nil];
        CGFloat btnWitdh = (UISIZE.width - (1*(arr.count-1)))/arr.count;
        for (NSInteger i = 0; i < arr.count; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*btnWitdh + i*1, 0, btnWitdh,40)];
            btn.backgroundColor = [UIColor whiteColor];
            btn.tag = 100 + i;
            [btn setTitleColor:UIColorFromRGB_16(0x666666, 1) forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickEdit_Delete_Release:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            [_footerViewEdit_Delete_Release addSubview:btn];
        }
    }
    return _footerViewEdit_Delete_Release;
}
//footerViewEdit_Delete
- (UIView *)footerViewEdit_Delete {
    if (!_footerViewEdit_Delete) {
        _footerViewEdit_Delete = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        _footerViewEdit_Delete.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        //编辑300  删除301
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"编辑",@"删除", nil];
        CGFloat btnWitdh = (UISIZE.width - (1*(arr.count-1)))/arr.count;
        for (NSInteger i = 0; i < arr.count; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*btnWitdh + i*1, 0, btnWitdh,40)];
            btn.backgroundColor = [UIColor whiteColor];
            btn.tag = 300 + i;
            [btn setTitleColor:UIColorFromRGB_16(0x666666, 1) forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickEdit_Delete:) forControlEvents:UIControlEventTouchUpInside];
            
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            [_footerViewEdit_Delete addSubview:btn];
        }
    }
    return _footerViewEdit_Delete;
}


- (UIView *)footerViewEdit_Release {
    if (!_footerViewEdit_Release) {
        _footerViewEdit_Release = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        _footerViewEdit_Release.backgroundColor = [UIColor groupTableViewBackgroundColor];

        //编辑200  发布201
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"编辑",@"发布", nil];
        CGFloat btnWitdh = (UISIZE.width - (1*(arr.count-1)))/arr.count;
        for (NSInteger i = 0; i < arr.count; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*btnWitdh + i*1, 0, btnWitdh,40)];
            btn.backgroundColor = [UIColor whiteColor];

            btn.tag = 200 + i;
            [btn setTitleColor:UIColorFromRGB_16(0x666666, 1) forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickEdit_Release:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            [_footerViewEdit_Release addSubview:btn];
        }
    }
    return _footerViewEdit_Release;
}
- (UIView *)footerViewHadOff {
    if (!_footerViewHadOff) {
        _footerViewHadOff = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        _footerViewHadOff.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        
        //已下架商品
        UIButton *hadOff = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        hadOff.backgroundColor = [UIColor whiteColor];
        
        [hadOff setTitle:@"已下架商品" forState:UIControlStateNormal];
        [hadOff setTitleColor:UIColorFromRGB_16(0x666666, 1) forState:UIControlStateNormal];
        [_footerViewHadOff addSubview:hadOff];
    }
    return _footerViewHadOff;
}
- (UIView *)footerViewoffShelve {
    if (!_footerViewoffShelve) {
        _footerViewoffShelve = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        _footerViewoffShelve.backgroundColor = [UIColor groupTableViewBackgroundColor];

        //下架商品
        UIButton *offShelve = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        offShelve.backgroundColor = [UIColor whiteColor];

        [offShelve setTitle:@"下架" forState:UIControlStateNormal];
        [offShelve setTitleColor:UIColorFromRGB_16(0x666666, 1) forState:UIControlStateNormal];
        [offShelve addTarget:self action:@selector(clickOffSchelve:) forControlEvents:UIControlEventTouchUpInside];
        [_footerViewoffShelve addSubview:offShelve];
    }
    return _footerViewoffShelve;
    
}
- (UIView *)footerViewPending {
    if (!_footerViewPending) {
        _footerViewPending = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        _footerViewPending.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //您的商品正在审核
        UIButton *pending = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
        [pending setTitle:@"您的商品正在审核" forState:UIControlStateNormal];
        pending.backgroundColor = [UIColor whiteColor];
        [pending setTitleColor:UIColorFromRGB_16(0x666666, 1) forState:UIControlStateNormal];
        [pending addTarget:self action:@selector(clickPending:) forControlEvents:UIControlEventTouchUpInside];
        [_footerViewPending addSubview:pending];
    }
    return _footerViewPending;
}
#pragma mark - 您的商品正在审核
- (void)clickPending:(UIButton *)sender {
    [self.delegate managerProductPending:self.ID];
}
#pragma mark - 下架商品
- (void)clickOffSchelve:(UIButton *)sender {
    [self.delegate managerProductOffSchelve:self.ID];
}

#pragma mark -编辑100 删除101 发布102
- (void)clickEdit_Delete_Release:(UIButton *)sender {
    switch (sender.tag -100) {
        case JRClickType_edit: {
            [self.delegate managerProductEdit:self.ID];
        }
            break;
        case JRClickType_delete: {
            [self.delegate managerProductDelete:self.ID];
        }
            break;
        case JRClickType_release: {
            [self.delegate managerProductRelease:self.ID];
        }
            break;
        default:
            break;
    }
}
//clickEdit_Delete 编辑300 删除301
- (void)clickEdit_Delete:(UIButton *)sender {
    switch (sender.tag -300) {
        case JRClickType_edit: {
            
            [self.delegate managerProductEdit:self.ID];
            
        }
            break;
        case JRClickType_delete: {
            [self.delegate managerProductDelete:self.ID];
            
        }
            break;
        default:
            break;
    }
}
#pragma mark -编辑200 发布201
- (void)clickEdit_Release:(UIButton *)sender {
    switch (sender.tag -200) {
        case JRClickType_edit: {
            
            [self.delegate managerProductEdit:self.ID];

        }
            break;
        case JRClickType_delete: {
            [self.delegate managerProductRelease:self.ID];

        }
            break;
        default:
            break;
    }
}

- (void)pullDisplayAllTagWithWidth:(CGFloat)maxWidth andHeight:(CGFloat)maxHeight {
    CGFloat btnsX = BigMargin;
    CGFloat btnsY = 0;
    if(self.tagBtnArr.count > 0){
        for (UILabel *btn in self.tagBtnArr) {
            [btn removeFromSuperview];
        }
        [_tagBtnArr removeAllObjects];
    }
    
    [self.tagVIew.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for(NSInteger i = 0; i < self.tagBtnLocalData.count;i++){
        NSString * str1 = self.tagBtnLocalData[i];
        CGSize  btnsSize = [str1 sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName, nil]];
        UILabel * btn = [[UILabel alloc] init];
        btn.textColor = [UIColor redColor];
        btn.text = str1;
        btn.textAlignment  = NSTextAlignmentCenter;
        btn.font = [UIFont boldSystemFontOfSize:10];
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = 2;
        btn.layer.borderColor = [UIColor redColor].CGColor;
        btn.layer.borderWidth = 0.5;
        
        btn.frame = CGRectMake(btnsX, btnsY,btnsSize.width+10, 15);
        if(btnsSize.width+10 + BigMargin>= UISIZE.width){
            btn.frame = CGRectMake(btnsX, btnsY,UISIZE.width-BigMargin-10, 15);
        }

        btnsX += (btnsSize.width+10)+SPACE_SPACE;
        //换行
        while (btnsX >= maxWidth) {
            if(i != 0){
                btnsY+=20;
            }
            btn.frame = CGRectMake(BigMargin, btnsY, btnsSize.width+10, 15);
            if(i == 0 && (btnsX+btnsSize.width+10+SPACE_SPACE)>maxWidth){
                btn.frame = CGRectMake(BigMargin, btnsY, btnsSize.width+10, 15);
            }
            if((btnsSize.width+10)+ SPACE_SPACE + BigMargin>= UISIZE.width){
                btn.frame = CGRectMake(BigMargin, btnsY,UISIZE.width-BigMargin-10, 15);
            }
            btnsX = BigMargin;

            btnsX += SPACE_SPACE + btnsSize.width+10;
            break;
        }
        [self.tagBtnArr addObject:btn];
        [self.tagVIew addSubview:btn];
        self.tagViewXibHeight.constant = maxHeight;
    }
    UILabel * btnFrame = (UILabel *)[self.tagBtnArr lastObject];
    twoBtnsY = CGRectGetMaxY(btnFrame.frame)+10;

}
- (void)layoutSubviews {
    [super layoutSubviews];
    
}
@end

