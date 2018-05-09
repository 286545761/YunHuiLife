//
//  JRCountDownView.h
//  caculateTime
//
//  Created by apple on 2017/12/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRCountDownView : UIView
- (void)dealWithServerTime;
- (void)countTimeWithEndTime:(NSString *)endTime;
@end
