//
//  activityImageDetailsViewController.m
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/7.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "activityImageDetailsViewController.h"
#import "FNFenxiangView.h"
#import <UShareUI/UShareUI.h>
static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_WebLink = @"https://bbs.umeng.com/";
@interface activityImageDetailsViewController (){
    
    UIButton *weixin;
    UIButton *peng;
    UIButton*qq;
    UIButton *zone;
    NSString *febxuangString;
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *imageScr;
/*
 *<# #>
 */
@property(strong,nonatomic)FNFenxiangView *share;

@end

@implementation activityImageDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"活动详情";
    febxuangString=@"";
    self.imageScr.contentSize=CGSizeMake(ScreenW, 1055);
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shareFrieButton:(id)sender {
    
    NSLog(@"立即邀请");
    
    if ([febxuangString isEqualToString:@""]) {
    
        _share=[[FNFenxiangView alloc] init];

        [_share  makeUmengHeadUrl:nil andTitle:self.title andShareContent:nil andShare:3];
        
        weixin=_share.btn1;
        [weixin addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
    weixin.tag=0;
        
        peng=_share.btn;
        
        [ peng addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
        peng.tag=1;
        
        qq=_share.btn2;
        [qq addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
        qq.tag=2;
        
        zone=_share.btn3;
        [zone addTarget:self action:@selector(ShareButtion:) forControlEvents:UIControlEventTouchUpInside];
        zone.tag=3;
        _share.frame = CGRectMake(0, SCREEN_HEIGHT ,SCREEN_WIDTH ,1);
        [UIView animateWithDuration:0 animations:^{
            _share.frame = CGRectMake(0, 0 ,SCREEN_WIDTH ,SCREEN_HEIGHT);
            [self.tabBarController.view  addSubview:_share];
        }];
        
        
    }
else
    {
        febxuangString=@"";
        [UIView animateWithDuration :0 animations:^{
            _share.frame = CGRectMake(0, _share.frame.size.height+110 ,_share.frame.size.width ,0);

        }];
        [_share.ccc removeFromSuperview];
        
    }
    
    
}
-(void)setSharemodel:(shareModel *)sharemodel{
    _sharemodel =sharemodel;
}

// 分享

    

-(void)ShareButtion:(UIButton *)btn1
{
    if (btn1.tag==0)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
    }
    else if(btn1.tag==1)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
    }else if(btn1.tag==2)
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];    }
    else
    {
        [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
    }
    
}
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
//    NSString* thumbURL =  self.sharemodel.url;
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.sharemodel.title descr:self.sharemodel.introduction thumImage:self.sharemodel.imageUrl];
    //设置网页地址
    shareObject.webpageUrl = self.sharemodel.url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
#ifdef UM_Swift
    [UMSocialSwiftInterface shareWithPlattype:platformType messageObject:messageObject viewController:self completion:^(UMSocialShareResponse * data, NSError * error) {
#else
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
#endif
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    //分享结果消息
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    //第三方原始返回的数据
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [self alertWithError:error];
        }];
    }
     
     - (void)alertWithError:(NSError *)error
     {
         NSString *result = nil;
         if (!error) {
             result = [NSString stringWithFormat:@"Share succeed"];
         }
         else{
             NSMutableString *str = [NSMutableString string];
             if (error.userInfo) {
                 for (NSString *key in error.userInfo) {
                     [str appendFormat:@"%@ = %@\n", key, error.userInfo[key]];
                 }
             }
             if (error) {
                 result = [NSString stringWithFormat:@"Share fail with error code: %d\n%@",(int)error.code, str];
             }
             else{
                 result = [NSString stringWithFormat:@"Share fail"];
             }
         }
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                         message:result
                                                        delegate:nil
                                               cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                               otherButtonTitles:nil];
         [alert show];
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
