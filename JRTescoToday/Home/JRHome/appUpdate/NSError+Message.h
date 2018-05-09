//
//  NSError+Message.h
//  GW
//
//  Created by 艾呦呦 on 16/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Message)

/**
 *  网络请求的错误信息 (针对 AFN )
 */
- (NSString *)errorMessage;

@end
