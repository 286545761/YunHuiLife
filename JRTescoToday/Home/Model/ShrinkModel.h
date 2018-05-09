//
//  ShrinkModel.h
//  XFAppliance
//
//  Created by hduokeji on 16/4/18.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShrinkModel : NSObject
@property(nonatomic,strong)NSString *tagsId;
@property(nonatomic,strong)NSString *tagsName;
- (id)initWithDict:(NSDictionary *)dataDic;
@end
