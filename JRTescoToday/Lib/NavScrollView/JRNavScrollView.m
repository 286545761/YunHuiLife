
//
//  JRNavScrollView.m
//  scroll
//
//  Created by apple on 2017/12/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "JRNavScrollView.h"
@interface JRNavScrollView ()
@property (nonatomic, strong) UIView *contolBarView;

@property (nonatomic, strong) UILabel *sliderLabel;
@property (nonatomic, strong) NSMutableArray *controlBtnArray;

@property (nonatomic, strong, readwrite) UIScrollView *contentView;
@property (nonatomic, assign) CGSize size;


@end

@implementation JRNavScrollView
- (instancetype)initWithFrame:(CGRect)frame {
   self = [super initWithFrame:frame];
    if (self) {
        _size = frame.size;
        [self addUI];
    }
    return self;
}
- (void)setUp:(NSArray *)switchButtons {
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _contolBarView.frame.size.width, _contolBarView.frame.size.height)];
    _contentView.backgroundColor = [UIColor clearColor];
    _contentView.showsHorizontalScrollIndicator = NO;
    _contentView.showsVerticalScrollIndicator = NO;
    [_contolBarView addSubview:_contentView];
    //控制条上的切换按钮
    NSArray *arr = switchButtons;
    _controlBtnArray = [[NSMutableArray alloc] init];
    NSInteger minCount = arr.count > 3 ? arr.count : 3;
    CGFloat buttonWidth = 60;
    CGFloat spaceWidth = (_size.width - minCount * buttonWidth)/(minCount+1);
    for (NSInteger i = 0; i < arr.count; i++) {
//        NSString *title = arr[i];
//        CGFloat buttonWidth =[title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =CGRectMake(spaceWidth*(i+1) + buttonWidth*i,2,buttonWidth, _size.height - 4);
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        button.tag = i + 100;
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:button];
        [_controlBtnArray addObject:button];
    }

    //控制条上的滑动条
    _sliderLabel = [[UILabel alloc] init];
    UIButton *button = [_controlBtnArray objectAtIndex:0];
    _sliderLabel.frame = CGRectMake(spaceWidth, CGRectGetMaxY(button.frame), button.frame.size.width, 4);
    _sliderLabel.backgroundColor = [UIColor redColor];
    [_contentView addSubview:_sliderLabel];
    //
    //
    UIButton *lastButton = [_controlBtnArray lastObject];
    _contentView.contentSize = CGSizeMake(CGRectGetMaxX(lastButton.frame), _contolBarView.bounds.size.height);

}
 - (CGSize)getAttributeSizeWithText:(NSString *)text fontSize:(int)fontSize
{
    CGSize size=[text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    NSAttributedString *attributeSting = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    size = [attributeSting size];
    return size;
}

- (void)addUI {
    //控制条
    _contolBarView = [[UIView alloc] init];
    _contolBarView.backgroundColor = [UIColor whiteColor];
    _contolBarView.frame = CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, _size.height);
    [self addSubview:_contolBarView];
 
}
- (void)click:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        UIButton *button = [_controlBtnArray objectAtIndex:(sender.tag - 100)];
        _sliderLabel.frame = CGRectMake(button.frame.origin.x, CGRectGetMaxY(button.frame), button.frame.size.width, 5);
        //
        NSAssert(self.delegate != nil, @"property mydelegate is nil");
        [self.delegate clickSwitchPageWithTag:(sender.tag-100)];

        [self scrollSegementViewWithButton:button];
    }];
}
- (void)scrollSegementViewWithButton:(UIButton *)button {
    CGFloat selectedWidth = button.frame.size.width;
    CGFloat offsetX = (_size.width - selectedWidth) / 2;
    UIButton *lastButton = [_controlBtnArray lastObject];
    //排列的宽度小于屏幕宽
    if (CGRectGetMaxX(lastButton.frame) <= _size.width) return;
    if (button.frame.origin.x <= _size.width / 2) {
        [_contentView setContentOffset:CGPointMake(0, 0) animated:YES];
    } else if (CGRectGetMaxX(button.frame) >= (_contentView.contentSize.width - _size.width / 2)) {
        [_contentView setContentOffset:CGPointMake(_contentView.contentSize.width - _size.width, 0) animated:YES];
    } else {
        [_contentView setContentOffset:CGPointMake(CGRectGetMinX(button.frame) - offsetX, 0) animated:YES];
    }
}


@end
