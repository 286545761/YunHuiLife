//
//  JREditProductViewController.h
//  JRTescoToday
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ViewController.h"
#import "JREditProductModel.h"

@interface JREditProductViewController : ViewController

@property (nonatomic, strong)JREditProductModel *editingModel;

@property (nonatomic, copy)NSString *productID;
- (void)giveModel:(JREditProductModel *)editingModel;
@end
