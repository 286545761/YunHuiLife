//
//  JREditProductTagModel.h
//  JRTescoToday
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JREditProductTagModel : NSObject
/**
 {
 "id": "c853963e-d66d-11e7-aac6-ecf4bbbf8260",
 "goodsId": "9ca517e2-d5b5-11e7-aac6-ecf4bbbf8260",
 "content": "无线2"
 },
 */
@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *goodsId;
@property (nonatomic, copy)NSString *content;

@end
