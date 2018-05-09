//
//  shangchuan.m
//  JRTescoToday
//andName:(NSString *)name andDescp:(NSString *)descp andPhone:(NSString *)phone andCategory:(NSString *)category andEmail:(NSString *)email andRemarks:(NSString *)remarks andProvinceName:(NSString *)provinceName andCityName:(NSString *)cityName andCountyName:(NSString *)countyName andStreetName:(NSString *)streetName
//  Created by 123 on 2017/9/19.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "shangchuan.h"
#import "AFNetworking.h"
#import "UserAccount.h"
@implementation shangchuan
{
    BOOL isFullScreen;
    NSString *fullPath;
    NSData *imageData ;
    NSArray *marray;
    int i;
    MBProgressHUD *hudLoding;
}
-(void)touxiangshangchaun:(NSMutableDictionary *)imagev andOther:(NSString *)other

{
    if ([other isEqualToString:@"0"]) {
       marray=@[@"mainImage",@"blImg",@"idCardFront",@"idCardOpposite"];
    }
    else
    {
         marray=@[@"mainImage",@"blImg",@"idCardFront",@"idCardOpposite",@"otherImage"];
    }
  
    i=0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *headers = @{
                              @"content-type":  @"application/json",
                              };
//    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
//                                                                                    @"name":name,
//                                                                                    @"phone":phone,
//                                                                                    @"category":category,
//                                                                                    @"email":email,
//                                                                                    @"remarks":remarks,
//                                                                                    @"provinceName":provinceName,
//                                                                                    @"cityName":cityName,
//                                                                                    @"countyName":countyName ,
//                                                                                    @"streetName":streetName,
//                                                                                    }];
//
//
    
    NSLog(@"%@",[defaults objectForKey:@"usersid"]);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setAllHTTPHeaderFields:headers];
    NSURL *url = [NSURL URLWithString:kBaseURL];
    AFHTTPClient *httpClient = [AFHTTPClient clientWithBaseURL:url];

    NSMutableArray *imagArray=[[NSMutableArray alloc] init];
   
    if ([other isEqualToString:@"0"]) {
        [imagArray  addObject:imagev[@"mainImage"]];
        [imagArray  addObject:imagev[@"blImg"]];
        //[imagArray  addObject:imagev[@"bankImage"]];
        [imagArray  addObject:imagev[@"idCardFront"]];
        [imagArray  addObject:imagev[@"idCardOpposite"]];
       
    }
    else
    {
        [imagArray  addObject:imagev[@"mainImage"]];
        [imagArray  addObject:imagev[@"blImg"]];
        //[imagArray  addObject:imagev[@"bankImage"]];
        [imagArray  addObject:imagev[@"idCardFront"]];
        [imagArray  addObject:imagev[@"idCardOpposite"]];
        [imagArray  addObjectsFromArray:imagev[@"otherImage"]];
    }
    request = [httpClient multipartFormRequestWithMethod:@"POST" path:[NSString stringWithFormat:@"/merchant/merchantUploadImg?access_token=%@",[defaults objectForKey:@"usersid"]]       parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        
        for (UIImage *imagev1 in imagArray) {
           
            UIImage *image=[self   fixOrientation:imagev1];
            // 提示：UIImage不能为空
            NSData *data = UIImageJPEGRepresentation(image,0.3);
            // NSData *data = UIImageRepresentation(self.imageView.image , 0.15);
            
            /**
             参数说明：
             
             1. fileData:   要上传文件的数据
             2. name:       负责上传文件的远程服务中接收文件使用的字段名称
             3. fileName：   要上传文件的文件名
             4. mimeType：   要上传文件的文件类型
             
             提示，在日常开发中，如果要上传图片到服务器，一定记住不要出现文件重名的问题！
             这个问题，通常涉及到前端程序员和后端程序员的沟通。
             
             通常解决此问题，可以使用系统时间作为文件名！
             */
            // 1) 取当前系统时间
            NSDate *date = [NSDate date];
            // 2) 使用日期格式化工具
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            // 3) 指定日期格式
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            NSString *dateStr = [formatter stringFromDate:date];
            // 4) 使用系统时间生成一个文件名
            NSString *fileName = [NSString stringWithFormat:@"%@.JSP", dateStr];
            if (i==4) {
                i=4;
            }
            [formData appendPartWithFileData:data name:marray[i] fileName:fileName mimeType:@"image/JSP"];
            if (i<4) {
                i++;
            }
           
        }
        
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
    [self showLoadingProgress];
    [op setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        
        
        //[_progress    setProgress:(float)(totalBytesWritten / totalBytesExpectedToWrite)];
        
        NSLog(@"上传 %f", (float)(totalBytesWritten / totalBytesExpectedToWrite));
//        NSString *progress = [NSString stringWithFormat:@"%f",(float)(totalBytesWritten / totalBytesExpectedToWrite)];
//        [MBProgressHUD showError:progress];

    }];
    
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD showError:@"上传成功，等待审核"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"maketou" object:nil];
        NSLog(@"上传文件成功");
        [self hideLodingProgress];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传文件失败 %@", error);
        [self hideLodingProgress];
        [MBProgressHUD showError:@"上传文件失败"];
        
    }];
    
    // 4. operation start
    [op start];
    // [sheet showInView:self];
}
#pragma mark - 进度条
- (void)showLoadingProgress {
    UIView *view = [UIApplication sharedApplication].keyWindow;
    hudLoding = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Set the bar determinate mode to show task progress.
    hudLoding.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hudLoding.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgress];
       
    });
}
#pragma mark - 隐藏进度条
- (void)hideLodingProgress {
    dispatch_async(dispatch_get_main_queue(), ^{
        [hudLoding hideAnimated:YES];
    });
}
- (void)doSomeWorkWithProgress {
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView *view = [UIApplication sharedApplication].keyWindow;
            [MBProgressHUD HUDForView:view].progress = progress;
        });
        usleep(50000);
    }
}

- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


@end
