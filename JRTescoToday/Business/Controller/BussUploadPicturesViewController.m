//
//  BussUploadPicturesViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/10/31.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "BussUploadPicturesViewController.h"
#import "BussUploadView.h"
#import "shangchuan.h"
#import "HomeTabTableViewCell.h"
@interface BussUploadPicturesViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mineTableView;
     HomeTabTableViewCell*_cell;
    UIButton *dianpuzhutu;
    UIButton*yinhangkaihuxuke;
    UIButton *dianzhushenfenzheng;
    UIButton*dianzhufan;
    UIButton*yingyezhizhao;
    UIButton *qita;
     UIButton *qitaShanChu;
    NSString *leixingphoto;
    UIScrollView *makeView12;
    UIImage *image;
    UIImage *image1;
    UIImage *image2;
    UIImage *image3;
    UIImage *image4;
    UIImage *image5;
    UIImage *image6;
    UIImage *image7;
    int i;
    NSMutableDictionary *photoDictionary;
    NSMutableArray *photoArray;
     NSMutableArray *photoImageViewArray;
    NSMutableArray *BtnImageViewArray;
    NSString  *otherimage;
}
@end

@implementation BussUploadPicturesViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.title=@"商家认证";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    photoArray=[[NSMutableArray alloc] init];
    photoImageViewArray=[[NSMutableArray alloc] init];
    BtnImageViewArray=[[NSMutableArray alloc] init];
     photoDictionary=[[NSMutableDictionary alloc] init];
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-120) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    i=0;
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"maketou" object:nil];
    if(iPhone5)
    {
        _mineTableView.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height-120);
    }
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_mineTableView];
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    BussUploadView *buss=[[BussUploadView alloc] init];
    buss.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    UIButton *btnnn=[UIButton buttonWithType:UIButtonTypeCustom];
    if(iPhonex)
    {
        btnnn.frame=CGRectMake(0, kScreenSize.height-114-49, kScreenSize.width, 50);
    }else
    {
        btnnn.frame=CGRectMake(0, kScreenSize.height-114, kScreenSize.width, 50);
    }
   // btnnn.frame=CGRectMake(0, kScreenSize.height-114, kScreenSize.width, 50);
    [btnnn setTitle:@"确定" forState:UIControlStateNormal];
    btnnn.backgroundColor=[UIColor colorWithHexString:BunRed];
    [btnnn addTarget:self action:@selector(btnnn) forControlEvents:UIControlEventTouchUpInside];
    //店铺主图
    dianpuzhutu=buss.dianPuZhuTu;
    dianpuzhutu.tag=1000;
    [dianpuzhutu addTarget:self action:@selector(UpImagetoseventer:) forControlEvents:UIControlEventTouchUpInside];
    
    //营业执照
    yingyezhizhao=buss.yingYeZhiZhao;
    yingyezhizhao.tag=1001;
    [yingyezhizhao addTarget:self action:@selector(UpImagetoseventer:) forControlEvents:UIControlEventTouchUpInside];
    //银行开户许可
    yinhangkaihuxuke=buss.yinHangKaiHuXuKe;
    yinhangkaihuxuke.tag=1002;
    [yinhangkaihuxuke addTarget:self action:@selector(UpImagetoseventer:) forControlEvents:UIControlEventTouchUpInside];
    //店主身份证正面
    dianzhushenfenzheng=buss.IDZhengMian;
    dianzhushenfenzheng.tag=1003;
    [dianzhushenfenzheng addTarget:self action:@selector(UpImagetoseventer:) forControlEvents:UIControlEventTouchUpInside];
    //店主身份证反面
    dianzhufan=buss.IDBeiMian;
    dianzhufan.tag=1004;
    [dianzhufan addTarget:self action:@selector(UpImagetoseventer:) forControlEvents:UIControlEventTouchUpInside];
    //其他证件
    qita=[UIButton buttonWithType:UIButtonTypeCustom];
    qita.frame=CGRectMake( kScreenSize.width/2-45-kScreenSize.width/3, 0, 90, 90);
    [qita setBackgroundImage:[UIImage imageNamed:@"uploading"] forState:UIControlStateNormal];
    qita.tag=1005;
    [qita addTarget:self action:@selector(UpImagetoseventer:) forControlEvents:UIControlEventTouchUpInside];
   
    //[_mineTableView addSubview:buss];
    _mineTableView.tableFooterView=buss;
    [self.view addSubview:btnnn];
    makeView12=[[UIScrollView alloc] init];
    //makeView12.backgroundColor=[UIColor blueColor];
    makeView12.frame=CGRectMake(kScreenSize.width/3,123,kScreenSize.width,90);
    [buss.makeView addSubview:makeView12];
     [makeView12 addSubview:qita];
    otherimage=@"";
    // Do any additional setup after loading the view from its nib.
}
-(void)btnnn
{
    //    if (leixingphoto) {
    //
    //    }
     shangchuan *ma11=[[shangchuan alloc] init];
    
    ;
        if (!image1) {
            [MBProgressHUD showError:@"店铺主图不能为空"];
            return;
        }
        if (!image3) {
            [MBProgressHUD showError:@"营业执照不能为空"];
            return;
        }
//        if (!image3) {
//             [MBProgressHUD showError:@"银行开户许可不能为空"];
//            return;
//        }
        if (!image4) {
            [MBProgressHUD showError:@"店主身份证正面不能为空"];
            return;
        }
    //    if (!image5) {
    //      [MBProgressHUD showError:@"店主身份证背面不能为空"];
    //        return;
    //    }
    //    if (!image6) {
    //        [MBProgressHUD showError:@"其他图片不能为空"];
    //        return;
    //    }
    //    if (!ma.dainpuName.text) {
    //        [MBProgressHUD showError:@"店铺名字不能为空"];
    //        return;
    //    }
    //    if (!ma.dianhua.text) {
    //        [MBProgressHUD showError:@"电话不能为空"];
    //        return;
    //    }
    //    if (!ma.youxiang.text) {
    //        [MBProgressHUD showError:@"邮箱不能为空"];
    //        return;
    //    }
    //    if (!shangjiaView.text) {
    //        [MBProgressHUD showError:@"店铺介绍不能为空"];
    //        return;
    //    }
    //    if (!cityaa) {
    //        [MBProgressHUD showError:@"地址不能为空"];
    //        return;
    //    }
    //    if (!citya1a) {
    //        [MBProgressHUD showError:@"地址不能为空"];
    //        return;
    //    }
    //    if (!citya1a2) {
    //        [MBProgressHUD showError:@"地址不能为空"];
    //        return;
    //    }
    //    if (!ma.xiangXiDizhi.text) {
    //        [MBProgressHUD showError:@"地址不能为空"];
    //        return;
    //    }
    //    if (!nuidn) {
    //        [MBProgressHUD showError:@"分类不能为空"];
    //        return;
    //    }
//    BussUploadPicturesViewController *bussUpload=[[BussUploadPicturesViewController alloc] init];
//    [self.navigationController pushViewController:bussUpload animated:YES];
    [photoDictionary setObject:photoArray forKey:@"otherImage"];
     [ma11 touxiangshangchaun:photoDictionary andOther:otherimage];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTabTableViewCell" owner:self options:nil] lastObject];
    }
    return _cell;
}
// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
    
    
}
#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
#pragma mark 尾视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    if (iPhone5) {
        return 10;
    }else
    {
        return 0;
    }
    
}
#pragma mark 上传图片方法
-(void)UpImagetoseventer:(UIButton*)btn
{
    if (btn.tag==1000)
    {
        leixingphoto=@"1";
        [self photo];
        
    }else if(btn.tag==1001)
    {
        leixingphoto=@"2";
        [self photo];
    }else if(btn.tag==1002)
    {
        leixingphoto=@"3";
        [self photo];
    }else if(btn.tag==1003)
    {
        leixingphoto=@"4";
        [self photo];
    }else if(btn.tag==1004)
    {
        leixingphoto=@"5";
        [self photo];
        
    }else
    {
        leixingphoto=@"6";
        [self photo];
    }
}
-(void)photo
{
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
        
    }
    else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 255;
    NSLog(@"%@",sheet);
    [sheet showInView:self.view];
    
}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    
                    
                    
                    break;
                    
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = YES;
        
        imagePickerController.sourceType =sourceType;
            //self.searchController.searchBar.barTintColor =  [UIColor whiteColor];

         imagePickerController.navigationBar.backgroundColor = [UIColor redColor];
        [self presentViewController:imagePickerController animated:YES completion:^{
            
//            UIViewController *contr=imagePickerController.viewControllers.lastObject;
//            UIBarButtonItem *imagePickerCancelButton=[contr valueForKey:@"imagePickerCancelButton"];
//            UIButton *button=[imagePickerCancelButton valueForKey:@"view"];
//            [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
            
        }];
        
        
    }
}
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    [UIApplication sharedApplication].statusBarStyle =UIStatusBarStyleDefault;
//}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    image=[info objectForKey:UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    if ([leixingphoto isEqualToString:@"1"]){
        [dianpuzhutu setImage:image forState:UIControlStateNormal];
        image1=image;
        [photoDictionary setObject:image forKey:@"mainImage"];
        
    }else if ([leixingphoto isEqualToString:@"2"]){
        [yingyezhizhao setImage:image forState:UIControlStateNormal];
        image3=image;
        [photoDictionary setObject:image forKey:@"blImg"];
        
    }else if ([leixingphoto isEqualToString:@"3"]){
//        [yinhangkaihuxuke setImage:image forState:UIControlStateNormal];
//        image2=image;
//        [photoDictionary setObject:image forKey:@"bankImage"];
    
        
    }else if ([leixingphoto isEqualToString:@"4"]){
        [dianzhushenfenzheng setImage:image forState:UIControlStateNormal];
        image4=image;
        [photoDictionary setObject:image forKey:@"idCardFront"];
        
    }else if ([leixingphoto isEqualToString:@"5"]){
        [dianzhufan setImage:image forState:UIControlStateNormal];
        image5=image;
        [photoDictionary setObject:image forKey:@"idCardOpposite"];
        
    }else if ([leixingphoto isEqualToString:@"6"]){
        
       // [qita setImage:image forState:UIControlStateNormal];
        otherimage=@"2";
        
        UIImageView *imageother=[[UIImageView alloc] initWithImage:image];
         makeView12.contentSize=CGSizeMake(kScreenSize.width+i*100, 90);
        imageother.frame=CGRectMake(i*100, 0, 90, 90);
        [makeView12 addSubview:imageother];
        qita.frame=CGRectMake((i+1)*100, 0, 90, 90);
        [photoArray addObject:image];
        
        
        qitaShanChu=[UIButton buttonWithType:UIButtonTypeCustom];
        qitaShanChu.frame=CGRectMake(i*100+100-30, 2, 19, 19);
        qitaShanChu.tag=i;
        [qitaShanChu addTarget:self action:@selector(shangChuImage:) forControlEvents:UIControlEventTouchUpInside];
        [qitaShanChu setBackgroundImage:[UIImage imageNamed:@"Ellipse-2"] forState:UIControlStateNormal];
        [makeView12 addSubview:qitaShanChu];
        
        
       // makeView12.contentSize=CGSizeMake(ma.shi.frame.size.width, make.count *70);
       // [photoDictionary setObject:photoArray forKey:@"otherImage"];
        [photoImageViewArray addObject:imageother];
        [BtnImageViewArray addObject:qitaShanChu];
        i++;
        
    }
    
    
    
    
    
}
-(void)shangChuImage:(UIButton *)btn
{
   
    int j=0;
    for (UIButton *imageBtn in BtnImageViewArray) {
        [imageBtn removeFromSuperview];
    }
    for (UIImageView *imageViewother  in photoImageViewArray) {
        [imageViewother removeFromSuperview];
        //[qitaShanChu removeFromSuperview];
        //[photoImageViewArray addObject:imageother];
    }
     i--;
    [photoArray removeObjectAtIndex:btn.tag];
   // [photoImageViewArray  removeObjectAtIndex:btn.tag];
    [photoImageViewArray  removeObjectAtIndex:btn.tag];
     //[photoDictionary setObject:photoArray forKey:@"otherImage"];
    
    if(photoImageViewArray.count==0)
    {
         otherimage=@"0";
        qita.frame=CGRectMake( kScreenSize.width/2-45-kScreenSize.width/3, 0, 90, 90);
    }
    for (UIImageView *imageViewother  in photoImageViewArray) {
        //UIImageView *imageother=[[UIImageView alloc] initWithImage:image];
        makeView12.contentSize=CGSizeMake(kScreenSize.width+j*100, 90);
        imageViewother.frame=CGRectMake(j*100, 0, 90, 90);
        [makeView12 addSubview:imageViewother];
        qita.frame=CGRectMake((j+1)*100, 0, 90, 90);
        //[photoArray addObject:imageViewother.image];
        qitaShanChu=[UIButton buttonWithType:UIButtonTypeCustom];
        qitaShanChu.frame=CGRectMake(j*100+100-30, 2, 19, 19);
        qitaShanChu.tag=j;
        [qitaShanChu addTarget:self action:@selector(shangChuImage:) forControlEvents:UIControlEventTouchUpInside];
        [qitaShanChu setBackgroundImage:[UIImage imageNamed:@"Ellipse-2"] forState:UIControlStateNormal];
        [makeView12 addSubview:qitaShanChu];
        // makeView12.contentSize=CGSizeMake(ma.shi.frame.size.width, make.count *70);
        [BtnImageViewArray addObject:qitaShanChu];
        j++;
        //[photoImageViewArray addObject:imageother];
    }
    
}
-(void)downLoadFinish
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
