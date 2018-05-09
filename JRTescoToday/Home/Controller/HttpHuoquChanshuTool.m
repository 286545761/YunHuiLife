//
//  HttpHuoquChanshuTool.m
//  JRTescoToday
//
//  Created by 123 on 2017/11/6.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "HttpHuoquChanshuTool.h"

@implementation HttpHuoquChanshuTool
{
   
}
+(NSMutableDictionary *)httpHouQuHttp:(NSString *)httpString
{
 
    NSMutableDictionary *nn=[[NSMutableDictionary  alloc] init];
    NSString*string3 =[NSString  stringWithFormat:@"%@", httpString] ;
     //[ ]
     NSLog(@"array:%@",string3); //结果是adfsfsfs和dfsdf
    NSArray *array = [string3 componentsSeparatedByString:@"?"]; //从字符A中分隔成2个元素的数组
    NSLog(@"array:%@",array); //结果是adfsfsfs和dfsdf
    if (array.count==1) {
        
    }
    else
    {
        NSString *string2=[NSString stringWithFormat:@"%@",array[1]];
        
        NSArray *array1 = [string2 componentsSeparatedByString:@"&"]; //从字符A中分隔成2个元素的数组
        NSLog(@"array:%@",array1); //
        for (NSString *string5 in array1) {
            NSArray *array = [string5 componentsSeparatedByString:@"="]; //从字符A中分隔成2个元素的数组
            [nn setObject:array[1] forKey:array[0]];
        }
    }
    
    return nn;
}
@end
