//
//  BusinessController.h
//  XFAppliance
//
//  Created by hduokeji on 16/3/8.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "commodle.h"

@interface BusinessController : UIViewController
@property(nonatomic,strong)NSString *m_id;
@property(nonatomic ,strong)NSString *idn;
@property(nonatomic,strong)NSString *save;
@property(nonatomic,strong)NSString *theStoreCode;// 商铺编码

@property(nonatomic,strong)NSString *inviter;

@property(nonatomic,strong)commodle *model;
-(instancetype)ieenitWithName:(NSString *)idn age:(NSString *)inviter;
@end
