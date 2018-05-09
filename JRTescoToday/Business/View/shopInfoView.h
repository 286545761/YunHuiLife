//
//  shopInfoView.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/4/8.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
// 商家-店铺信息-

#import <UIKit/UIKit.h>
//
@interface shopInfoView : UIView
/*
 *店名
 */
@property(strong,nonatomic)UILabel *shopNameLabel;

/*
 *优惠买单
 */
@property(strong,nonatomic)UIButton * offerToPayButton;
/*
 *星级
 */
@property(strong,nonatomic)UIView *theStarImageView;
/*
 *分数
 */
@property(strong,nonatomic)UILabel *scoreLabel;
/*
 *满减 文本
 */
//@property(strong,nonatomic)UILabel *fullReductionLabel;
/*
 *满减内容
 */
@property(strong,nonatomic)UILabel *fullReductionContentLabel;
/*
 *打折 文本
 */
//@property(strong,nonatomic)UILabel*atADiscountLabel;

/*
 *打折 内容
 */
@property(strong,nonatomic)UILabel*atADiscountContentLabel;
/*
 *横线
 */
//@property(strong,nonatomic)UIView *horizontalLineView;

/*
 *定位 图标
 */
//@property(strong,nonatomic)UIImageView *locationIconImageView;
/*
 *地址
 */
@property(strong,nonatomic)UILabel *addressLabel;
/*
 *电话竖线
 */
//@property(strong,nonatomic)UIView *phoneCrossLineView;
/*
 *拨打 电话
 */
@property(strong,nonatomic)UIButton *makePhoneCallButton;
/*
 *定位 图标
 */
@property(strong,nonatomic)UIButton *locationIconButton;
/*
 *<# #>
 */
@property(copy,nonatomic)NSString *actionType;


///*
// *店长推荐 文本
// */
//@property(strong,nonatomic)UILabel *theManagerRecommendsTextLabel;
///*
// *店长推荐 竖线
// */
//@property(strong,nonatomic)UIView *theManagerRecommendsCrossView;
@end
