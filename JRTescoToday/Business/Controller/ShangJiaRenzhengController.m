//
//  ShangJiaRenzhengController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/31.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "ShangJiaRenzhengController.h"
#import "ShangJiaRenZhengView.h"
#import "HomeTabTableViewCell.h"
#import "shangchuan.h"
#import "ShenModel.h"
#import "fenleiRengZhengModel.h"
#import "BussUploadPicturesViewController.h"
#import "DaiLiShangModel.h"
@interface ShangJiaRenzhengController ()<UITableViewDataSource,UITableViewDelegate>
{
      HomeTabTableViewCell*_cell;
       UITableView *_mineTableView;
    UIButton *dianpuzhutu;
    UIButton*yinhangkaihuxuke;
    UIButton *dianzhushenfenzheng;
    UIButton*dianzhufan;
    UIButton*yingyezhizhao;
    UIButton *qita;
    ShangJiaRenZhengView *ma;
    NSString *leixingphoto;
    UIImage *image;
    UIImage *image1;
    UIImage *image2;
    UIImage *image3;
    UIImage *image4;
    UIImage *image5;
    UIImage *image6;
    UIImage *image7;
    NSMutableDictionary *photoDictionary;
     UIScrollView *makeView12;
     UIScrollView *makeView1;
     UIScrollView *makeView13;
      UIScrollView *makeView14;
      UIScrollView *makeView15;
     UIScrollView *makeView16;
    UIButton *shen;
    UIButton *shi;
    UIButton *qu;
    UIButton *fenlei;
    UIButton *fenlei1;
    NSString *makk;
     NSMutableArray *make;
      NSMutableArray *make1;
      NSMutableArray *make2;
    NSMutableArray *make3;
        NSMutableArray *make4;
    NSMutableArray *make5;
    NSString* cityaa;
     NSString* citya1a;
     NSString *makk1;
    NSString *makk12;
      NSString *makk14;
      NSString *makk15;
    NSString *makk16;
      NSString* citya1a2;
    NSString *nuid;
     NSString *nuidn;
     NSString *nuidnDAi;
     NSString *dailiName;
    NSString *otherimage;
    UITextView *shangjiaView;
    UIButton *daiLiShang;
    UIAlertView * alert1231;
}
@end

@implementation ShangJiaRenzhengController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];;
    [super viewDidLoad]; self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
     [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商家认证";
       makk=@"1";
    makk1=@"1";
    makk12=@"1";
     makk14=@"1";
     makk15=@"1";
    makk16=@"1";
    nuid=@"";
    nuidn=@"";
    nuidnDAi=@"";
    dailiName=@"";
    otherimage=@"0";
    //image6=[UIImage imageNamed:@""];
    make=[[NSMutableArray alloc] init];
    make1=[[NSMutableArray alloc] init];
    make2=[[NSMutableArray alloc] init];
    make3=[[NSMutableArray alloc] init];
    make4=[[NSMutableArray alloc] init];
    make5=[[NSMutableArray alloc] init];
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height+50) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    if(iPhone5)
    {
        _mineTableView.bounces=NO;
    }
    
    photoDictionary=[[NSMutableDictionary alloc] init];
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_mineTableView];
     ma=[[ShangJiaRenZhengView alloc] init];
     shangjiaView=[[UITextView alloc] init];
     shangjiaView.frame=CGRectMake(20, 40, kScreenSize.width-40, 90);
    if (iPhone5) {
       shangjiaView.frame=CGRectMake(20, 40, kScreenSize.width-40, 70);
    }
   
    shangjiaView.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
    ma.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
    [ma.view123 addSubview:shangjiaView];
   // ma.frame=CGRectMake(0, 0, kScreenSize.width-100, kScreenSize.height);
    _mineTableView.tableHeaderView=ma;
    fenlei1=  ma.leibie1;
     fenlei1.tag=2000;
    [ fenlei1 addTarget:self action:@selector(xuanzhe:) forControlEvents:UIControlEventTouchUpInside];

    cityaa=@"";
    citya1a=@"";
    citya1a2=@"";
    shen=  ma.shi;
    shen.tag=2001;
    [shen addTarget:self action:@selector(xuanzhe:) forControlEvents:UIControlEventTouchUpInside];

    shi=  ma.xian;
    shi.tag=2002;
    [shi addTarget:self action:@selector(xuanzhe:) forControlEvents:UIControlEventTouchUpInside];

    qu=  ma.qu;
    qu.tag=2003;
    [qu addTarget:self action:@selector(xuanzhe:) forControlEvents:UIControlEventTouchUpInside];

    fenlei=  ma.leibie;
    fenlei.tag=2004;
    [ fenlei addTarget:self action:@selector(xuanzhe:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *btnnn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if(iPhonex)
    {
        btnnn.frame=CGRectMake(0, kScreenSize.height-114-49, kScreenSize.width, 50);
    }else
    {
         btnnn.frame=CGRectMake(0, kScreenSize.height-114, kScreenSize.width, 50);
    }
   
    [btnnn setTitle:@"下一步" forState:UIControlStateNormal];
    btnnn.backgroundColor=[UIColor colorWithHexString:BunRed];
    [btnnn addTarget:self action:@selector(btnnn) forControlEvents:UIControlEventTouchUpInside];
    dianpuzhutu=  ma.dianpuzhutu;
   dianpuzhutu.tag=1000;
    [dianpuzhutu addTarget:self action:@selector(tupian:) forControlEvents:UIControlEventTouchUpInside];
    yinhangkaihuxuke=ma.yinhangkahuhang;
    yinhangkaihuxuke.tag=1001;
     [yinhangkaihuxuke addTarget:self action:@selector(tupian:) forControlEvents:UIControlEventTouchUpInside];
    yingyezhizhao=ma.yingyezhizhao;
    yingyezhizhao.tag=1002;
     [yingyezhizhao addTarget:self action:@selector(tupian:) forControlEvents:UIControlEventTouchUpInside];
    dianzhushenfenzheng=ma.shengfenzhengzhengmian;
    dianzhushenfenzheng.tag=1003;
     [dianzhushenfenzheng addTarget:self action:@selector(tupian:) forControlEvents:UIControlEventTouchUpInside];
    dianzhufan=ma.shengfengzhengbeimian;
    dianzhufan.tag=1004;
     [dianzhufan addTarget:self action:@selector(tupian:) forControlEvents:UIControlEventTouchUpInside];
    qita=ma.qitazhengjian;
    qita.tag=1005;
     [qita addTarget:self action:@selector(tupian:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnnn];
    
    //代理商选择
    daiLiShang=ma.daiLiShang;
    daiLiShang.tag=2005;
    [daiLiShang addTarget:self action:@selector(xuanzhe:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)tupian:(UIButton *)btn
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
-(void)xuanzhe:(UIButton *)btn
{
    if (btn.tag==2000)
    {
        [self downLoad123456];
    }else if(btn.tag==2001)
    {
        
        [self downLoad23];
        
    }else if(btn.tag==2002)
    {
        [self downLoad123];
    }else if(btn.tag==2003)
    {
       [self downLoad1234];
    }else if(btn.tag==2004)
    {
        [self downLoad12345];
        
    }else
    {
        [self downLoad234567];
    }
}
-(void)btnnn
{

    if ([ma.dainpuName.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"店铺名字不能为空"];
        return;
    }
    if ([ma.dianhua.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"电话不能为空"];
        return;
    }
    if ([ma.youxiang.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"邮箱不能为空"];
        return;
    }
    if ([shangjiaView.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"店铺介绍不能为空"];
        return;
    }
    if ([cityaa isEqualToString:@""]) {
        [MBProgressHUD showError:@"地址不能为空"];
        return;
    }
    if ([citya1a isEqualToString:@""]) {
        [MBProgressHUD showError:@"地址不能为空"];
        return;
    }
//    if ([citya1a2 isEqualToString:@""]) {
//        [MBProgressHUD showError:@"地址不能为空"];
//        return;
//    }
    if ([ma.xiangXiDizhi.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"地址不能为空"];
        return;
    }
    if ([nuidn isEqualToString:@""]) {
        [MBProgressHUD showError:@"分类不能为空"];
        return;
    }
    if ([dailiName isEqualToString:@""]) {
        [MBProgressHUD showError:@"代理人名字不能为空"];
        return;
    }
    
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                        @"name":ma.dainpuName.text,
                                                                                        @"phone":ma.dianhua.text,
                                                                                        @"category":nuidn,
                                                                                        @"email":ma.youxiang.text,
                                                                                        @"remarks":shangjiaView.text,
                                                                                        @"provinceName":cityaa,
                                                                                        @"cityName":citya1a,
                                                                                        @"countyName":citya1a2 ,
                                                                                        @"streetName":ma.xiangXiDizhi.text,
                                                                                        @"agentId":nuidnDAi,
                                                                                        @"agentName":dailiName,
                                                                                        }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@merchant/merchantIdent?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        
        NSLog(@"%@",dict);
        //5.回到主线程,进行更新页面
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([[NSString  stringWithFormat:@"%@",dict[@"code"]] isEqualToString:@"5000"])
            {
                BussUploadPicturesViewController *bussUpload=[[BussUploadPicturesViewController alloc] init];
                [self.navigationController pushViewController:bussUpload animated:YES];
               // [MBProgressHUD showError:@"提现完成"];
            }
            else
            {
                if(dict[@"msg"]){
                    alert1231 = [[UIAlertView alloc] initWithTitle:@"提示" message:dict[@"msg"] delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                    // 显示 UIAlertView
                    [alert1231 show];
                    // 添加延迟时间为 1.0 秒 然后执行 dismiss: 方法
                    [self performSelector:@selector(dismiss:) withObject:alert1231 afterDelay:2.0];
                }
               
            }
        });
        
        
        
        
        
        
    }];
    
    
   
      // [ma11 touxiangshangchaun:photoDictionary andName:ma.dainpuName.text andDescp:nil andPhone:ma.dianhua.text andCategory:nuidn andEmail:ma.youxiang.text andRemarks:shangjiaView.text andProvinceName:cityaa andCityName:citya1a andCountyName:citya1a2 andStreetName:ma.xiangXiDizhi.text andOther:otherimage];
}
- (void)dismiss:(UIAlertView *)alert{
    // 此处即相当于点击了 cancel 按钮
    [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
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
        
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
        
    }
}
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
        [yinhangkaihuxuke setImage:image forState:UIControlStateNormal];
         image2=image;
        [photoDictionary setObject:image forKey:@"bankImage"];
        
    }else if ([leixingphoto isEqualToString:@"3"]){
        [yingyezhizhao setImage:image forState:UIControlStateNormal];
         image3=image;
         [photoDictionary setObject:image forKey:@"blImg"];
        
    }else if ([leixingphoto isEqualToString:@"4"]){
        [dianzhushenfenzheng setImage:image forState:UIControlStateNormal];
         image4=image;
         [photoDictionary setObject:image forKey:@"idCardFront"];
        
    }else if ([leixingphoto isEqualToString:@"5"]){
        [dianzhufan setImage:image forState:UIControlStateNormal];
         image5=image;
         [photoDictionary setObject:image forKey:@"idCardOpposite"];
        
    }else if ([leixingphoto isEqualToString:@"6"]){
      
         [qita setImage:image forState:UIControlStateNormal];
        otherimage=@"2";
         [photoDictionary setObject:image forKey:@"otherImage"];
        
    }
    
    
    
    
    
}
-(void)btnnnaaaaaa:(UIButton *)btn
{
    makk=@"1";
    makk12=@"1";
    makk1=@"1";
    [ma.shi setTitle:make[btn.tag] forState:UIControlStateNormal];
    [ma.xian setTitle:@"选择市" forState:UIControlStateNormal];
    [ma.qu setTitle:@"选择区县" forState:UIControlStateNormal];
    cityaa=make[btn.tag];
    citya1a=@"";
    citya1a2=@"";
   
    [makeView12 removeFromSuperview];
    [makeView1 removeFromSuperview];
    [makeView13 removeFromSuperview];
    
}
-(void)btnnnaaaaaaDai:(UIButton *)btn
{
    DaiLiShangModel *ma23=[[DaiLiShangModel alloc] init];
    ma23=make5[btn.tag];
    [ma.daiLiShang setTitle:ma23.name forState:UIControlStateNormal];

    //cityaa=make5[btn.tag];
    nuidnDAi=ma23.idn;
    dailiName=ma23.name;
       makk16=@"1";
    [makeView15 removeFromSuperview];
  
    
}
#pragma mark 代理人列表
-(void)downLoad234567
{
    if ([cityaa isEqualToString:@""]) {
        [MBProgressHUD showError:@"请先选择省"];
        return;
    }
    if ([citya1a isEqualToString:@""]) {
        [MBProgressHUD showError:@"请先选择市"];
        return;
    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    @"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    @"province":cityaa,
                                                                                    @"city":citya1a,
                                                                                    @"county":citya1a2,
                                                                                    
                                                                                    }];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"merchant/agent" params:paramDic success:^(id data) {
        
        ;
        
        for (NSDictionary *dict in data) {
            DaiLiShangModel *ma23=[[DaiLiShangModel alloc] initWithDict:dict];
            [maqq addObject:ma23];
        }
        NSLog(@"nnn%@",data);
        [make5 removeAllObjects];
        [make5 addObjectsFromArray:maqq];
        if ([makk16 isEqualToString:@"1"]) {
            makeView15=[[UIScrollView alloc] init];
            makeView15.frame=CGRectMake(ma.daiLiShang.frame.origin.x, 150+ma.daiLiShang.frame.size.height+10, ma.daiLiShang.frame.size.width, make5.count *44);
            makeView15.contentSize=CGSizeMake(ma.daiLiShang.frame.size.width, make5.count *70);
            makeView15.backgroundColor=[UIColor whiteColor];
            [_mineTableView addSubview:makeView15];
            int  im=0;
            makk16=@"2";
            for (DaiLiShangModel *sre in make5) {
                
                
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 5+im*44, ma.shi.frame.size.width, 20);
                btnn.tag=im;
                //btnn.backgroundColor=[UIColor blackColor];
                btnn.titleLabel.font=[UIFont systemFontOfSize:12];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaaDai:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:sre.name forState:UIControlStateNormal];
                [makeView15 addSubview:btnn];
                im++;
                
                
            }
            
        }else
        {
            [make removeAllObjects];
            makk16=@"1";
            [makeView15 removeFromSuperview];
        }
        
        
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)downLoad23
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"]}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"system/showProvince" params:paramDic success:^(id data) {
        
       ;
        
        for (NSDictionary *dict in data) {
            ShenModel *ma23=[[ShenModel alloc] initWithDict:dict];
            [maqq addObject:ma23.shopName];
        }
        
        [make removeAllObjects];
        [make addObjectsFromArray:maqq];
        if ([makk isEqualToString:@"1"]) {
            makeView12=[[UIScrollView alloc] init];
            makeView12.frame=CGRectMake(ma.shi.frame.origin.x, ma.shi.frame.origin.y+ma.shi.frame.size.height+10, ma.shi.frame.size.width, make.count *44);
            makeView12.contentSize=CGSizeMake(ma.shi.frame.size.width, make.count *70);
            makeView12.backgroundColor=[UIColor whiteColor];
            [_mineTableView addSubview:makeView12];
            int  im=0;
            makk=@"2";
            for (NSString *sre in make) {
                
                
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 5+im*44, ma.shi.frame.size.width, 20);
                btnn.tag=im;
                //btnn.backgroundColor=[UIColor blackColor];
                btnn.titleLabel.font=[UIFont systemFontOfSize:15];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaa:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:sre forState:UIControlStateNormal];
                [makeView12 addSubview:btnn];
                im++;
                
                
            }
            
        }else
        {
             [make removeAllObjects];
            makk=@"1";
            [makeView12 removeFromSuperview];
        }
        
        

        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)downLoad123
{
    
    if ([cityaa isEqualToString:@""]) {
         [MBProgressHUD showError:@"请先选择省份"];
        return;
    }
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],@"provinceName":cityaa}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"system/showCityByProvinceName" params:paramDic success:^(id data) {
        
        ;
        
        for (NSDictionary *dict in data) {
            ShenModel *ma23=[[ShenModel alloc] initWithDict:dict];
            [maqq addObject:ma23.shopName];
        }
        
        [make1 removeAllObjects];
        [make1 addObjectsFromArray:maqq];
        if ([makk1 isEqualToString:@"1"]) {
            makeView1=[[UIScrollView alloc] init];
            makeView1.frame=CGRectMake(ma.xian.frame.origin.x, ma.xian.frame.origin.y+ma.xian.frame.size.height+10, ma.xian.frame.size.width, make1.count *44);
           makeView1.contentSize=CGSizeMake(ma.xian.frame.size.width, make1.count *70);
            makeView1.backgroundColor=[UIColor whiteColor];
            [_mineTableView addSubview:makeView1];
            int  im=0;
            makk1=@"2";
            for (NSString *sre in make1) {
                
                
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 5+im*44, ma.shi.frame.size.width, 20);
                btnn.tag=im;
                btnn.titleLabel.font=[UIFont systemFontOfSize:15];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaa12:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:sre forState:UIControlStateNormal];
                [makeView1 addSubview:btnn];
                im++;
                
                
            }
            
        }else
        {
             [make1 removeAllObjects];
            makk1=@"1";
            [makeView1 removeFromSuperview];
        }
        
        
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)btnnnaaaaaa12:(UIButton *)btn
{
    makk=@"1";
    makk12=@"1";
    makk1=@"1";
    [ma.xian setTitle:make1[btn.tag] forState:UIControlStateNormal];
    [ma.qu setTitle:@"选择区县" forState:UIControlStateNormal];
    citya1a=make1[btn.tag];
    [makeView12 removeFromSuperview];
    [makeView1 removeFromSuperview];
    [makeView13 removeFromSuperview];
    
}
-(void)downLoad1234
{
    
  
    if ([citya1a isEqualToString:@""]) {
        [MBProgressHUD showError:@"请先选择市"];
        return;
    }
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],@"cityName":citya1a}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"system/showCountyByCityName" params:paramDic success:^(id data) {
        
        ;
        
        for (NSDictionary *dict in data) {
            ShenModel *ma23=[[ShenModel alloc] initWithDict:dict];
            [maqq addObject:ma23.shopName];
        }
        
        [make2 removeAllObjects];
        [make2 addObjectsFromArray:maqq];
        if ([makk12 isEqualToString:@"1"]) {
            makeView13=[[UIScrollView alloc] init];
            makeView13.frame=CGRectMake(ma.qu.frame.origin.x, ma.qu.frame.origin.y+ma.qu.frame.size.height+10, ma.qu.frame.size.width, make2.count *44);
            makeView13.contentSize=CGSizeMake(ma.xian.frame.size.width, make2.count *70);
            makeView13.backgroundColor=[UIColor whiteColor];
            [_mineTableView addSubview:makeView13];
            int  im=0;
            makk12=@"2";
            for (NSString *sre in make2) {
                
                
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 5+im*44, ma.shi.frame.size.width, 20);
                btnn.tag=im;
                btnn.titleLabel.font=[UIFont systemFontOfSize:15];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaa123:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:sre forState:UIControlStateNormal];
                [makeView13 addSubview:btnn];
                im++;
                
                
            }
            
        }else
        {
             [make2 removeAllObjects];
            makk12=@"1";
            [makeView13 removeFromSuperview];
        }
        
        
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)btnnnaaaaaa123:(UIButton *)btn
{
    makk=@"1";
    makk12=@"1";
    makk1=@"1";
    [ma.qu setTitle:make2[btn.tag] forState:UIControlStateNormal];
    citya1a2=make2[btn.tag];
    [makeView12 removeFromSuperview];
     [makeView1 removeFromSuperview];
     [makeView13 removeFromSuperview];
}


-(void)downLoad12345
{
    
    
   
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"merchant/findAllOnelevelCategory" params:paramDic success:^(id data) {
        
        ;
        
        for (NSDictionary *dict in data) {
            fenleiRengZhengModel *ma23=[[fenleiRengZhengModel alloc] initWithDict:dict];
            [maqq addObject:ma23];
        }
        
        [make3 removeAllObjects];
        [make3 addObjectsFromArray:maqq];
        if ([makk14 isEqualToString:@"1"]) {
            makeView14=[[UIScrollView alloc] init];
            makeView14.frame=CGRectMake(ma.leibie.frame.origin.x, ma.hearView.frame.size.height+10+  ma.leibie.frame.origin.y+ma.leibie.frame.size.height+10, ma.leibie.frame.size.width,  make3.count *44);
            makeView14.contentSize=CGSizeMake(ma.leibie.frame.size.width, make3.count *70);
            makeView14.backgroundColor=[UIColor whiteColor];
            [_mineTableView addSubview:makeView14];
            int  im=0;
            makk14=@"2";
            for (fenleiRengZhengModel *sre in make3) {
                
                
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 5+im*44, ma.leibie.frame.size.width, 20);
                btnn.tag=im;
                btnn.titleLabel.font=[UIFont systemFontOfSize:15];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaa1234:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:sre.shopName forState:UIControlStateNormal];
                [makeView14 addSubview:btnn];
                im++;
                
                
            }
            
        }else
        {
            [make3 removeAllObjects];
            makk14=@"1";
            [makeView14 removeFromSuperview];
        }
        
        
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)btnnnaaaaaa1234:(UIButton *)btn
{
      fenleiRengZhengModel *ma23=[[fenleiRengZhengModel alloc] init];
    ma23=make3[btn.tag];
    makk15=@"1";
    [makeView15 removeFromSuperview];
    [ma.leibie setTitle:ma23.shopName forState:UIControlStateNormal];
    [ma.leibie1 setTitle:@"选择分类" forState:UIControlStateNormal];
    makk14=@"1";
    nuid=ma23.shopid;
    [makeView14 removeFromSuperview];
}
-(void)downLoad123456
{
    
    
    if ([nuid isEqualToString:@""]) {
        [MBProgressHUD showError:@"请选择上级分类"];
        return;
    }
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],@"parentId":nuid}];
    ;
    //NSString *srrrr=@"";
    NSMutableArray *maqq=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"merchant/findAllNextlevelCategory" params:paramDic success:^(id data) {
        
        ;
        
        for (NSDictionary *dict in data) {
            fenleiRengZhengModel *ma23=[[fenleiRengZhengModel alloc] initWithDict:dict];
            [maqq addObject:ma23];
        }
        
        [make4 removeAllObjects];
        [make4 addObjectsFromArray:maqq];
        if ([makk15 isEqualToString:@"1"]) {
            makeView15=[[UIScrollView alloc] init];
            makeView15.frame=CGRectMake(ma.leibie1.frame.origin.x, ma.hearView.frame.size.height+10+  ma.leibie.frame.origin.y+ma.leibie.frame.size.height+10, ma.leibie1.frame.size.width, make4.count *44);
            makeView15.contentSize=CGSizeMake(ma.leibie1.frame.size.width, make4.count *70);
            makeView15.backgroundColor=[UIColor whiteColor];
            [_mineTableView addSubview:makeView15];
            int  im=0;
            makk15=@"2";
            for (fenleiRengZhengModel *sre in make4) {
                
                
                UIButton *btnn=[UIButton buttonWithType:UIButtonTypeCustom];
                btnn.frame=CGRectMake(0, 5+im*44, ma.leibie1.frame.size.width, 20);
                btnn.tag=im;
                btnn.titleLabel.font=[UIFont systemFontOfSize:15];
                [btnn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btnn addTarget:self action:@selector(btnnnaaaaaa12345:) forControlEvents:UIControlEventTouchUpInside];
                [btnn setTitle:sre.shopName forState:UIControlStateNormal];
                [makeView15 addSubview:btnn];
                im++;
                
                
            }
            
        }else
        {
            [make4 removeAllObjects];
            makk15=@"1";
            [makeView15 removeFromSuperview];
        }
        
        
        
        
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
-(void)btnnnaaaaaa12345:(UIButton *)btn
{
    fenleiRengZhengModel *ma23=[[fenleiRengZhengModel alloc] init];
    ma23=make4[btn.tag];
    makk15=@"1";
    [makeView15 removeFromSuperview];
    [ma.leibie1 setTitle:ma23.shopName forState:UIControlStateNormal];
    makk14=@"1";
    nuidn=ma23.shopid;
    [makeView14 removeFromSuperview];
}
@end
