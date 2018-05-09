//
//  checkSubmit.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/9.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "checkSubmit.h"

static checkSubmit *_instance;

@implementation checkSubmit

//类方法，返回一个单例对象
+(instancetype)shareTools
{
//    注意：这里建议使用self,而不是直接使用类名Tools（考虑继承）
    return [[self alloc]init];
}

//保证永远只分配一次存储空间
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
//    使用GCD中的一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
//    使用加锁的方式，保证只分配一次存储空间
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}

//让代码更加的严谨
-(nonnull id)copyWithZone:(nullable NSZone *)zone
{
    return [[self class] allocWithZone:zone];
    return _instance;
}

-(nonnull id)mutableCopyWithZone:(nullable NSZone *)zone
{
    return _instance;
}


-(int)checkIsSubmit{
 NSString *chek=  [FNUserDefaults objectForKey:@"checkIsSubmit"];
    int typeSubmit=0;
//    Deb
    if ([chek isEqualToString:@"Rel"]) {// 正常
        typeSubmit=1;
        
        
    }else{// 检测是什么模式
//        if ([chek isEqualToString:@"Deb"]) {// 测试
//            typeSubmit=0;
//        }else{
        
            
     NSComparisonResult r= [self shouldUpdateOnlineVersion];
            
            if (r==NSOrderedDescending) {
                
                [FNUserDefaults setObject:@"Deb" forKey:@"checkIsSubmit"];
                typeSubmit=0;
                
                
            }else{
                   [FNUserDefaults setObject:@"Rel" forKey:@"checkIsSubmit"];
                typeSubmit=1;
                
                
            }
            
            
//        }
        
        
        
        
    }
    
    
    
    return typeSubmit;
}

- (NSComparisonResult)shouldUpdateOnlineVersion {
    //获取app地址
    NSURL *appURLPath = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",@"1382504763"]];
    //获取发布版本的Version
    NSString *string = [NSString stringWithContentsOfURL:appURLPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString *onlineVersion;
    
    if (!([string isEqualToString:@""] || string == nil)) {
        
        
        
        
        
        
        NSDictionary *dic = [self dictionaryWithJsonString:string];
        
                NSInteger resultCount = [[dic objectForKey:@"resultCount"] integerValue];
                if (resultCount == 1) {
                    NSArray *result = [dic objectForKey:@"results"];
                    NSDictionary *first = [result firstObject];
                    onlineVersion = [first objectForKey:@"version"];
                }else{
                    return NSOrderedDescending;
                }
        
        
    }
    
    NSString *nowVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    
    NSComparisonResult result = [nowVersion compare:onlineVersion];
    NSLog(@"_+_+_++_+%ld",(long)result);
    return result;
    
    
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
-(void)reomveSu{
    
    
    [FNUserDefaults removeObjectForKey:@"checkIsSubmit"];
       
       
//       setObject:@"Rel" forKey:@"checkIsSubmit"];
    
    
}


@end
