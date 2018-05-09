//
//  JRCreatActiveCell.m
//  JRTescoToday
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRCreatActiveCell.h"
//#import "HZQDatePickerView.h"
#import "MBProgressHUD+NJ.h"
#import "JRBusinessActivitiesCore.h"
#import "JRUserDefault.h"
typedef NS_ENUM(NSInteger, CreatActivitiesType) {
    CreatActivitiesType_FullCut = 0, //满减
    CreatActivitiesType_Sale = 1, //折扣
};
@interface JRCreatActiveCell ()
@property (weak, nonatomic) IBOutlet UIButton *fullCutButton;
@property (weak, nonatomic) IBOutlet UIButton *saleButton;
@property (nonatomic, strong) UIButton *lastButton;
@property (weak, nonatomic) IBOutlet UITextField *inputTextfiledA;
@property (weak, nonatomic) IBOutlet UITextField *inputTextFiledB;
@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *labelB;
@property (weak, nonatomic) IBOutlet UILabel *labelC;
@property (weak, nonatomic) IBOutlet UIButton *startTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *endTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *spaceLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *releaseButton;
//@property (nonatomic, strong) HZQDatePickerView *pikerView;
@property (nonatomic, strong) NSDictionary *paramDict;
@end
@implementation JRCreatActiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_fullCutButton addTarget:self action:@selector(clickFullCutOrSale:) forControlEvents:UIControlEventTouchUpInside];
    _fullCutButton.tag = 100;
    [_saleButton addTarget:self action:@selector(clickFullCutOrSale:) forControlEvents:UIControlEventTouchUpInside];
    _saleButton.tag = 101;
    //设置默认button状态
    _fullCutButton.selected = YES;
    _lastButton = _fullCutButton;
    //
    [self.startTimeButton addTarget:self action:@selector(clickTime:) forControlEvents:UIControlEventTouchUpInside];
    self.startTimeButton.tag = 300;
    [self.endTimeButton addTarget:self action:@selector(clickTime:) forControlEvents:UIControlEventTouchUpInside];
    self.endTimeButton.tag= 301;
    //发布
    [self.releaseButton addTarget:self action:@selector(clickRelease:) forControlEvents:UIControlEventTouchUpInside];
    

}
#pragma mark - 日期点击事件
- (void)clickTime:(UIButton *)sender {
    //开始日期
//    if (sender.tag - 300 == CreatActivitiesType_FullCut) [self setupDateView:DateTypeOfStart];
//    //截止日期
//    if (sender.tag - 300 == CreatActivitiesType_Sale) [self setupDateView:DateTypeOfEnd];

}
#pragma mark - 满减/折扣点击状态
- (void)clickFullCutOrSale:(UIButton *)sender {
    sender.selected = YES;
    _lastButton.selected = sender.tag == _lastButton.tag ? YES : NO;
    _lastButton = sender;
}

//#pragma mark - 截止日期
//- (void)setupDateView:(DateType)type {
//    _pikerView = [HZQDatePickerView instanceDatePickerView];
//    _pikerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 20);
//    [_pikerView setBackgroundColor:[UIColor clearColor]];
//    _pikerView.delegate = self;
//    _pikerView.type = type;
//    [_pikerView.datePickerView setMinimumDate:[NSDate date]];
//    [[UIApplication sharedApplication].keyWindow addSubview:_pikerView];
//    
//}
//- (void)getSelectDate:(NSString *)date type:(DateType)type {
//    NSLog(@"%d - %@", type, date);
//    switch (type) {
//        case DateTypeOfStart:
//            [self.startTimeButton setTitle:[NSString stringWithFormat:@"%@", date]  forState:UIControlStateNormal];
//            break;
//            
//        case DateTypeOfEnd:
//            [self.endTimeButton setTitle: [NSString stringWithFormat:@"%@", date] forState:UIControlStateNormal];
//            break;
//            
//        default:
//            break;
//    }
//}
#pragma mark - 创建活动
- (void)clickRelease:(UIButton *)sender {

    self.paramDict = [[NSDictionary alloc] init];
    if (self.lastButton.tag - 100 == CreatActivitiesType_FullCut) {
            self.paramDict = @{@"amount":_inputTextFiledB.text,@"description":_descriptionTextView.text,@"endTime":_endTimeButton.titleLabel.text,@"startTime":_startTimeButton.titleLabel.text,@"minAmount":_inputTextfiledA.text,@"type":@"1"};
    }
    //
    if (self.lastButton.tag - 100 == CreatActivitiesType_Sale) {
        self.paramDict = @{@"description":_descriptionTextView.text,@"endTime":_endTimeButton.titleLabel.text,@"startTime":_startTimeButton.titleLabel.text,@"rebate":_inputTextFiledB.text,@"type":@"2"};
    }
    
    [JRBusinessActivitiesCore queryActivitiesCenter_CreatBusinessActivitiesWithParam:self.paramDict Successed:^(NSDictionary *data) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showError:@"创建成功"];
        });
        
    } Faild:^(NSString *erro) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showError:erro];
        });
    }];
    
    
}


@end
