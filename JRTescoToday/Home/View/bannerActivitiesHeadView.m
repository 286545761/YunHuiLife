//
//  bannerActivitiesHeadView.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/15.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//  banner活动头视图

#import "bannerActivitiesHeadView.h"

@interface bannerActivitiesHeadView ()
@property (weak, nonatomic) IBOutlet UILabel *activityIntroducedLable;



@end
@implementation bannerActivitiesHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
    self.activityIntroducedLable.layer.cornerRadius=5.f;
    self.activityIntroducedLable.layer.borderColor=[UIColor whiteColor].CGColor;
    
    self.activityIntroducedLable.layer.borderWidth=1.f;
        self.activityIntroducedLable.layer.masksToBounds=YES;
        
    }
    
    
    return self;
    
}

@end
