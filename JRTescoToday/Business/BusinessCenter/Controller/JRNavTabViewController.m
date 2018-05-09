//
//  JRNavTabViewController.m
//  JRTescoToday
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "JRNavTabViewController.h"
#define UISIZE       [UIScreen mainScreen].bounds.size
#define DCScreenW    [UIScreen mainScreen].bounds.size.width
#define DCScreenH    [UIScreen mainScreen].bounds.size.height
@interface JRNavTabViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIButton *oldBtn;
@property(nonatomic,strong)NSArray *VCArr;
@property (nonatomic, weak) UIScrollView *contentView;
@property (nonatomic, weak) UIScrollView *topBar;
@property(nonatomic,assign) CGFloat btnW ;

@property (nonatomic, weak) UIView *slider;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIScrollView *scrollView;
@end

@implementation JRNavTabViewController

{
    dispatch_time_t delayTime;
}

- (void)dealloc {
    DLog(@"==========delloc终于走了===============");
    
}

-(UIColor *)sliderColor
{
    if(_sliderColor == nil)
    {
        _sliderColor = [UIColor redColor];
    }
    return  _sliderColor;
}
-(UIColor *)btnTextNomalColor
{
    if(_btnTextNomalColor == nil)
    {
        _btnTextNomalColor = [UIColor blackColor];
    }
    return _btnTextNomalColor;
}
-(UIColor *)btnTextSeletedColor
{
    if(_btnTextSeletedColor == nil)
    {
        _btnTextSeletedColor = [UIColor redColor];
    }
    return _btnTextSeletedColor;
}
-(UIColor *)topBarColor
{
    if(_topBarColor == nil)
    {
        _topBarColor = [UIColor whiteColor];
    }
    return _topBarColor;
}
-(instancetype)initWithSubViewControllers:(NSArray *)subViewControllers
{
    if(self = [super init])
    {
        _VCArr = subViewControllers;
    }
    return self;
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;

    _alterHeight = 0;
    //添加上面的导航条
    [self addTopBar];
    
    //添加子控制器
    [self addVCView];
    
    //添加滑块
    [self addSliderView];
}


- (void)delayMethod {
    _alterHeight = 0;
    [self reloadAllSubview];
    
}
- (void)reloadAllSubview {
    __weak __typeof(self) weakSelf = self;
    weakSelf.topView.frame = CGRectMake(0, 0, UISIZE.width, 0);
    _scrollView.frame = CGRectMake(0, 0, DCScreenW, 44);
    self.contentView.frame = CGRectMake(0,44, DCScreenW, DCScreenH -44-64);
    
    NSUInteger count = self.VCArr.count;
    for (int i=0; i<count; i++) {
        UIViewController *vc = self.VCArr[i];
        vc.view.frame = CGRectMake(i*DCScreenW, 0, DCScreenW, DCScreenH -64-44);
    }
    self.contentView.contentSize = CGSizeMake(count*DCScreenW, DCScreenH-44-64);

    
}
- (CGFloat)addTabelViewHeadeViewWithMessage:(NSString *)message headerDisappear:(DisappearBlock)disappear {
    
    return _topView.bounds.size.height;
    
}

-(void)addTopBar
{
    if(self.VCArr.count == 0) return;
    NSUInteger count = self.VCArr.count;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _alterHeight, DCScreenW, 44)];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.backgroundColor = self.topBarColor;
    self.topBar = _scrollView;
    self.topBar.bounces = NO;
    [self.view addSubview:self.topBar];
    
    if(count <= 5)
    {
        self.btnW = DCScreenW / count;
    }else
    {
        self.btnW = DCScreenW / 5.0;
    }
    //添加button
    for (int i=0; i<count; i++)
    {
        UIViewController *vc = self.VCArr[i];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*self.btnW,0, self.btnW, 44)];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = 10000+i;
        [btn setTitleColor:self.btnTextNomalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.btnTextSeletedColor forState:UIControlStateSelected];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.topBar addSubview:btn];
        if(i == 0)
        {
            btn.selected = YES;
            self.oldBtn = btn;
        }
    }
    
    self.topBar.contentSize = CGSizeMake(self.btnW *count,44);
}
-(void)addSliderView
{
    if(self.VCArr.count == 0) return;
    
    UIView *slider = [[UIView alloc]initWithFrame:CGRectMake(0,44-3,self.btnW, 3)];
    slider.backgroundColor = self.sliderColor;
    [self.topBar addSubview:slider];
    self.slider = slider;
}
-(void)addVCView
{
    UIScrollView *contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,44+_alterHeight, DCScreenW, DCScreenH -44-64-_alterHeight)];
    self.contentView = contentView;
    contentView.scrollEnabled = NO;
    self.contentView.bounces = NO;
    contentView.delegate = self;
    contentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:contentView];
    
    NSUInteger count = self.VCArr.count;
    for (int i=0; i<count; i++) {
        UIViewController *vc = self.VCArr[i];
        [self addChildViewController:vc];
        // [self.view addSubview:vc.view];
        vc.view.frame = CGRectMake(i*DCScreenW, 0, DCScreenW, DCScreenH -64-44-_alterHeight);
        [contentView addSubview:vc.view];
    }
    
    contentView.contentSize = CGSizeMake(count*DCScreenW, DCScreenH-44-64-_alterHeight);
    contentView.pagingEnabled = YES;
}
-(void)click:(UIButton *)sender
{
    if(sender.selected) return;
    self.oldBtn.selected = NO;
    sender.selected = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.contentOffset = CGPointMake((sender.tag - 10000)*DCScreenW, 0);
        
    }];
    [UIView animateWithDuration:0.3 animations:^{
        sender.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
    self.oldBtn.transform = CGAffineTransformIdentity;
    self.oldBtn = sender;
    [self.delegate clickButtonToVc:sender.tag];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //滑动导航条
    self.slider.frame = CGRectMake(scrollView.contentOffset.x / DCScreenW *self.btnW , 44-3, self.btnW, 3);
}
//判断是否切换导航条按钮的状态
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offX =  scrollView.contentOffset.x;
    int tag = (int)(offX /DCScreenW + 0.5) + 10000;
    UIButton *btn = [self.view viewWithTag:tag];
    if(tag != self.oldBtn.tag)
    {
        [self click:btn];
    }
}

- (void)scrollToIndex:(NSInteger)tag {
    UIButton *btn = [self.view viewWithTag:tag];
    if(tag != self.oldBtn.tag)
    {
        [self click:btn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
