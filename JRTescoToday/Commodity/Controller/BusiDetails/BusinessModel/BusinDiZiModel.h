//
//  BusinDiZiModel.h
//  XFAppliance
//
//  Created by hduokeji on 16/4/29.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinDiZiModel : NSObject
@property(nonatomic,strong)NSString *m_tel;
@property(nonatomic,strong)NSString *m_workdate;
@property(nonatomic,strong)NSString *longitude;
@property(nonatomic,strong)NSString *latitude;
@property(nonatomic,strong)NSString *m_address;
@property(nonatomic,strong)NSString *m_id;
@property(nonatomic,strong)NSString *m_name;
- (id)initWithDict:(NSDictionary *)dataDic;
@end
