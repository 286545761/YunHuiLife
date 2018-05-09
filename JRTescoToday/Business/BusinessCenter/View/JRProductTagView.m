//
//  JRProductTagView.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRProductTagView.h"
#import "JRTagButton.h"
#import "JREditProductTagModel.h"
#define UISIZE [UIScreen mainScreen].bounds.size
#define UIColorFromRGB_16(rgbValue,_alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_alpha]
#define BigMargin 10
#define SPACE_SPACE 10
@interface JRProductTagView ()<UITextFieldDelegate>
@property (nonatomic, strong)NSMutableArray *tagBtnArr;//存放所有按钮标签对象
@property (nonatomic, copy)NSString *inputTag;
@end
@implementation JRProductTagView {
    CGFloat twoBtnsY;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    //按钮数据
//    self.tagBtnLocalData =[[NSMutableArray alloc] init];
    self.backgroundColor = [UIColor whiteColor];
    [self.addButton setTitleColor:UIColorFromRGB_16(0xe62f47, 1) forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(clickAddTag:) forControlEvents:UIControlEventTouchUpInside];
    //
    [self.tagButton setTitleColor:UIColorFromRGB_16(0xf1314a, 1) forState:UIControlStateNormal];

    [self.tagButton addTarget:self action:@selector(clickFirTag:) forControlEvents:UIControlEventTouchUpInside];
    //
    [self.inputTextView addTarget:self action:@selector(textFieldEditChange:) forControlEvents:UIControlEventEditingChanged];
    //默认不展开
    self.pullButton.selected = NO;
    [self pullDisplayAllTag];
    for (UIButton *btn in self.tagBtnArr) {
        btn.hidden = !self.pullButton.selected;
    }
    [self.pullButton addTarget:self action:@selector(clickPull:) forControlEvents:UIControlEventTouchUpInside];
    self.inputTextView.delegate = self;
    //
    [self.tagButton setTitle:@"" forState:UIControlStateNormal];
}
- (NSMutableArray *)tagBtnLocalData {
    if (!_tagBtnLocalData) {
        _tagBtnLocalData = [[NSMutableArray alloc] init];
    }
    return _tagBtnLocalData;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.inputTextView resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //限制长度为20
    NSUInteger locationNum = range.location;
    if (locationNum < (NSUInteger)10) {
        return YES;
    } else {
        return NO;
    }
}
#pragma mark - 有数据时
- (void)setTagArr:(NSMutableArray *)tagArr {
    _tagArr = tagArr;
    if (self.tagBtnLocalData.count) {
        [self.tagBtnLocalData removeAllObjects];
    }
    for (JREditProductTagModel *tagModel in tagArr) {
        [self.tagBtnLocalData addObject:tagModel.content];
    }
    //默认不展开
    self.pullButton.selected = NO;
    [self pullDisplayAllTag];
    for (UIButton *btn in self.tagBtnArr) {
        btn.hidden = !self.pullButton.selected;
    }
    //
    if (tagArr.count) [self.tagButton setTitle:[self.tagBtnLocalData lastObject] forState:UIControlStateNormal];
}
- (void)textFieldEditChange:(UITextField *)textField{
    _inputTag = textField.text;
}
#pragma mark - 添加标签
- (void)clickAddTag:(UIButton *)sender {
    [self.inputTextView resignFirstResponder];
    if (_inputTag.length) {
        if (self.tagBtnLocalData.count < 5) {
            [self.tagBtnLocalData addObject:_inputTag];
        }
        self.pullButton.selected = YES;
        [self pullDisplayAllTag];
    }
}
#pragma mark - 展开标签栏
- (void)clickPull:(UIButton *)sender {
    UIButton *pullButton = sender;
    pullButton.selected = !pullButton.selected;
    if (!self.tagBtnLocalData.count) {
        return;
    }
    for (UIButton *btn in self.tagBtnArr) {
        btn.hidden = !pullButton.selected;
    }
    [self layoutSubviews];
   
}

- (void)clickFirTag:(UIButton *)sender {
    
}
- (void)tagBtnLongPress:(JRTagButton *)sender {
    return;
}
- (void)clickSecToEndTag:(JRTagButton *)sender {
    
    if (!sender.canDelete) {
        return;
    }
    for (NSInteger i = 0; i < self.tagBtnArr.count; i++) {
        UIButton *tagButton = self.tagBtnArr[i];
        if (tagButton.tag == sender.tag) {
            [self.tagBtnLocalData removeObjectAtIndex:i];
        }
    }
    [self pullDisplayAllTag];
}
- (NSMutableArray *)tagBtnArr {
    if (!_tagBtnArr) {
        _tagBtnArr = [[NSMutableArray alloc] init];
    }
    return _tagBtnArr;
}
- (void)pullDisplayAllTag {
    //根据数据创建相关规格按钮
    if(self.tagBtnArr.count > 0){
        for (UIButton *btn in self.tagBtnArr) {
            [btn removeFromSuperview];
        }
        [_tagBtnArr removeAllObjects];
    }
    CGFloat btnsX = BigMargin;
    CGFloat btnsY = self.titleViewHeight.constant;
    
    if (!self.tagBtnLocalData.count) {
        //没有标签时 标签栏展开高度twoBtnsY = 0;
        self.pullButton.selected = NO;
        twoBtnsY = 0;
        self.frame  = CGRectMake(0,self.frame.origin.y,UISIZE.width, 44);
        return;
    }
    for(NSInteger i = 0; i < self.tagBtnLocalData.count;i++){
        NSString * str1 = self.tagBtnLocalData[i];
        CGSize  btnsSize = [str1 sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName, nil]];
        JRTagButton * btn = [JRTagButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"tanchuangbeij.png"] forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB_16(0xf1314a, 1) forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB_16(0xf1314a, 1) forState:UIControlStateSelected];
        [btn setTitle:str1 forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:10];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(clickSecToEndTag:) forControlEvents:UIControlEventTouchUpInside];
        //长按删除
        [btn addLongPressTarget:self action:@selector(tagBtnLongPress:)];
        //
        btn.frame = CGRectMake(btnsX, btnsY,btnsSize.width+30, 35);
        if(btnsSize.width+30 + BigMargin>= UISIZE.width){
            btn.frame = CGRectMake(btnsX, btnsY,UISIZE.width-BigMargin-10, 35);
        }
        
        btnsX += (btnsSize.width+30)+SPACE_SPACE;
        //换行
        while (btnsX >= UISIZE.width) {
            if(i != 0){
                btnsY+=45;
            }
            btn.frame = CGRectMake(BigMargin, btnsY, btnsSize.width+30, 35);
            if(i == 0 && (btnsX+btnsSize.width+30+SPACE_SPACE)>UISIZE.width){
                btn.frame = CGRectMake(BigMargin, btnsY, btnsSize.width+30, 35);
            }
            if((btnsSize.width+30)+ SPACE_SPACE + BigMargin>= UISIZE.width){
                btn.frame = CGRectMake(BigMargin, btnsY,UISIZE.width-BigMargin-10, 35);
            }
            btnsX = BigMargin;
            
            btnsX += SPACE_SPACE + btnsSize.width+30;
            break;
        }
        [self.tagBtnArr addObject:btn];
        [self addSubview:btn];
    }
    
    UIButton * btnFrame = (UIButton *)[self.tagBtnArr lastObject];
    twoBtnsY = CGRectGetMaxY(btnFrame.frame)+10;

}
- (void)layoutSubviews {
   
    if (twoBtnsY && self.pullButton.selected == YES) {
        self.frame  = CGRectMake(0,self.frame.origin.y,UISIZE.width, twoBtnsY);
        CGFloat maxY = twoBtnsY+self.frame.origin.y;
        [self.delegate reloadFrameWhenClickPullWithMaxY:maxY];
    } else {
        self.frame  = CGRectMake(0,self.frame.origin.y,UISIZE.width, 44);
        CGFloat maxY = self.frame.origin.y+44;
        [self.delegate reloadFrameWhenClickPullWithMaxY:maxY];
    }
}
@end
