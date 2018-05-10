//
//  BianJiShangpinController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "BianJiShangpinController.h"
#import "AddShangoinView.h"
#import "AddShangPinController.h"
#import "AddShangPinTableViewCell.h"
#import "AddFootView.h"
#import "XiaoXiView.h"
#import "shurkuang.h"
#import "Masonry.h"
#import "FenleiModel.h"
#import "UIImageView+WebCache.h"
#import "XWInteractiveTransition.h"
#import "XWPresentOneTransition.h"
@interface BianJiShangpinController ()<UITableViewDataSource,UITableViewDelegate,XWPresentedOneControllerDelegate>
{
    UITableView *_mineTableView;
    AddShangPinTableViewCell*_cell;
    AddShangoinView *footView;
    AddFootView*iqq;
    NSMutableArray *_arrayid;
    NSInteger num;
    NSInteger rowNum;
    UIButton *AddNewBtn;
    UIButton *addFenLeibtn;
    UIButton *addQuXiao;
    UIButton *addFenLeibtn1;
    UIButton *addQuXiao1;
    
    NSInteger stringhh;
    UIButton*tupian;
    UIImage *image;
    int j;
    int i;
    UIView *makeView;
     UIView *makeView12;
    shurkuang *na;
    NSString *idnn;
    NSString *name32;
    UIImageView *im;
    UIButton *QuXiao;
}
@property (weak, nonatomic) IBOutlet UIButton *tupainBtn;
@property (nonatomic, strong) XWInteractiveTransition *interactivePush;
@end

@implementation BianJiShangpinController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = NO;
    idnn=@"";
    
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    
    
    if ([_bianji isEqualToString:@"编辑"]) {
        self.title=@"编辑商品";
        _name.text=_mingcheng;
        _miaoshu.text=_miaoshu123;
        _jiage.text=_danjia;
        _guige.text=_guie1;
        idnn=_categoryId;
        _shuiguo.text=_fengleiName;
       // im=[[UIImageView alloc] init];
       [_imagewwww sd_setImageWithURL:[NSURL URLWithString:_imagecc] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish) name:@"maketou12" object:nil];
        [_imagewwww sd_setImageWithURL:[NSURL URLWithString:_imagecc] placeholderImage:nil options:SDWebImageProgressiveDownload];
        //[_tupainBtn setImage:im.image forState:UIControlStateNormal];
        image=_imagewwww.image;
       // [self.view addSubview:im];
    }
    else{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadFinish1) name:@"maketou123" object:nil];
        self.title=@"添加新商品";
    }
    [_addFenlei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        //make.top.mas_equalTo(imageView.mas_bottom).offset(30);
    }];
    _interactivePush = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypePresent GestureDirection:XWInteractiveTransitionGestureDirectionUp];
    typeof(self)weakSelf = self;
    _interactivePush.presentConifg = ^(){
        [weakSelf LeiBie:nil];
    };
    // Do any additional setup after loading the view from its nib.
}
-(void)downLoadFinish
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)downLoadFinish1
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)LeiBie:(id)sender {
    AddShangPinController *presentedVC = [AddShangPinController new];
     presentedVC.delegate = self;
    presentedVC.bianji=@"编辑";
    if ([_bianji isEqualToString:@"编辑"]) {
    presentedVC.idnnn=_categoryId;
    presentedVC.name=_fengleiName;
    }
    [self presentViewController:presentedVC animated:YES completion:nil];

}
-(void)FenLeiName:(NSString *)fenleiname andFenLeiId:(NSString *)fenleiid
{
    idnn=fenleiid;
    _shuiguo.text=fenleiname;
}
-(void)btnnnnnnnnnnn
{
    [_mineTableView removeFromSuperview];
    [iqq removeFromSuperview];
    [makeView12 removeFromSuperview];
}
#pragma mark
-(void)makeUI
{
    AddNewBtn =iqq.Add;
    AddNewBtn.tag=1000;
    [AddNewBtn addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    addFenLeibtn1 =iqq.queding;
    addFenLeibtn1.tag=1001;
    [addFenLeibtn1 addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    addQuXiao1 =iqq.quxaio;
    
    addQuXiao1.tag=1002;
   
    [addQuXiao1 addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    
    [AddNewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        //make.top.mas_equalTo(imageView.mas_bottom).offset(30);
    }];
    _interactivePush = [XWInteractiveTransition interactiveTransitionWithTransitionType:XWInteractiveTransitionTypePresent GestureDirection:XWInteractiveTransitionGestureDirectionUp];
    typeof(self)weakSelf = self;
    _interactivePush.presentConifg = ^(){
        [weakSelf present];
    };
    
}
- (void)present{
    AddShangPinController *presentedVC = [AddShangPinController new];
   // presentedVC.delegate = self;
    [self presentViewController:presentedVC animated:YES completion:nil];
}

- (void)presentedOneControllerPressedDissmiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent{
    return _interactivePush;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"AddShangPinTableViewCell" owner:self options:nil] lastObject];
    }
    _cell.tu.image=[UIImage imageNamed:@"icon_select1234"];
    FenleiModel *na12=[[FenleiModel alloc] init];
    na12=_arrayid[indexPath.row];
    if (stringhh==indexPath.row) {
        num=indexPath.row;
        idnn=na12.idn;
        name32=na12.name;
        _cell.tu.image=[UIImage imageNamed:@"btn_selected"];
    }
    
//    if ([_arrayid[indexPath.row] isEqualToString:@"1"]) {
//        num=indexPath.row;
//        _cell.tu.image=[UIImage imageNamed:@"btn_selected"];
//        
//    }
    FenleiModel *fen=[[FenleiModel alloc] init];
    fen=_arrayid[indexPath.row];
    _cell.name.text=fen.name;
    NSLog(@"%@",_arrayid);
    
    
    _cell.selectionStyle = UITableViewCellAccessoryNone;
    return _cell;
}
// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
    
}
#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayid.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FenleiModel *na12=[[FenleiModel alloc] init];
    na12=_arrayid[indexPath.row];
    stringhh =indexPath.row;
    idnn=na12.idn;
    name32=na12.name;
   // [_mineTableView removeFromSuperview];
    
//    if ([_arrayid[indexPath.row] isEqualToString:@"1"]) {
//        [_arrayid replaceObjectAtIndex:indexPath.row withObject:@"0"];
//    }
//    else{
//        [_arrayid replaceObjectAtIndex:indexPath.row withObject:@"1"];
//    }
  
    
    
    
    [_mineTableView reloadData];
}
-(void)AddBtn:(UIButton *)btn
{
    if (btn.tag==1000) {
        makeView =[[UIView alloc] init];
        makeView.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
        makeView.backgroundColor=[UIColor blackColor];
        makeView.alpha=0.3;
        [self.view addSubview:makeView];
        
        na=[[shurkuang alloc] init];
     na . layer.cornerRadius=10;
             na.viewww . layer.cornerRadius=10;
        na.backgroundColor=[UIColor whiteColor];
        addQuXiao=na.quxiao;
         [addQuXiao addTarget:self action:@selector(btnnn:) forControlEvents:UIControlEventTouchUpInside];
        addQuXiao.tag=1002;
        [addQuXiao addTarget:self action:@selector(btnnn:) forControlEvents:UIControlEventTouchUpInside];
        
        addFenLeibtn=na.Queding;
        addFenLeibtn.tag=1001;
        [addFenLeibtn addTarget:self action:@selector(btnnn:) forControlEvents:UIControlEventTouchUpInside];
        na.frame=CGRectMake(30, kScreenSize.height/2-175, kScreenSize.width-60, 166);
        [self.view addSubview:na];
    }
    else if(btn.tag==1001)
    {
        _shuiguo.text=name32;
        [_mineTableView removeFromSuperview];
        [makeView12 removeFromSuperview];
        [iqq removeFromSuperview];
    }else
    {
        [_mineTableView removeFromSuperview];
        [iqq removeFromSuperview];
        [makeView12 removeFromSuperview];
    }
    
    
   
}
-(void)btnnn:(UIButton *)btn
{
    if (btn.tag==1001)
    {
        [self downLoad1];
        [makeView removeFromSuperview];
        [na removeFromSuperview];
    }else
    {
        [makeView removeFromSuperview];
        [na removeFromSuperview];
    }
}
-(void)downLoad
{

    [_arrayid addObject:@"0"];
    rowNum++;
    
    [_mineTableView removeFromSuperview];
    [iqq removeFromSuperview];
    
    _mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, kScreenSize.height/3, kScreenSize.width, kScreenSize.height/4*3-219-64) style:UITableViewStylePlain];
    _mineTableView.delegate=self;
    _mineTableView.dataSource=self;
    _mineTableView.backgroundColor=[UIColor  colorWithHexString:@"#f6f6f6"];
    _mineTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_mineTableView];
    iqq=[[AddFootView alloc] init];
    iqq.frame=CGRectMake(0, kScreenSize.height-219, kScreenSize.width, 219);
    [self.view  addSubview:iqq];AddNewBtn =iqq.Add;
    [AddNewBtn addTarget:self action:@selector(AddBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [_mineTableView reloadData];

}
- (IBAction)tianjai:(id)sender {
    
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
         imagePickerController.navigationBar.tintColor = [UIColor redColor];
        [self presentViewController:imagePickerController animated:YES completion:^{}];
        
        
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    image=[info objectForKey:UIImagePickerControllerOriginalImage];
    j=1;
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    
    [_tupainBtn setImage:image forState:UIControlStateNormal];
    
  
    
    
    
    
}

-(void)downLoad1
{

    if ([na.leiBieText.text isEqualToString:@""]) {
         [MBProgressHUD showError:@"分类名不能为空"];
        return;
    }
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                  @"name":na.leiBieText.text,
                                                                                   }];
    
    
    // uid
    [FNUserDefaults objectForKey:@"MD5Pwd"];
    
    
    
    NSDictionary *headers = @{ @"content-Type": @"application/json",
                               };
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:paramDic options:0 error:nil];
    NSString *urlstring=[NSString  stringWithFormat:@"%@goods/createMerchant?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];
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
                [MBProgressHUD showError:@"添加成功"];
                [_arrayid removeAllObjects];
                [self downLoad2];
            }
            else
            {
                   [MBProgressHUD showError:dict[@"msg"]];
            }
        });
        
        
        
        
        
        
    }];
    

}
-(void)downLoad2
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                    
                                                                                    
                                                                                    }];
    NSMutableArray *marray=[[NSMutableArray alloc] init];
    [HttpTool getWithBaseURL:kBaseURL  path:@"goods/findCategory" params:paramDic success:^(id data) {
        
        for (NSDictionary *dict in data) {
            FenleiModel *fen=[[FenleiModel alloc] initWithDict:dict];
            [marray addObject:fen];
        }
      
        
                [_arrayid addObjectsFromArray:marray];
        if (_arrayid.count==0) {
            _mineTableView.backgroundColor=[UIColor  whiteColor];
            _mineTableView.alpha=0.5;
            
        }
         [_mineTableView reloadData];
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}
- (IBAction)fabu:(id)sender {
    
    
    if ([_name.text isEqualToString:@""]) {
         [MBProgressHUD showError:@"名称不能为空"];
        return;
    }
    if ([_miaoshu.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"描述不能为空"];
        return;
    }
    if ([_jiage.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"价格不能为空"];
        return;
    }
    if ([_guige.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"规格不能为空"];
        return;
    }
    if ([_fengleiName isEqualToString:@""]) {
        [MBProgressHUD showError:@"分类不能为空"];
        return;
    }
    if (!image) {
        [MBProgressHUD showError:@"图片不能为空"];
        return;
    }
    XiaoXiView *str =[[XiaoXiView alloc] init];
     [YYAnimationIndicator loadAnimationWithController:self setLoadText:@"正在提交..."];
    
    if (![_bianji isEqualToString:@"编辑"]) {
      [str touxiangshangchaun:image andName:_name.text andDescp:_miaoshu.text andGoodsPrice:_jiage.text andStandard:_guige.text andGoodsCategoryId:@"bdefae1f-a1e3-11e7-8afd-1051721c39fe" andstr:@"goods/addGoods" andID:@""];
         [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        NSLog(@"%@",_idn);
        [str touxiangshangchaun:image andName:_name.text andDescp:_miaoshu.text andGoodsPrice:_jiage.text andStandard:_guige.text andGoodsCategoryId:idnn andstr:@"goods/editGoods" andID:_idn];
       
    }
    // sleep(1);
      [YYAnimationIndicator stopAnimationWithLoadText:@"YES" withType:YES];
    [self.view addSubview:str];
   
}
#pragma mark 移除通知
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
