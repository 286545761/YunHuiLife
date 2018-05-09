//
//  PhotoView.m
//  XFAppliance
//
//  Created by hduokeji on 16/4/19.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "PhotoView.h"
#import "AFNetworking.h"
//#import "CommonFunc.h"
@implementation PhotoView
{
    BOOL isFullScreen;
    NSString *fullPath;
    
    NSUserDefaults *defaults;//判断是否登陆
}
-(void)touxiangshangchaun:(NSArray *)imageArray objectId:(NSString *)objectId commentText:(NSString *)commentText
{
//    defaults = [NSUserDefaults standardUserDefaults];//判断是否登陆
//    NSString *currentDateStr = [NSString stringGetCurrentDateStr];
//    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"uuid":[defaults objectForKey:UU_ID],@"commentType":@"0",@"objectId":objectId,@"cityCode":[NSUserDefaults  objectForKey:@"cityid"]}];
//    // 2. 根据httpClient生成post请求
//    NSString *stringURL=[NSString stringWithFormat:@"%@xifanApp/mine/comment/saveios",BASE_URL];
//    // 获取 uid
//    NSString *uid = [NSString getUIDWihtCurrentDateStr:currentDateStr dic:paramDic];
//    
//    [paramDic setObject:currentDateStr forKey:@"times"];
//    [paramDic setObject:uid forKey:@"uid"];
//   NSString *striconent =[CommonFunc base64StringFromText:commentText];
//    [paramDic setObject:striconent forKey:@"commentText"];
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    //    manager.responseSerializer.acceptableContentTypes=[NSSet  setWithObjects:@"text/html",@"text/plain",  nil];
//   [manager POST:stringURL parameters:paramDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        NSDateFormatter *formatter=[[NSDateFormatter alloc]  init];
//       
//        for (int i=0; i<imageArray.count; i++) {
//            formatter.dateFormat=@"yyyyMMddHHmmss";
//            NSData *imageData=UIImageJPEGRepresentation(imageArray[i], 0.1);
//            NSString *str=[formatter stringFromDate:[NSDate  date]];
//            NSString *fileName=[NSString  stringWithFormat:@"%@.jpg",str];
//            [formData appendPartWithFileData:imageData name:@"filelist" fileName:fileName mimeType:@"image/jpg"];
//        }
//     
//        
//        
//       
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//         [MBProgressHUD showError:responseObject[@"msg"]];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
    
    
}



@end
