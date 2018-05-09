//
//  JRDigitalCell.h
//  JRTescoToday
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JRDigitalCellDelegate <NSObject>
- (void)showAlterView;
@end
@interface JRDigitalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *verifyCouponsButton;
@property (weak, nonatomic) IBOutlet UITextField *codeNumberTextField;
@property (nonatomic, assign)id<JRDigitalCellDelegate>delegate;
@end
