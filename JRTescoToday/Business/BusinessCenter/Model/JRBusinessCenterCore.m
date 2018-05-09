//
//  JRBusinessCenterCore.m
//  JRTescoToday
//
//  Created by apple on 2017/11/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRBusinessCenterCore.h"
#import "HttpTool.h"
#import "AFNetworking.h"
@implementation JRBusinessCenterCore

+ (void)query_requestBusinessManagerWithToken:(NSString *)token type:(NSString *)type pageNum:(NSString *)pageNumber pageSize:(NSString *)pageSize Successed:(SuccessBlock)successed failed:(FaildBlock)failed {
    //
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:token,@"access_token",type,@"type",pageNumber,@"pageNum", pageSize,@"pageSize",nil];
    //
    [HttpTool getWithBaseURL:kBaseURL path:@"/goods/findGoodsBymid" params:paramsDict success:^(id data) {
        successed(data);
    } failure:^(NSError *error) {
        failed(nil);
    } alertInfo:^(NSString *alertInfo) {
        failed(alertInfo);
    }];
}
+ (void)uploadBusinessMangerProductWithToken:(NSString *)token productID:(NSString *)ID type:(NSString *)type Successed:(SuccessBlock)successed failed:(FaildBlock)failed {
    //
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:token,@"access_token",type,@"type",ID,@"goodsId",nil];
    //
    [HttpTool quttWithBaseURL:kBaseURL path:@"/goods/optionGoodsById" params:paramsDict success:^(id data) {
        successed(data);

    } failure:^(NSError *error) {
        failed(nil);

    } alertInfo:^(NSString *alertInfo) {
        failed(alertInfo);
    }];
}
+ (void)query_requestBussinessProductCategoryWithToken:(NSString *)token Successed:(Finish_Block)successed failed:(FaildBlock)failed {
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:token,@"access_token",nil];
    //
    [HttpTool getWithBaseURL:kBaseURL path:@"/goods/findCategory" params:paramsDict success:^(id data) {
        successed(data);
    } failure:^(NSError *error) {
        failed(nil);

    } alertInfo:^(NSString *alertInfo) {
        
    }];
}

+ (void)uploadCreatedBussinessProductCategoryWithToken:(NSString *)token goodsCategoryCreateModel:(NSString *)category Successed:(SuccessBlock)successed failed:(FaildBlock)failed {
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:category,@"name",nil];

    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramsDict options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@/goods/createMerchant?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        //5.回到主线程,进行更新页面
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            
            if ([dict[@"code"] intValue] >= 5000) {
                successed(dict[@"data"]);
            } else {
                failed(nil);
            }
        });
    }];
}

+ (void)query_requestBussinessProductAllTagWithID:(NSString *)ID Successed:(SuccessBlock)successed failed:(FaildBlock)failed {
    
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:ID,@"id",nil];
    [HttpTool getWithBaseURL:kBaseURL path:@"/goods/findGoodsLabelById" params:paramsDict success:^(id data) {
      
        successed(data);
    } failure:^(NSError *error) {
        failed(nil);
    } alertInfo:^(NSString *alertInfo) {
        failed(alertInfo);
    }];
}
+ (void)query_requestBussinessProductDetailInforWithID:(NSString *)ID Successed:(SuccessBlock)successed failed:(FaildBlock)failed {
    
    
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:ID,@"id",nil];
    [HttpTool getWithBaseURL:kBaseURL path:@"/goods/findGoodsById" params:paramsDict success:^(id data) {
        
        successed(data);
    } failure:^(NSError *error) {
        failed(nil);

    } alertInfo:^(NSString *alertInfo) {
        
        failed(alertInfo);
    }];
}
/**
 * 编辑商品 /goods/editGoods
 *access_token
 *id
 *name
 *mainImage
 *descp
 *goodsPrice
 *originalPrice
 *goodsCategoryId 选择的商品分类
 *type 操作类型（0 保存，1发布并保存）
 *labels
 */

+ (void)uploadEdit_ProductWithAccess_tokenToken:(NSString *)token productID:(NSString *)ID name:(NSString *)name mainImage:(UIImage *)mainImage descp:(NSString *)descp goodsPrice:(NSString *)goodsPrice originalPrice:(NSString *)originalPrice goodsCategoryId:(NSString *)goodsCategoryId type:(NSString *)type labels:(NSArray *)tagArr Successed:(SuccessBlock)successed failed:(FaildBlock)failed {
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *path = @"/goods/editGoods";
    NSLog(@"======%@",tagArr);

 
    NSMutableDictionary *paramDic;
    if (tagArr.count) {
        NSString *lablesStr = tagArr[0];
        for (NSInteger i = 0; i < tagArr.count; i++) {
            if (i != 0) {
                lablesStr = [lablesStr stringByAppendingString:@","];
                lablesStr = [lablesStr stringByAppendingString:tagArr[i]];
            }
        }
            paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"id":ID,@"name":name,@"descp":descp,@"goodsPrice":goodsPrice,@"originalPrice":originalPrice,@"goodsCategoryId":goodsCategoryId,@"type":type, @"labels":lablesStr}];
    } else {
            paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"id":ID,@"name":name,@"descp":descp,@"goodsPrice":goodsPrice,@"originalPrice":originalPrice,@"goodsCategoryId":goodsCategoryId,@"type":type}];
    }

    //
  
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.HTTPMethod = @"POST";
    request.allHTTPHeaderFields = @{@"Content-Type":@"application/json"};
    NSURL *url = [NSURL URLWithString:kBaseURL];
    AFHTTPClient *httpClient = [AFHTTPClient clientWithBaseURL:url];
    
    request = [httpClient multipartFormRequestWithMethod:@"POST" path:[NSString stringWithFormat:@"%@?access_token=%@",path,[defaults objectForKey:@"usersid"]]       parameters:paramDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 提示：UIImage不能为空
        NSData *data = UIImageJPEGRepresentation(mainImage,0.3);
        
        // 1) 取当前系统时间
        NSDate *date = [NSDate date];
        // 2) 使用日期格式化工具
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        // 3) 指定日期格式
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *dateStr = [formatter stringFromDate:date];
        // 4) 使用系统时间生成一个文件名
        NSString *fileName = [NSString stringWithFormat:@"%@.JSP", dateStr];
        
        [formData appendPartWithFileData:data name:@"mainImage" fileName:fileName mimeType:@"image/JSP"];
    }];
    
    // 准备做上传的工作！
    // 3. operation
    //  [request  setValue:[FNUserDefaults objectForKey:@"usersid"] forHTTPHeaderField:@"x-auth-token"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    // 显示上传进度
    /*
     bytesWritten   本次上传的字节数(本次上传了5k)
     totalBytesWritten  已经上传的字节数(已经上传了80k)
     totalBytesExpectedToWrite  文件总字节数（100k）
     */
    [op setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        
        
        //[_progress    setProgress:(float)(totalBytesWritten / totalBytesExpectedToWrite)];
        
        NSLog(@"上传 %f", (float)(totalBytesWritten / totalBytesExpectedToWrite));
    }];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"上传文件成功");
        successed(nil);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传文件失败 %@", error);
        failed(nil);
        
    }];
    
    // 4. operation start
    [op start];
    // [sheet showInView:self];

    
}
/**
 * 添加商品 /goods/addGoods
 */
+ (void)uploadADD_ProductWithAccess_tokenToken:(NSString *)token productID:(NSString *)ID name:(NSString *)name mainImage:(UIImage *)mainImage descp:(NSString *)descp goodsPrice:(NSString *)goodsPrice originalPrice:(NSString *)originalPrice goodsCategoryId:(NSString *)goodsCategoryId type:(NSString *)type labels:(NSArray *)tagArr Successed:(SuccessBlock)successed failed:(FaildBlock)failed {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //application/
    //multipart
    NSDictionary *headers = @{@"Content-Type":@"application/json"};
    
    NSString *path = @"/goods/addGoods";

    NSString *lablesStr = tagArr[0];
    
    NSMutableDictionary *paramDic;
    if (tagArr.count) {
        for (NSInteger i = 0; i < tagArr.count; i++) {
            if (i != 0) {
                lablesStr = [lablesStr stringByAppendingString:@","];
                lablesStr = [lablesStr stringByAppendingString:tagArr[i]];
            }
        }
        paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"name":name,@"descp":descp,@"goodsPrice":goodsPrice,@"originalPrice":originalPrice,@"goodsCategoryId":goodsCategoryId,@"labels":lablesStr,@"type":type}];
    } else {
        paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"name":name,@"descp":descp,@"goodsPrice":goodsPrice,@"originalPrice":originalPrice,@"goodsCategoryId":goodsCategoryId,@"type":type}];
    }
   
 
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setAllHTTPHeaderFields:headers];
    NSURL *url = [NSURL URLWithString:kBaseURL];
    AFHTTPClient *httpClient = [AFHTTPClient clientWithBaseURL:url];
    request = [httpClient multipartFormRequestWithMethod:@"POST" path:[NSString stringWithFormat:@"%@?access_token=%@",path,[defaults objectForKey:@"usersid"]]       parameters:paramDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 提示：UIImage不能为空
        NSData *data = UIImageJPEGRepresentation(mainImage,0.3);
    
        // 1) 取当前系统时间
        NSDate *date = [NSDate date];
        // 2) 使用日期格式化工具
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        // 3) 指定日期格式
        [formatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *dateStr = [formatter stringFromDate:date];
        // 4) 使用系统时间生成一个文件名
        NSString *fileName = [NSString stringWithFormat:@"%@.JSP", dateStr];
        
        [formData appendPartWithFileData:data name:@"mainImage" fileName:fileName mimeType:@"image/JSP"];
    }];
    
    // 准备做上传的工作！
    // 3. operation
    //  [request  setValue:[FNUserDefaults objectForKey:@"usersid"] forHTTPHeaderField:@"x-auth-token"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    // 显示上传进度
    /*
     bytesWritten   本次上传的字节数(本次上传了5k)
     totalBytesWritten  已经上传的字节数(已经上传了80k)
     totalBytesExpectedToWrite  文件总字节数（100k）
     */
    [op setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        
        
        //[_progress    setProgress:(float)(totalBytesWritten / totalBytesExpectedToWrite)];
        
        NSLog(@"上传 %f", (float)(totalBytesWritten / totalBytesExpectedToWrite));
    }];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
  
        NSLog(@"上传文件成功");
        successed(nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传文件失败 %@", error);
        failed(nil);
    }];
    
    // 4. operation start
    [op start];
    // [sheet showInView:self];

}

@end
