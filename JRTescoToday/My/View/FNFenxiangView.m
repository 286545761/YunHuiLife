//
//  FNFenxiangView.m
//  FNInvestment
//
//  Created by hduokeji on 15/12/12.
//  Copyright © 2015年 Beijing Hummingbird Technology Development Co.,Ltd. All rights reserved.
//

#import "FNFenxiangView.h"
#import "UIImageView+WebCache.h"
#import <UShareUI/UShareUI.h>
static NSString* const UMS_Title = @"【友盟+】社会化组件U-Share";
static NSString* const UMS_THUMB_IMAGE = @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
static NSString* const UMS_Web_Desc = @"W欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！";
static NSString* const UMS_WebLink = @"https://bbs.umeng.com/";
@implementation FNFenxiangView
{
    NSString *_headUrl;
    NSString *_title;
    NSString *_content;
    UIImageView *_mheatImageView ;
 
    UILabel *label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    
    if (self) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"FNFenxiangView" owner:nil options:nil][0];
        self.backgroundColor=[UIColor colorWithRed:0.00f green:0.00f blue:0.00f alpha:0.3f];
       
    }
    
    return self;
}
-(void)makeUmengHeadUrl:(NSString *)headUrl andTitle:(NSString *)title andShareContent:(NSString *)content andShare:(int)string
{
    _headUrl =headUrl;
    _title=title;
    _content=content;
    _string=string;
     [self MakeUiView];
    //[[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:_headUrl];
}





- (IBAction)quxai:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
       self.frame = CGRectMake(0, self.frame.size.height+110 ,self.frame.size.width ,1);
      
        
    }];
      [self.ccc removeFromSuperview];

}

- (IBAction)puxaio:(id)sender
{
    [UIView animateWithDuration :0.5 animations:^{
        self.frame = CGRectMake(0, self.frame.size.height+110 ,self.frame.size.width ,1);
        
    }];
   [self.ccc removeFromSuperview];
}
-(void)setTypeShare:(NSString *)typeShare{
    
    
    _typeShare=typeShare;
}

-(void)MakeUiView
{
     if (SCREEN_SIZE.width!=320)
     {
         
    _btn =[UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame=CGRectMake(15, 20, 60, 60);
    [_btn setImage:[UIImage imageNamed:@"WEixin"] forState:UIControlStateNormal];
  
     [self.ccc addSubview:_btn];
    
    _btn1 =[UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.frame=CGRectMake(15+1*self.frame.size.width/9.5+1*60,20, 60, 60);
    [_btn1 setImage:[UIImage imageNamed:@"Pengyou"] forState:UIControlStateNormal];
    [self.ccc addSubview:_btn1];
    
    _btn2 =[UIButton buttonWithType:UIButtonTypeCustom];
    _btn2.frame=CGRectMake(15+2*self.frame.size.width/9.5+2*60, 20, 60, 60);
    [_btn2 setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
   
    [self.ccc addSubview:_btn2];
    
    _btn3 =[UIButton buttonWithType:UIButtonTypeCustom];
    _btn3.frame=CGRectMake(15+3*self.frame.size.width/9.5+3*60,20, 60, 60);
    [_btn3 setImage:[UIImage imageNamed:@"QQZ"] forState:UIControlStateNormal];
   
    [self.ccc addSubview:_btn3];
     }
    else
    {
        _btn =[UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame=CGRectMake(15, 20, 60, 60);
        [_btn setImage:[UIImage imageNamed:@"WEixin"] forState:UIControlStateNormal];
        
        [self.ccc addSubview:_btn];
        
        _btn1 =[UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.frame=CGRectMake(15+1*self.frame.size.width*0.05+1*60,20, 60, 60);
        [_btn1 setImage:[UIImage imageNamed:@"Pengyou"] forState:UIControlStateNormal];
        [self.ccc addSubview:_btn1];
        
        _btn2 =[UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.frame=CGRectMake(15+2*self.frame.size.width*0.05+2*60, 20, 60, 60);
        [_btn2 setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
        
        [self.ccc addSubview:_btn2];
        
        _btn3 =[UIButton buttonWithType:UIButtonTypeCustom];
        _btn3.frame=CGRectMake(15+3*self.frame.size.width*0.05+3*60,20, 60, 60);
        [_btn3 setImage:[UIImage imageNamed:@"QQZ"] forState:UIControlStateNormal];
        
        [self.ccc addSubview:_btn3];
    }
    
    
    NSLog(@"sadasdasd%f",self.frame.size.width);
    NSArray *array=@[@"微信",@"朋友圈",@"QQ",@"空间"];
    
    if ([_typeShare isEqualToString:@"1"]) {
//        array=@[@"微信",@"朋友圈"];
        self.btn2.alpha=0.f;
        self.btn3.alpha=0.f;
    }
   // NSArray *array1=@[@"WEixin",@"Pengyou",@"QQ",@"XinLang"];
    for (int i=0; i<=_string; i++)
    {
        
        if (SCREEN_SIZE.width ==320)
        {
           
          
            
           
            
            
            label =[[UILabel  alloc] init];
            label.frame=CGRectMake(15+i*self.frame.size.width*0.05+i*60, 80, 60, 30);
            label.textColor=[UIColor  colorWithHexString:@"#87898c"];
            label.text=array[i];
            label.font=[UIFont  systemFontOfSize:13];
            label.textAlignment = NSTextAlignmentCenter;
            
            [self.ccc addSubview:label];
          
        }
        else
        {
               label =[[UILabel  alloc] init];
        label.frame=CGRectMake(15+i*self.frame.size.width/9.5+i*60, 80, 60, 30);
        label.textColor=[UIColor  colorWithHexString:@"#87898c"];
        label.text=array[i];
        label.font=[UIFont  systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self.ccc addSubview:label];
      
        }
    }
    
}
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
       [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];    }
    
}
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    NSString* thumbURL =  UMS_THUMB_IMAGE;
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:UMS_Title descr:UMS_Web_Desc thumImage:thumbURL];
    //设置网页地址
    shareObject.webpageUrl = UMS_WebLink;
    
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
     

@end








