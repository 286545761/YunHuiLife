//
//  shangchuan.h
//  JRTescoToday
//
//  Created by 123 on 2017/9/19.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shangchuan : NSObject< UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic) float progress;
-(void)touxiangshangchaun:(NSMutableDictionary *)imagev andOther:(NSString *)other;

@end
