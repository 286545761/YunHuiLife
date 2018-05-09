//
//  JREditCategoryCell.h
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JREditCategoryCellDelegate <NSObject>
- (void)editedProductCategoryName:(NSString *)categoryTitle indexPath:(NSInteger)index;
@end
@interface JREditCategoryCell : UITableViewCell
@property (nonatomic, assign)id<JREditCategoryCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger defaultState;
@end
