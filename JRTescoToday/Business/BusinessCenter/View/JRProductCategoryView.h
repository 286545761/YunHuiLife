//
//  JRProductCategoryView.h
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JRProductCategoryViewDelegate <NSObject>
- (void)selectTheCatagoryOfProduct;
@end

@interface JRProductCategoryView : UIView
@property (nonatomic, assign)id<JRProductCategoryViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextField *presentPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *originalPriceTextField;
@property (weak, nonatomic) IBOutlet UIButton *selectCategory;
@property (nonatomic, copy)NSString *selectCategoryID;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@end
