//
//  FriendViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/8/24.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "FriendViewController.h"
#import "DHFriendInviteController.h"
#import "DHMyInviteController.h"
#import "YaoQingView.h"
#import "makeGuiZe.h"
#import "CrossDevicesLayout.h"
@interface FriendViewController ()<UIGestureRecognizerDelegate>
{
    YaoQingView *mak;
    UIButton *tixianjiluj1;
    UIButton *zhanghutixian1;
    UIButton *querentixian1;
    NSString *string;
    makeGuiZe *mak1212;
    UIButton *makeQingchuBtn;
    
}
@property (weak, nonatomic) IBOutlet UILabel *getaplabel;
@property (weak, nonatomic) IBOutlet UIView *tapBaseView;
@property (weak, nonatomic) IBOutlet UILabel *leijishouyi;
@property (weak, nonatomic) IBOutlet UILabel *jiashu;
@property (weak, nonatomic) IBOutlet UILabel *jiashu1;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *baseScroll;
/*
 *<# #>
 */
@property(strong,nonatomic)UIButton *dianButton;


@property (weak, nonatomic) IBOutlet UIImageView *InviteFriendsimageView;
/*
 *
 */
@property(strong,nonatomic)UILabel* theRulesLabel;
/*
 *
 */
@property(strong,nonatomic)UIButton *geButton;

@end

@implementation FriendViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    settingBtn.frame=CGRectMake(kScreenSize.width-70, 10, 60, 60);
//    [settingBtn addTarget:self action:@selector(enterTeamCard) forControlEvents:UIControlEventTouchUpInside];
//    [settingBtn setTitle:@"分润规则" forState:UIControlStateNormal];
//    [settingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    // settingBtn.backgroundColor=[UIColor blackColor];
//    string=@"1";
//    settingBtn.titleLabel.font=[UIFont systemFontOfSize:12];
//
//    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
//    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];
  
    
}
-(UIButton *)geButton{
    if (!_geButton) {
        _geButton =[[UIButton alloc]init];
        [_geButton addTarget:self action:@selector(Ge:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _geButton;
}
-(UIButton *)dianButton{
    if (!_dianButton) {
        _dianButton =[[UIButton alloc]init];
        [_dianButton addTarget:self action:@selector(Dian:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _dianButton;
}
-(UILabel *)theRulesLabel{
    if (!_theRulesLabel) {
        _theRulesLabel =[[UILabel alloc]init];
        _theRulesLabel.textColor=[UIColor colorWithHexString:@"#333333"];
        _theRulesLabel.text=@"分润规则：\n1、用户可以分享自己的二维码或邀请链接邀请好友前来注册；2、邀请奖励：\n（1）若您邀请的好友注册为商户，并在平台开通店铺，则该店铺在平台产生的实际销售金额的2%作为您的邀请奖励，按天结算；\n（2）若您邀请的好友注册为个人，并在平台任一店铺产生消费时，则好友该笔实际消费金额的3%作为您的邀请奖励，按笔结算。\n3、邀请奖励将于商家单日或个人单笔消费订单结算完成后发放到您的“云惠钱包”；\n4、邀请关系一旦确立，相应的邀请奖励发放也将一直保持；\n5、邀请好友人数不受限制；\n6、邀请奖励规则最终解释权归云惠生活平台所有。\n 举例说明：\n A、D为平台个人用户。\n①若A邀请好友B注册为个人用户，当B在平台商家产生消费100元并使用云惠生活APP买单，实际消费金额为90元，那么A能得到的邀请奖励=好友B在平台商家实际消费金额*3%=90元*3%=2.7元。\n②若用户A邀请好友B注册为商家，并在平台开通店铺B。当用户D在店铺B产生消费100元并使用云惠生活APP买单，实际消费金额为90元，那么店铺B实际销售金额为90元，则A能得到的邀请奖励=店铺B实际销售金额*2%=90元*2%=1.8元。";
        _theRulesLabel.numberOfLines=0;
        _theRulesLabel.font=[UIFont systemFontOfSize:13];
    }
    
    return _theRulesLabel;
}
-(void)enterTeamCard
{
    if ([string isEqualToString:@"1"]) {
        mak1212=[[makeGuiZe alloc] init];
        string=@"2";
        makeQingchuBtn=mak1212.qingchu;
        [makeQingchuBtn addTarget:self action:@selector(btnQingchu) forControlEvents:UIControlEventTouchUpInside];
         mak1212.layer.cornerRadius=15;
        mak1212.frame=CGRectMake(15, 50,kScreenSize.width-30 , CGCrossDevicesHeight((kScreenSize.height-100)));
        [self.view addSubview:mak1212];
    }
    else
    {
        string=@"1";
        [mak1212 removeFromSuperview];
    }

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的邀请";
    self.baseScroll.userInteractionEnabled=YES;
    self.bgImageView.backgroundColor=[UIColor whiteColor];
    self.tapBaseView.userInteractionEnabled=YES; self.baseScroll.contentSize=CGSizeMake(ScreenW, 1200);
    self.baseScroll.delaysContentTouches = NO;
    self.view.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    if (iPhone5) {
        mak=[[YaoQingView alloc] init];
        mak.frame=CGRectMake(0, 0, kScreenSize.width, kScreenSize.height);
        zhanghutixian1 =mak.lei;
        zhanghutixian1.tag=1000;
        [zhanghutixian1 addTarget:self action:@selector(btnzhanghu:) forControlEvents:UIControlEventTouchUpInside];
        tixianjiluj1 =mak.leiJiGeRen;
        tixianjiluj1.tag=1001;
        [tixianjiluj1 addTarget:self action:@selector(btnzhanghu:) forControlEvents:UIControlEventTouchUpInside];
        querentixian1 =mak.leiJiDianPu;
        querentixian1.tag=1002;
        [querentixian1 addTarget:self action:@selector(btnzhanghu:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:mak];
    }
    [self downLoad];
    [self.baseScroll addSubview:self.dianButton];

    [self.dianButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseScroll.mas_top).offset(100);
        make.left.equalTo(self.baseScroll.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(ScreenW/2, 100));
        
    }];
    
    [self.baseScroll addSubview:self.geButton];
    
//    self.geButton.backgroundColor=[UIColor redColor];
    
    [self.geButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(self.dianButton);
        
        make.left.equalTo(self.dianButton.mas_right);
    }];
    
    
    
//    self.theRulesLabel.backgroundColor=[UIColor yellowColor];
    [self.baseScroll addSubview:self.theRulesLabel];
    
    
    [self.theRulesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.InviteFriendsimageView.mas_bottom).offset(0);
        make.height.equalTo(@425);
    }];
    
}
-(void)btnQingchu
{
    string=@"1";
    [mak1212 removeFromSuperview];
}
-(void)btnzhanghu:(UIButton *)btn
{
    if (btn.tag==1000) {
       
        DHFriendInviteController *yew=[[DHFriendInviteController alloc] init];
        [self.navigationController pushViewController:yew animated:YES];
 
        
    } else if (btn.tag==1001)
    {
        DHMyInviteController *yew=[[DHMyInviteController alloc] init];
        yew.mq=@"1";
        yew.title=@"邀请个人记录";
        yew.ge=_jiashu.text;
        [self.navigationController pushViewController:yew animated:YES];
        
    }else{
        DHMyInviteController *yew=[[DHMyInviteController alloc] init];
        yew.mq=@"2";
        yew.title=@"邀请店铺记录";
        yew.ge=_jiashu1.text;
        [self.navigationController pushViewController:yew animated:YES];
    }
}

- (IBAction)lei:(id)sender {
    DHFriendInviteController *yew=[[DHFriendInviteController alloc] init];
    [self.navigationController pushViewController:yew animated:YES];
}

-(void)dianTap{
    
    DHMyInviteController *yew=[[DHMyInviteController alloc] init];
    yew.mq=@"2";
    yew.title=@"邀请店铺记录";
    yew.ge=_jiashu1.text;
    [self.navigationController pushViewController:yew animated:YES];
    
}
- (IBAction)Dian:(id)sender {
    DHMyInviteController *yew=[[DHMyInviteController alloc] init];
    yew.mq=@"2";
    yew.title=@"邀请店铺记录";
    yew.ge=_jiashu1.text;
    [self.navigationController pushViewController:yew animated:YES];
}

- (IBAction)Ge:(id)sender {
    DHMyInviteController *yew=[[DHMyInviteController alloc] init];
    yew.mq=@"1";
    yew.title=@"邀请个人记录";
    yew.ge=_jiashu.text;
    [self.navigationController pushViewController:yew animated:YES];
}
-(void)downLoad
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"access_token":[FNUserDefaults objectForKey:@"usersid"],
                                                                                   
                                                                                    
                                                                                    }];
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"person/invitation" params:paramDic success:^(id data) {
        _leijishouyi.text=[NSString stringWithFormat:@"￥%@",data[@"toltalReward"]]  ;
        _jiashu.text=[NSString stringWithFormat:@"%@",data[@"totalPerson"]]  ;;
        _jiashu1.text=[NSString stringWithFormat:@"%@",data[@"totalMerchant"]]  ;;;
        
        
        if (iPhone5) {
            mak.jinE.text=[NSString stringWithFormat:@"￥%@",data[@"toltalReward"]]  ;
            mak.leiJidianpusu.text=[NSString stringWithFormat:@"%@",data[@"totalMerchant"]]  ;
            mak.leiJiGeREnsu.text=[NSString stringWithFormat:@"%@",data[@"totalPerson"]]  ;;
        }
    } failure:^(NSError *error) {
        
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}



@end
