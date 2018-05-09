//
//  TiXianListModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/19.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TiXianListModel : NSObject
@property(nonatomic,copy)NSString* amount;
@property(nonatomic,copy)NSString* fee;
@property(nonatomic,copy)NSString* status;
@property(nonatomic,copy)NSString* time;


- (id)initWithDict:(NSDictionary *)dic;
@end
