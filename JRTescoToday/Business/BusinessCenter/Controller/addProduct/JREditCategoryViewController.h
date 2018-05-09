//
//  JREditCategoryViewController.h
//  JRTescoToday
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JREditCategoryViewControllerDelegate <NSObject>
- (void)getTheProductCacegoryName:(NSString *)catetogryTitle andID:(NSString *)categoryID;
@end
@interface JREditCategoryViewController : UIViewController
@property (nonatomic, assign)id<JREditCategoryViewControllerDelegate>delegate;
@end
