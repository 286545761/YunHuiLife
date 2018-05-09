//
//  MyFriendModel.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/12.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFriendModel : NSObject
@property(nonatomic,copy)NSString* phone;
@property(nonatomic,copy)NSString* time;
- (id)initWithDict:(NSDictionary *)dic;
@end
