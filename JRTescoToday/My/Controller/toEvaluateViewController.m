//
//  toEvaluateViewController.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/3/29.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
// 去 评价

#import "toEvaluateViewController.h"
#import "UIImageView+WebCache.h"
static NSString *placeString=@"请填写您的评价:";
@interface toEvaluateViewController ()<UITextViewDelegate>

@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UIImageView *headIconImageView;// 图标
@property(nonatomic,strong)UILabel *titleLabel;// 标题
@property(nonatomic,strong)UILabel *thePriceLabel;// 价格
@property(nonatomic,strong)UIButton *releaseButton;// 提交
@property(nonatomic,strong)UITextView *evaluationContentTextView;// 评论
@property(nonatomic,strong)UIView *makeLineView;//分割线
@property(nonatomic,strong)UIView *starRatingView;//星级打分
@property(nonatomic,strong)NSMutableArray *allStar;//星级
@property(nonatomic,copy)NSString *starNumber;//星级评分
@property(nonatomic,strong)UILabel *scoreShowsLabel;//星级 操作说明
@property(nonatomic,strong)UILabel *inputSpaceConstraintsLabel;//可输入字数限制

@end

@implementation toEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.starNumber=@"0";
    self.view.backgroundColor=[UIColor colorWithRed:241/255.f green:239/255.f blue:242/255.f alpha:1.f];
    [self.view addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@245);
    }];
    self.headIconImageView.backgroundColor =[UIColor yellowColor];
    [self.headView addSubview:self.headIconImageView];
    [self.headIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView.mas_left).offset(10);
        make.top.equalTo(self.headView.mas_top).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [self.headView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIconImageView.mas_right).offset(10);
        make.right.equalTo(self.headView.mas_right).offset(10);
        make.top.equalTo(self.headIconImageView.mas_top).offset(0);
        make.height.equalTo(@16);
    }];
    [self.headView addSubview:self.thePriceLabel];
    [self.thePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.height.equalTo(@16);
        make.bottom.equalTo(self.headIconImageView.mas_bottom).offset(0);
    }];
    [self.headView addSubview:self.makeLineView];
    [self.makeLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIconImageView.mas_left);
        make.right.equalTo(self.titleLabel.mas_right);
        make.top.equalTo(self.headIconImageView.mas_bottom).offset(10);
        make.height.equalTo(@1);
        
    }];
    [self.headView addSubview:self.starRatingView];
    [self.starRatingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.makeLineView.mas_bottom).offset(30);
        make.width.equalTo(@160);
        make.height.equalTo(@40);
    }];
    [self.headView addSubview:self.scoreShowsLabel];
    [self.scoreShowsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.makeLineView);
        make.top.equalTo(self.starRatingView.mas_bottom).offset(20);
        make.height.equalTo(@15);
    }];
    [self.view addSubview:self.evaluationContentTextView];
    [self.evaluationContentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.headView.mas_bottom).offset(20);
        make.height.equalTo(@180);
    }];
    [self.view addSubview:self.inputSpaceConstraintsLabel];
    [self.inputSpaceConstraintsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.evaluationContentTextView.mas_bottom).offset(-10);
        make.right.equalTo(self.evaluationContentTextView.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 14));
    }];
//    self.inputSpaceConstraintsLabel.backgroundColor =[UIColor redColor];
    [self.view addSubview:self.releaseButton];
    [self.releaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.top.equalTo(self.evaluationContentTextView.mas_bottom).offset(30);
        make.height.equalTo(@50);
    }];
    // Do any additional setup after loading the view.
}
-(UIButton *)releaseButton{
    if (!_releaseButton) {
        _releaseButton=[[UIButton alloc]init];
        [_releaseButton setTitle:@"发布" forState:UIControlStateNormal];
        [_releaseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _releaseButton.backgroundColor=[UIColor colorWithRed:254/255.f green:201/255.f blue:47/255.f alpha:1.f];
        [_releaseButton addTarget:self action:@selector(releaseAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _releaseButton;
}
-(void)setIconURLString:(NSString *)iconURLString{

    [self.headIconImageView sd_setImageWithURL:[NSURL URLWithString:iconURLString]];

}
-(void)setTitleString:(NSString *)titleString{
    _titleString=titleString;
    self.titleLabel.text=titleString;
   
    
    
}
-(void)setOrderNo:(NSString *)OrderNo{
    
    
    _OrderNo=OrderNo;
}
-(void)setOrderAmountString:(NSString *)OrderAmountString{
    _OrderAmountString=OrderAmountString;
    self. thePriceLabel.text=[NSString stringWithFormat:@"¥ %@",OrderAmountString];
    
    
}
-(void)releaseAction{// 提交
    

    NSDictionary *dic=@{
                                @"grade":self.starNumber,
                @"info":self.evaluationContentTextView.text, @"orderNo":self.OrderNo
                                }
                    
;
    NSDictionary *headers = @{ @"content-Type": @"application/json"};

    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
//person/orders/comments
    NSString *urlstring=[NSString  stringWithFormat:@"%@person/orders/comments?access_token=%@",kBaseURL,[FNUserDefaults objectForKey:@"usersid"]];

    NSURL *url = [NSURL URLWithString:urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
    
    [request setHTTPBody:postData];
//    NSLog(@"%@", [request allHTTPHeaderFields]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError *err;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        NSString *codeStr=[NSString stringWithFormat:@"%@",dict[@"code"]];
        

        dispatch_async(dispatch_get_main_queue(), ^{
                  [MBProgressHUD showSuccess:[NSString stringWithFormat:@"%@",dict[@"msg"]]];
            
            if ([codeStr isEqualToString:@"5000"]) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (self.EvaluateBlock) {
                        self.EvaluateBlock();
                    }
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }
            
     
            
            
     
            
          
            
            
            
            
        });
        
            
        
        
    }];
    
    

    
    
    

    
    
    
    

    
    
    
}
-(UILabel *)inputSpaceConstraintsLabel{
    if (!_inputSpaceConstraintsLabel) {
        _inputSpaceConstraintsLabel =[[UILabel alloc]init];
        _inputSpaceConstraintsLabel.text=@"0/200";
        _inputSpaceConstraintsLabel.textColor=[UIColor colorWithRed:172/255.f green:172/255.f blue:172/255.f alpha:1.f];
        _inputSpaceConstraintsLabel.textAlignment=NSTextAlignmentRight;
       _inputSpaceConstraintsLabel.font = [UIFont systemFontOfSize:14.0];
    }
    
    return _inputSpaceConstraintsLabel;
}
-(UITextView *)evaluationContentTextView{
    if (!_evaluationContentTextView) {
        _evaluationContentTextView =[[UITextView alloc]init];
        //设置它的委托方法
         _evaluationContentTextView.delegate = self;
        
        //设置是否可以编辑
         _evaluationContentTextView.editable = YES;
        
      
        //设置文字对齐方式
         _evaluationContentTextView.textAlignment = NSTextAlignmentLeft;
        
        
        //设置字体大小

        
        //设置字体名字和字体大小
         _evaluationContentTextView.font = [UIFont fontWithName:@"Arial"size:18.0];
        
        //设置边框属性
//         _evaluationContentTextView.layer.cornerRadius = 10; //边框弧度
//         _evaluationContentTextView.borderColor = [UIColor darkGrayColor].CGColor; //设置边框颜色
//         _evaluationContentTextView.layer.borderWidth = 2; //边框宽度
        
        
       //设置是否可以滚动
        //UITextView继承于UIScrollView
         _evaluationContentTextView.scrollEnabled = NO;
        
        //消除影响（iOS7 如果把UIscrollView 加在导航中一般内容会向下走64）
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        //设置背景颜色
         _evaluationContentTextView.backgroundColor = [UIColor whiteColor];
        
        //UITextView下的键盘中return 表示换行
        //返回键的类型
         _evaluationContentTextView.returnKeyType = UIReturnKeyDone;
        
        //键盘类型
         _evaluationContentTextView.keyboardType = UIKeyboardTypeDefault;
        
        //自适应高度
         _evaluationContentTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self textViewPlaceStringType];

        
    }
    
    return _evaluationContentTextView;
}
-(void)textViewPlaceStringType{
    
    //设置显示内容
    _evaluationContentTextView.text =placeString;
    
    //设置textview里面的字体颜色
    _evaluationContentTextView.textColor = [UIColor colorWithRed:172/255.f green:172/255.f blue:172/255.f alpha:1.f];
    
         _evaluationContentTextView.font = [UIFont systemFontOfSize:14.0];
    
    
}
-(void)textViewNormalType{
    if ([_evaluationContentTextView.text isEqualToString:placeString]) {
        self.evaluationContentTextView.text =@"";
        
        //设置textview里面的字体颜色
        self.evaluationContentTextView.textColor = [UIColor blackColor];
        
        self.evaluationContentTextView.font = [UIFont systemFontOfSize:15.0];
    }
    
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    [self textViewNormalType];
    
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length==0) {
        [self textViewPlaceStringType];
    }

    
    
}
-(void)textViewDidChange:(UITextView *)textView{
   
     if (![_evaluationContentTextView.text isEqualToString:placeString]){
         self.inputSpaceConstraintsLabel.text=[NSString stringWithFormat:@"%ld/200",textView.text.length];
    
     }else{
         self.inputSpaceConstraintsLabel.text=@"0/200";
         
     }

}
- (BOOL)textView:(UITextView *)atextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

            //如果是删除减少字数，都返回允许修改
            if ([text isEqualToString:@""]) {
                  return YES;
        }
    if ([text isEqualToString:@"\n"]) {
       
        [atextView resignFirstResponder];
          self.navigationController.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
        return NO;
    }
    
            if (range.location>= 200){
                 return NO;
        }else{
                return YES;
        }


}

-(UILabel *)scoreShowsLabel{
    
    if (!_scoreShowsLabel) {
        _scoreShowsLabel =[[UILabel alloc]init];
        _scoreShowsLabel.text =@"请滑动星星评分";
        _scoreShowsLabel.textAlignment=NSTextAlignmentCenter;
        _scoreShowsLabel.font=[UIFont systemFontOfSize:15];
        
    }
    return _scoreShowsLabel;
}
-(NSMutableArray *)allStar{
    if (!_allStar) {
        _allStar =[[NSMutableArray alloc]init];
    }
    return _allStar;
}
-(UIView *)starRatingView{
    if (!_starRatingView) {
        _starRatingView =[[UIView alloc]init];
//        _starRatingView.backgroundColor =[UIColor redColor];
        _starRatingView.userInteractionEnabled=YES;
//        _starRatingView = [[UIView alloc]initWithFrame:CGRectMake(95, 5, 200, 50)];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(evaluationOfSliding:)];
        
        [_starRatingView addGestureRecognizer:pan];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dianji:)];
        
        [_starRatingView addGestureRecognizer:tap];
        
//        [view1 addSubview:_starRatingView];
        
        for (int i = 0; i < 5; i++) {
            
         UIImageView*   imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huxingxing"]];
//            huxingxing
//icon_star
            imageView.frame = CGRectMake(_starRatingView.bounds.origin.x+((i+1)*24), _starRatingView.bounds.origin.y, 24, 24);
            
            
            
            [_starRatingView addSubview:imageView];
            
           [self.allStar addObject:imageView];
            
        }
        
    }
    
    return _starRatingView;
}
-(UIView *)makeLineView{
    if (!_makeLineView) {
        _makeLineView =[[UIView alloc]init];
        _makeLineView.backgroundColor =[UIColor colorWithRed:204/255.f green:204/255.f blue:204/255.f alpha:1.f];
    }
    return _makeLineView;
    
}

-(UILabel *)thePriceLabel{
    if (!_thePriceLabel) {
        _thePriceLabel =[[UILabel alloc]init];
        _thePriceLabel.textColor=[UIColor redColor];
//        [UIColor colorWithRed:251/255.f green:49/255.f blue:71.f alpha:1.f];
        _thePriceLabel.text=@"¥ 100";
        _thePriceLabel.font=[UIFont systemFontOfSize:14];
    }
    
    return _thePriceLabel;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel =[[UILabel alloc]init];
        _titleLabel.font=[UIFont systemFontOfSize:14];
        _titleLabel.text=@"睡觉";
        
    }
    
    return _titleLabel;
}

-(UIImageView *)headIconImageView{
    
    if (!_headIconImageView) {
        _headIconImageView =[[UIImageView alloc]init];
        
    }
    return _headIconImageView;
}
-(UIView *)headView{
    if (!_headView) {
        _headView =[[UIView alloc]init];
        _headView.backgroundColor =[UIColor whiteColor];
        
    }
    
    return _headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 滑动的坐标

-(void)evaluationOfSliding:(UIPanGestureRecognizer *)pan{
    
    CGPoint translation = [pan locationInView:_starRatingView];
    
    
    
    for(int i = 0;i < 5 ; i++)
        
    {
        
        UIImageView *im ;
        
        im = self.allStar[i];
        
        //NSLog(@"_all[%i] = (%f,%f)",i,im.frame.origin.x,im.frame.origin.y);
        
        
        
        if ((translation.x > 0)&&(translation.x < 144)&&(translation.y > 0)&&(translation.y < 24))
            
        {
            
          self.starNumber = [NSString stringWithFormat:@"%i",((int)translation.x)/24];
            
            //UILabel *score = [[UILabel alloc]initWithFrame:CGRectMake(150, 180, 100, 100)];
            
            //[scrollView addSubview:score];
            
            //score.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            
            
            
            
            
//            star = [myscore intValue];
            
            
            
            //星星
            
            if (im.frame.origin.x > translation.x)
                
            {
                
                im.image =[UIImage imageNamed:@"huxingxing"];
                
            }
            
            else
                
            {
                
                im.image =[UIImage imageNamed:@"icon_star"];
                
            }
            
        }
        
    }
    
}

#pragma mark - 点击的坐标

-(void)dianji:(UITapGestureRecognizer *)tap{
    
    CGPoint translation = [tap locationInView:_starRatingView];
    
    
    
    for(int i = 0;i < 5 ; i++){
        
        
        
        UIImageView *im ;
        
        im = self.allStar[i];
        
        
        
        if ((translation.x > 0)&&(translation.x < 144)&&(translation.y > 0)&&(translation.y < 24)) {
            
           self.starNumber = [NSString stringWithFormat:@"%i",((int)translation.x)/24];
            
            
            
            //星星
            
//            star = [myscore intValue];
            
            
            
            if (im.frame.origin.x > translation.x) {
                
                im.image =[UIImage imageNamed:@"huxingxing"];
                
            }else{
                
                im.image =[UIImage imageNamed:@"icon_star"];
                
            }
            
        }
        
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
