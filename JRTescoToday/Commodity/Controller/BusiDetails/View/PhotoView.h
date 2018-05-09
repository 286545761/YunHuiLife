//
//  PhotoView.h
//  XFAppliance
//
//  Created by hduokeji on 16/4/19.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoView : UIView< UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic) float progress;
-(void)touxiangshangchaun:(NSArray *)imageArray objectId:(NSString *)objectId commentText:(NSString *)commentText;
@end
