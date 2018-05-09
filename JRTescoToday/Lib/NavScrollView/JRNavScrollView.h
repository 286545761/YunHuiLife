//
//  JRNavScrollView.h
//  scroll
//
//  Created by apple on 2017/12/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JRNavScrollViewDelegate <NSObject>
/**
 * 按钮点击事件实现
 */
- (void)clickSwitchPageWithTag:(NSInteger)tag;
@end

@interface JRNavScrollView : UIView

@property (nonatomic, weak)id<JRNavScrollViewDelegate>delegate;

/**
 * 按钮数组
 */
- (void)setUp:(NSArray *)switchButtons;

@end
