//
//  JRProductPhoto.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRProductPhoto.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "UIImage+Orientation.h"
#import "MBProgressHUD+NJ.h"
@interface JRProductPhoto ()<UIAlertViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>

@end
@implementation JRProductPhoto
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
    }
    return self;
}
- (void)creatUI {
    UIImageView *defultImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/4, self.frame.size.width/7)];
    defultImageView.center = CGPointMake(self.center.x, self.center.y);
    defultImageView.image = [UIImage imageNamed:@"camero-1.png"];
    [self addSubview:defultImageView];
    
    //
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    _imageView.userInteractionEnabled = YES;
    [_imageView addGestureRecognizer:tap];
}
- (void)tapImageView:(UITapGestureRecognizer *)tap {
    
    UIActionSheet *pickImageSheet = [[UIActionSheet alloc] initWithTitle:@"请选择操作方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
    [pickImageSheet showInView:[UIApplication sharedApplication].keyWindow];
}
#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSInteger sourceType = 0;
    switch (buttonIndex) {
        case 0: {
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            BOOL cameraIsAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
            if (cameraIsAvailable && authStatus != AVAuthorizationStatusRestricted && authStatus != AVAuthorizationStatusDenied) {
                //拍照
                sourceType = UIImagePickerControllerSourceTypeCamera;
               
            } else {
                [MBProgressHUD showError:@"在设置中打开摄像头权限" toView:self];
            }
        }
            break;
        case 1: {
            PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
            if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
                [MBProgressHUD showError:@"在设置中打开相册权限" toView:self];
            } else {
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
        }
            break;
        default:
            return;
    }
    
    UIImagePickerController *imagePickController = [[UIImagePickerController alloc] init];
    imagePickController.sourceType = sourceType;
    imagePickController.delegate = self;
    imagePickController.allowsEditing = YES;
    imagePickController.navigationBar.tintColor = [UIColor redColor];
    [_addProductVC presentViewController:imagePickController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    if (![mediaType isEqualToString:@"public.image"]) {
        [MBProgressHUD showMessage:@"只能选择图片" toView:self];
        return;
    }
    
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    //更新头像数据 (暂时显示,上传成功后会再次刷新)
    self.imageView.image = [UIImage fixOrientation:image];
    self.photoImage = [UIImage fixOrientation:image];
    [self.delegate getSelectedPhoto:[UIImage fixOrientation:image]];
}
// 当用户取消时，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)saveImage2Document:(UIImage *)image withName:(NSString *)imageName {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths firstObject] stringByAppendingPathComponent:imageName];
    [imageData writeToFile:filePath atomically:YES];
}


@end
