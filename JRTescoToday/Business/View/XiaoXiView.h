//
//  XiaoXiView.h
//  DHInvestment
//
//  Created by hduokeji on 15/10/11.
//  Copyright © 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XiaoXiView : UIView < UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic) float progress;
-(void)touxiangshangchaun:(UIImage *)imagev andName:(NSString *)name andDescp:(NSString *)descp andGoodsPrice:(NSString *)goodsPrice andStandard:(NSString *)standard andGoodsCategoryId:(NSString *)goodsCategoryId andstr:(NSString *)nsss andID:(NSString *)idn;
@end

