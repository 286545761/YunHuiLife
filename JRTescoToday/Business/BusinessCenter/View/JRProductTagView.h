//
//  JRProductTagView.h
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JRProductTagView <NSObject>
- (void)reloadFrameWhenClickPullWithMaxY:(CGFloat)tagViewMaxY;
@end
@interface JRProductTagView : UIView
@property (nonatomic, strong)NSMutableArray *tagArr;        //从服务端获取标签个数
@property (nonatomic, strong)NSMutableArray *tagBtnLocalData;//存放标签个数
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *pullButton;
@property (weak, nonatomic) IBOutlet UITextField *inputTextView;
@property (weak, nonatomic) IBOutlet UIButton *tagButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleViewHeight;
@property (nonatomic, assign)id<JRProductTagView>delegate;
@end
