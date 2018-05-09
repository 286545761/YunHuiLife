//
//  JRProductManageCell.h
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRManagerProductModel.h"
@protocol JRProductManageCellDelegate <NSObject>
- (void)managerProductPending:(NSString *)ID;
- (void)managerProductOffSchelve:(NSString *)ID;
- (void)managerProductEdit:(NSString *)ID;
- (void)managerProductDelete:(NSString *)ID;
- (void)managerProductRelease:(NSString *)ID;
@end
@interface JRProductManageCell : UITableViewCell

@property (nonatomic, assign)id<JRProductManageCellDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *productTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *productOriginalLabel;
@property (weak, nonatomic) IBOutlet UIView *tagVIew;
@property (weak, nonatomic) IBOutlet UIView *productStateView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tagViewXibHeight;
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;
@property (weak, nonatomic) IBOutlet UILabel *lineLable;
@property (nonatomic, assign)NSUInteger managerType;
- (void)loadData:(JRManagerProductModel *)model andType:(NSInteger)type;
- (void)removeAllFuYong;
@end
