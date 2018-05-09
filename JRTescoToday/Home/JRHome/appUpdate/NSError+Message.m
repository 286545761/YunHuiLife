//
//  NSError+Message.m
//  GW
//
//  Created by 艾呦呦 on 16/11/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSError+Message.h"

@implementation NSError (Message)

- (NSString *)errorMessage {
    
    NSString *errResponse = [[NSString alloc] initWithData:(NSData *)self.userInfo[@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding];
    
    NSData *jsonData = [errResponse dataUsingEncoding:NSUTF8StringEncoding];
    id response = [NSJSONSerialization JSONObjectWithData:jsonData
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
    
    if ([response isKindOfClass:[NSArray class]]) {
        NSArray *arr = response;
        return arr[0];
    }
    if ([response isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = response;
        if ([dic objectForKey:@"message"]) {
            if(![[dic objectForKey:@"message"] isEqual:[NSNull null]]){
                return dic[@"message"];
            }
        }

    }
    return @"请求错误,请重试!";
}

@end
