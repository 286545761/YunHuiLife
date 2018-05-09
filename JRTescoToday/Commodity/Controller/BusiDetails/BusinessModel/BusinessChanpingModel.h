//
//  BusinessChanpingModel.h
//  XFAppliance
//
//  Created by hduokeji on 16/4/26.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessChanpingModel : NSObject
@property(nonatomic,strong)NSString *p_img_url;
@property(nonatomic,strong)NSString *is_save;
@property(nonatomic,strong)NSString *p_name;
@property(nonatomic,strong)NSString *p_log_url;
@property(nonatomic,strong)NSString *save_num;
@property(nonatomic,strong)NSString *p_id;
@property(nonatomic,strong)NSString *m_logo_url;
- (id)initWithDict:(NSDictionary *)dataDic;
@end
