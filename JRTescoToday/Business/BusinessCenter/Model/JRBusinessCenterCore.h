//
//  JRBusinessCenterCore.h
//  JRTescoToday
//
//  Created by apple on 2017/11/28.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRProductCatogryModel.h"
typedef void (^SuccessBlock)(NSDictionary *data);
typedef void (^FaildBlock)(NSString *erro);

typedef void (^Finish_Block)(id data);

@interface JRBusinessCenterCore : NSObject
/**
 * 获取商品
 * @pagram token 用户token
 * @pagram type 查询类型（0 全部，1 待上架，2 已上架，-1 下架）
 * @pagram pageNumber 页码
 * @pagram pageSize 每页条数
 */
+ (void)query_requestBusinessManagerWithToken:(NSString *)token type:(NSString *)type pageNum:(NSString *)pageNumber pageSize:(NSString *)pageSize Successed:(SuccessBlock)successed failed:(FaildBlock)failed;
/**
 * 商品编辑下架发布操作
 */
+ (void)uploadBusinessMangerProductWithToken:(NSString *)token productID:(NSString *)ID type:(NSString *)type Successed:(SuccessBlock)successed failed:(FaildBlock)failed;
/**
 * 商品分类
 */
+ (void)query_requestBussinessProductCategoryWithToken:(NSString *)token Successed:(Finish_Block)successed failed:(FaildBlock)failed;
/**
* 创建商品分类
*/
+ (void)uploadCreatedBussinessProductCategoryWithToken:(NSString *)token goodsCategoryCreateModel:(NSString *)category Successed:(SuccessBlock)successed failed:(FaildBlock)failed;
/**
 * 查询标签详情
 */
+ (void)query_requestBussinessProductAllTagWithID:(NSString *)ID Successed:(SuccessBlock)successed failed:(FaildBlock)failed;
/**
 * 查询商品详情
 */
+ (void)query_requestBussinessProductDetailInforWithID:(NSString *)ID Successed:(SuccessBlock)successed failed:(FaildBlock)failed;

/**
 * 编辑商品 /goods/editGoods
 */
+ (void)uploadEdit_ProductWithAccess_tokenToken:(NSString *)token productID:(NSString *)ID name:(NSString *)name mainImage:(UIImage *)mainImage descp:(NSString *)descp goodsPrice:(NSString *)goodsPrice originalPrice:(NSString *)originalPrice goodsCategoryId:(NSString *)goodsCategoryId type:(NSString *)type labels:(NSArray *)tagArr Successed:(SuccessBlock)successed failed:(FaildBlock)failed;
/**
 * 添加商品 /goods/addGoods
 */
+ (void)uploadADD_ProductWithAccess_tokenToken:(NSString *)token productID:(NSString *)ID name:(NSString *)name mainImage:(UIImage *)mainImage descp:(NSString *)descp goodsPrice:(NSString *)goodsPrice originalPrice:(NSString *)originalPrice goodsCategoryId:(NSString *)goodsCategoryId type:(NSString *)type labels:(NSArray *)tagArr Successed:(SuccessBlock)successed failed:(FaildBlock)failed;

@end
