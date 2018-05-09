//
//  checkTheVolumeSizeViewController.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/30.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//查看卷码支付

#import "checkTheVolumeSizeViewController.h"
#import "SGQRCodeGenerateManager.h"
#import "JROrderDetailViewController.h"
#import "JRBusinessOrderCore.h"
@interface checkTheVolumeSizeViewController (){
    
    dispatch_source_t _timer;
    
}
/*
 *标题
 */
@property(strong,nonatomic)UILabel *titleLabel;
/*
 *有效日期
 */
@property(strong,nonatomic)UILabel *timeLabel;
/*
 *查看订单详情
 */
@property(strong,nonatomic)UIButton *seeTheOrderDetailsButton;


/*
 *文本 卷码
 */
@property(strong,nonatomic)UILabel* volumeSizeTextLabel;
/*
 *订单状态 未消费
 */
@property(strong,nonatomic)UILabel *ordersNotConsumptionLabel;

/*
 *卷码编码
 */
@property(strong,nonatomic)UILabel *volumeSizeNumberLabel;
/*
 *请让店家扫描二维码  文本
 */
@property(strong,nonatomic)UILabel *QrCodeTextLabel;
/*
 *二维码图片
 */
@property(strong,nonatomic)UIImageView *QrCodeImageView;

/*
 *第一个虚线
 */
@property(strong,nonatomic)UIImageView *oneDashImageView;
/*
 *第二个虚线
 */
@property(strong,nonatomic)UIImageView *towDashImageView;
/*
 *背景View
 */
@property(strong,nonatomic)UIView *bgView;
@end

@implementation checkTheVolumeSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"查看劵码";
    self.view.userInteractionEnabled=YES;
    self.view.backgroundColor=[UIColor colorWithRed:241/255.f green:249/255.f blue:242/255.f alpha:1.f];
    [self.view addSubview:self.bgView];
    self.bgView.userInteractionEnabled=YES;
    CGFloat topY=10;
    if (ScreenH==812) {
        topY=34;
    }
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(topY);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@500);
    }];
    
    [self.view addSubview:self.titleLabel];
    self.titleLabel.userInteractionEnabled=YES;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(10);
        make.top.equalTo(self.bgView.mas_top).offset(10);
        make.right.equalTo(self.bgView.mas_right).offset(-10);
        make.height.equalTo(@16);


    }];
    [self.view addSubview:self.timeLabel];
    self.timeLabel.userInteractionEnabled=YES;
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.height.equalTo(@14);
    }];
    self.view.userInteractionEnabled=YES;

    [self.view addSubview:self.oneDashImageView];
    [self.oneDashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(15);
        make.right.left.equalTo(self.titleLabel);
        make.height.equalTo(@0.5);
    }];
    [self drawDashLine:self.oneDashImageView lineLength:4 lineSpacing:1 lineColor:[UIColor lightGrayColor]];



    [self.view addSubview:self.volumeSizeTextLabel];
    [self.volumeSizeTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left).offset(0);
        make.top.equalTo(self.oneDashImageView.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(100, 16));
    }];
    [self.view addSubview:self.ordersNotConsumptionLabel];
    [self.ordersNotConsumptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.volumeSizeTextLabel.mas_top);
        make.right.equalTo(self.titleLabel.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 16));
    }];

    [self.view addSubview:self.volumeSizeNumberLabel];
    [self.volumeSizeNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.volumeSizeTextLabel.mas_top).offset(30);
        make.centerX.equalTo(self.view.mas_centerX);
        make.left.right.equalTo(self.titleLabel);
    }];

    [self.view addSubview:self.towDashImageView];

    [self.towDashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.volumeSizeNumberLabel.mas_bottom).offset(30);
        make.right.left.equalTo(self.titleLabel);
        make.height.equalTo(@0.5);
    }];
       [self drawDashLine:self.towDashImageView lineLength:4 lineSpacing:1 lineColor:[UIColor lightGrayColor]];

//   self.towDashImageView.image=[UIImage imageWithCIImage:[self drawLineOfDashByImageView:self.towDashImageView]];
    [self.view addSubview:self.QrCodeTextLabel];
    [self.QrCodeTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.towDashImageView.mas_bottom).offset(15);
        make.height.equalTo(@15);
    }];
    [self.view addSubview:self.QrCodeImageView];
    [self.QrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.QrCodeTextLabel.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(180, 180));
    }];
    [self.view addSubview:self.seeTheOrderDetailsButton];
    [self.seeTheOrderDetailsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.top.equalTo(self.bgView.mas_top);
        make.bottom.equalTo(self.oneDashImageView.mas_bottom);
    }];
    
   
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_timer) {
        [self stopTimer];
    }
    
    
}
-(void)setOrderStaute:(NSString *)orderStaute{
    _orderStaute=orderStaute;
    
    
}
- (void)stopTimer
{
    
    
    dispatch_source_cancel(_timer);
    _timer = nil; // OK
//    [_sendValidateBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
//    _sendValidateBtn.userInteractionEnabled = YES;
//    timeout=60;
    [FNUserDefaults setObject:@"2" forKey:@"yanzengma"];
    if (IOS_7) {
//        _sendValidateBtn.enabled = YES;
    }
}
#pragma mark 倒计时
- (void)startTime
{
    //    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),2.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        [self updateOrderStatus];
            });
    dispatch_resume(_timer);
}
-(void)setGoodsID:(NSString *)goodsID{
    _goodsID=goodsID;
     [self startTime];
    
}
-(void)updateOrderStatus{
    
    [JRBusinessOrderCore queryBusineesOrderDetailWithID:self.goodsID Successed:^(NSDictionary *data) {
    _orderStaute=[NSString stringWithFormat:@"%@",data[@"status"]];
        if ([_orderStaute isEqualToString:@"1"]) {
                  _ordersNotConsumptionLabel.text=@"未消费";
        }else{
            
                  _ordersNotConsumptionLabel.text=@"已消费";
            
        }
    } Faild:^(NSString *erro) {
        
    }];
    
    
}

-(UIImageView *)towDashImageView{
    
    if (!_towDashImageView) {
        _towDashImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenW-40, 1)];
//        _towDashImageView.backgroundColor=[UIColor colorWithRed:152/255.f green:152/255.f blue:152/255.f alpha:1.f];
      
        
    }
    return _towDashImageView;
}
-(UIImageView *)QrCodeImageView{
    if (!_QrCodeImageView) {
        _QrCodeImageView =[[UIImageView alloc]init];
        _QrCodeImageView.backgroundColor=[UIColor yellowColor];
    }
    
    return _QrCodeImageView;
}

-(UILabel *)QrCodeTextLabel{
    if (!_QrCodeTextLabel) {
        _QrCodeTextLabel =[[UILabel alloc]init];
        _QrCodeTextLabel.textAlignment=NSTextAlignmentCenter;
        _QrCodeTextLabel.text=@"请让店家扫描二维码";
        _QrCodeTextLabel.font=[UIFont systemFontOfSize:15 weight:UIFontWeightThin];
        
    }
    
    return _QrCodeTextLabel;
}
-(UILabel *)volumeSizeNumberLabel{
    if (!_volumeSizeNumberLabel) {
        _volumeSizeNumberLabel =[[UILabel alloc]init];
        
        _volumeSizeNumberLabel.font=[UIFont systemFontOfSize:28 weight:UIFontWeightBold];
        _volumeSizeNumberLabel.text=@"1234 4567 9011"; _volumeSizeNumberLabel.textAlignment=NSTextAlignmentCenter;
        _volumeSizeNumberLabel.textColor=[UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1.f];
        
        
        
        
    }
    
    return _volumeSizeNumberLabel;
}


-(UILabel *)ordersNotConsumptionLabel{
    if (!_ordersNotConsumptionLabel) {
        _ordersNotConsumptionLabel =[[UILabel alloc]init];
        _ordersNotConsumptionLabel .font=[UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        _ordersNotConsumptionLabel.textAlignment=NSTextAlignmentRight;
        _ordersNotConsumptionLabel.text=@"未消费";
        
        _ordersNotConsumptionLabel.textColor=[UIColor redColor];
        
        
    }
    return _ordersNotConsumptionLabel;
}


-(UILabel *)volumeSizeTextLabel{
    if (!_volumeSizeTextLabel) {
        _volumeSizeTextLabel =[[UILabel alloc]init];
        _volumeSizeTextLabel.font=[UIFont systemFontOfSize:16 weight:UIFontWeightBold];
        _volumeSizeTextLabel.text=@"劵码";
        
        
    }
    
    return _volumeSizeTextLabel;
}
-(UIImageView *)oneDashImageView{
    
    if (!_oneDashImageView) {
        _oneDashImageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenW-40, 1)];
    }
    return _oneDashImageView;
}
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel =[[UILabel alloc]init];
        _timeLabel.font =[UIFont systemFontOfSize:14];
       _timeLabel.textColor=[UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1.f];
        _timeLabel.text=@"有效期至2018-04-28 23：59：59";
    }
    
    return _timeLabel;
}
-(UIButton *)seeTheOrderDetailsButton{
    if (!_seeTheOrderDetailsButton) {
        _seeTheOrderDetailsButton =[[UIButton alloc]init];
//        _seeTheOrderDetailsButton.backgroundColor=[UIColor yellowColor];
        [_seeTheOrderDetailsButton addTarget:self action:@selector(seeTheOrderDetails) forControlEvents:UIControlEventTouchUpInside];
        [_seeTheOrderDetailsButton setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        _seeTheOrderDetailsButton.imageEdgeInsets=UIEdgeInsetsMake(0, ScreenW-50, 0, 0);
    }
    
    return _seeTheOrderDetailsButton;
    
}
-(void)seeTheOrderDetails{
    
    JROrderDetailViewController *VC = [[JROrderDetailViewController alloc] init];
//    JRBusinessOrderModel *model = self.dataArray[indexPath.row];
    VC.goodID = self.goodsID;
    [self.navigationController pushViewController:VC animated:YES];
    
    
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc]init];
        _titleLabel.font=[UIFont systemFontOfSize:16 weight:UIFontWeightBold];
//        _titleLabel.textColor=[UIColor blackColor];
        _titleLabel.text=@"皇家鸡排";
        
    }
    
    return _titleLabel;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView =[[UIView  alloc]init];
        _bgView.backgroundColor =[UIColor whiteColor];
    }
    
    return _bgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}
-(void)setNameString:(NSString *)nameString{
    _nameString=nameString;
    self.titleLabel.text=nameString;
    
    
}

-(void)setTimeString:(NSString *)timeString{
    _timeString=timeString;
    self.timeLabel.text=[NSString stringWithFormat:@"有效期至 %@",timeString];
    
    
}
-(void)setUseCodeString:(NSString *)useCodeString{
    _useCodeString=useCodeString;
    [self setupGenerate_Icon_QRCode];
    
}
-(void)setCodeNoString:(NSString *)codeNoString{
    _codeNoString =codeNoString;

    NSMutableArray *numberArr = [NSMutableArray array];
    int length = codeNoString.length % 4 == 0 ? (int)(codeNoString.length / 4) : (int)(codeNoString.length / 4 + 1);
    for (int i = 0; i < length; i++) {
        int begin = i * 4;
        int end = (i * 4 + 4) > (int) codeNoString.length ? (int)(codeNoString.length) : (i * 4 + 4);
        NSString *subString = [codeNoString substringWithRange:NSMakeRange(begin, end - begin)];
        [numberArr addObject:subString];
//        NSLog(@”%d ======= %d ====== %@”,begin,end,subString);
    }
    NSString *cardnbr = @"";
    for (int i = 0; i < length; i++) {
        cardnbr = [cardnbr stringByAppendingFormat:@"%@", [NSString stringWithFormat:@"%@  ",numberArr[i]]];
    }

    
    
    self.volumeSizeNumberLabel.text=cardnbr;
    
}
#pragma mark - - - 中间带有图标二维码生成
- (void)setupGenerate_Icon_QRCode {
    
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 0.60*kScreenSize.width;
    CGFloat imageViewH = 0.60*kScreenSize.width;
    CGFloat imageViewX =50;
    CGFloat imageViewY = 20;
    if (iPhone5) {
        
        imageViewW = 0.68*kScreenSize.width;
        imageViewH = 0.68*kScreenSize.width;
        imageViewX =20;
        imageViewY = 20;
    }
    if (iPhone6) {
        
        imageViewW = 0.68*kScreenSize.width;
        imageViewH = 0.68*kScreenSize.width;
        imageViewX =30;
        imageViewY = 10;
    }

    self.QrCodeImageView.layer.cornerRadius=5;
        [self.view addSubview:imageView];
//    imageView.center=self.QrCodeImageView.center;
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(imageViewW, imageViewH));
         make.top.equalTo(self.QrCodeTextLabel.mas_bottom).offset(20);
        
        
        
        
    }];

    
    CGFloat scale = 0.2;
    
    // 2、将最终合得的图片显示在UIImageView上
    imageView.image = [SGQRCodeGenerateManager SG_generateWithLogoQRCodeData:_useCodeString logoImageName:@"AppIcon20x20" logoScaleToSuperView:scale];
    
}
-(void)setTheOrderNumberString:(NSString *)theOrderNumberString{
    

    _theOrderNumberString=theOrderNumberString;
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
