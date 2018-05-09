//
//  JRProductMangerCellLayOut.m
//  JRTescoToday
//
//  Created by apple on 2017/12/3.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRProductMangerCellLayOut.h"
#import "JRManagerProductModel.h"
#import "JREditProductTagModel.h"
@interface JRProductMangerCellLayOut ()

@end

@implementation JRProductMangerCellLayOut
+ (CGFloat)layout_caculaterViewWidh {
    //图片宽高比例1:1 图片宽占比屏幕宽的0.3
    CGFloat UISIZE_Width = [UIScreen mainScreen].bounds.size.width;
    CGFloat imageViewWidth = UISIZE_Width * 0.3;
    CGFloat imageViewLeftToParentViewWSpace = 15;
    CGFloat imageViewRigthToTaViewSpace = 15;
    CGFloat tageViewRightToParentViewSpace = 15;
    CGFloat allSpace = imageViewLeftToParentViewWSpace + imageViewRigthToTaViewSpace + tageViewRightToParentViewSpace;
    CGFloat tagViewWidth = UISIZE_Width - imageViewWidth - allSpace;
    return tagViewWidth;

}
+ (CGFloat)layout_caculaterViewHeightWith:(JRManagerProductModel *)model {
    
    return  [JRProductMangerCellLayOut layout_caculaterCellHeightWith:model] - 142;
    
}

+ (CGFloat)layout_caculaterCellHeightWith:(JRManagerProductModel *)model {
    //图片宽高比例1:1 图片宽占比屏幕宽的0.3
    if (!model.goodsLabels.count) return 162;
        CGFloat UISIZE_Width = [UIScreen mainScreen].bounds.size.width;
        CGFloat imageViewWidth = UISIZE_Width * 0.3;
        CGFloat imageViewLeftToParentViewWSpace = 15;
        CGFloat imageViewRigthToTaViewSpace = 15;
        CGFloat tageViewRightToParentViewSpace = 15;
        CGFloat allSpace = imageViewLeftToParentViewWSpace + imageViewRigthToTaViewSpace + tageViewRightToParentViewSpace;
        CGFloat tagViewWidth = UISIZE_Width - imageViewWidth - allSpace;

        CGFloat lastBtnY = 0;
        CGFloat btnsX = 0;
        CGFloat btnsY = 0;
        NSMutableArray *tagArray = [[NSMutableArray alloc] init];
        if (tagArray.count) {
            [tagArray removeAllObjects];
        }
        for(NSInteger i = 0; i < model.goodsLabels.count; i++){
            JREditProductTagModel *tagModel = model.goodsLabels[i];
            CGSize  btnsSize = [tagModel.content sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName, nil]];
            UILabel * btn = [[UILabel alloc] init];
            btn.font = [UIFont systemFontOfSize:10];
            btn.frame = CGRectMake(btnsX, btnsY,btnsSize.width+10, 15);
            if(btnsSize.width+10>= UISIZE_Width){
                btn.frame = CGRectMake(btnsX, btnsY,UISIZE_Width-10, 15);
            }
            
            CGFloat SPACE_SPACE = 0;
            btnsX += (btnsSize.width+10)+SPACE_SPACE;
            //换行
            while (btnsX >= tagViewWidth) {
                if(i != 0){
                    btnsY+=20;
                }
                btn.frame = CGRectMake(0, btnsY, btnsSize.width+10, 15);
                if(i == 0 && (btnsX+btnsSize.width+30+SPACE_SPACE)>UISIZE_Width){
                    btn.frame = CGRectMake(0, btnsY, btnsSize.width+10, 15);
                }
                if((btnsSize.width+30)+ SPACE_SPACE >= UISIZE_Width){
                    btn.frame = CGRectMake(0, btnsY,UISIZE_Width-10, 15);
                }
                btnsX = 0;
                btnsX += SPACE_SPACE + btnsSize.width+10;
                break;
            }
            [tagArray addObject:btn];
        }
        UILabel * btnFrame = (UILabel *)[tagArray lastObject];
        lastBtnY = CGRectGetMaxY(btnFrame.frame)+10;
    //
    //
    model.tagViewMaxWidth = tagViewWidth;
    model.tagViewMaxHeight = lastBtnY;

    return 142 + lastBtnY;
}
@end

