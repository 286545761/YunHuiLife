//
//  JRHomeHeaderView.h
//  JRTescoToday
//
//  Created by apple on 2017/11/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JRHomeHeaderViewDelegate <NSObject>
- (void)pushToPointViewControllerWithType:(NSUInteger)type;
@end

@interface JRHomeHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (weak, nonatomic) IBOutlet UIView *TitleCatrgorey1;
@property (weak, nonatomic) IBOutlet UIView *TitleCategorey2;
@property (weak, nonatomic) IBOutlet UIView *HearBabbrView;

@property (nonatomic, assign)id<JRHomeHeaderViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIImageView *activityImageView;
@end
