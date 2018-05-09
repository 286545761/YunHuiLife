//
//  JRTagButton.h
//  JRTescoToday
//
//  Created by apple on 2017/11/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JRTagButtonDelegate <NSObject>
- (void)responesTapWithTag:(NSString *)tag;
@end
@interface JRTagButton : UIButton

@property (nonatomic, assign)id<JRTagButtonDelegate>delegate;

@property(nonatomic, assign) id target;
@property(nonatomic, assign) SEL action;
@property (nonatomic, assign) BOOL canDelete;
@property (nonatomic, strong)UIImageView *deleteImageView;
- (void)addLongPressTarget:(id)target action:(SEL)action;
@end
