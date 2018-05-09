//
//  BusinessPLModel.h
//  XFAppliance
//
//  Created by hduokeji on 16/4/26.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessPLModel : NSObject
@property(nonatomic,strong)NSString *user_id;
@property(nonatomic,strong)NSString *com_date;
@property(nonatomic,strong)NSArray *com_img_url;
@property(nonatomic,strong)NSString *com_img_url1;
@property(nonatomic,strong)NSString *com_id;
@property(nonatomic,strong)NSString *com_content;
@property(nonatomic,strong)NSString *user_name;
@property(nonatomic,strong)NSString *user_img;
- (id)initWithDict:(NSDictionary *)dataDic;
@end
