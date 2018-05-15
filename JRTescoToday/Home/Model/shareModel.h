//
//  shareModel.h
//  JRTescoToday
//
//  Created by 韩铭文 on 2018/5/15.
//  Copyright © 2018年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shareModel : NSObject
/*
 *<# #>
 */
@property(copy,nonatomic)NSString *introduction;
/*
 *<# #>
 */
@property(copy,nonatomic)NSString *title;
/*
 *<# #>
 */
@property(copy,nonatomic)NSString *imageUrl;
/*
 *<# #>
 */
@property(copy,
          nonatomic)NSString *url;
- (id)initWithDict:(NSDictionary *)dataDic;
//{share:{introduction:会赚钱的生活服务平台,title:云惠生活,imageUrl:http://p.jryunhui.com/static/images/share_icon.png,url:http://tm.jryunhui.com:81/h5app/person/reg.html?inviter=&inviterRole=
@end
