//
//  JRProductPhoto.h
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRAddProductViewController.h"
@protocol JRProductPhotoDelegate <NSObject>
- (void)getSelectedPhoto:(UIImage *)photo;
@end
@interface JRProductPhoto : UIView
@property (nonatomic, strong)UIViewController *addProductVC;
@property (nonatomic, assign)id<JRProductPhotoDelegate>delegate;
/**
* 获取编辑状态下的图片
 */
@property (nonatomic, strong)UIImageView *imageView;
/**
 * 获取添加状态的图片
 */

@property (nonatomic, strong)UIImage *photoImage;

@end
