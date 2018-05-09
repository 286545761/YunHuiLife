//
//  commodle.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/13.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "commodle.h"


@implementation commodle
- (id)initWithDict:(NSDictionary *)dic
{
    _category=[NSString stringWithFormat:@"%@", dic[@"category"]];
    _distance=[NSString stringWithFormat:@"%@", dic[@"distance"]];
    _idn=[NSString stringWithFormat:@"%@", dic[@"id"]];
    _mainImageUrl=[NSString stringWithFormat:@"%@", dic[@"image"]];
    _name=[NSString stringWithFormat:@"%@", dic[@"name"]];
    _praise=[NSString stringWithFormat:@"%@", dic[@"praise"]];
    _streetName=[NSString stringWithFormat:@"%@", dic[@"streetName"]];
     _remarks=[NSString stringWithFormat:@"%@", dic[@"remarks"]];
    _twoCategoryList=[[NSArray alloc] init];
    _twoCategoryList=dic[@"twoCategoryList"];

      _grade=[NSString stringWithFormat:@"%@", dic[@"grade"]];
    
    NSString * atDiscounttypeString=@"-1";// 打折
    NSString *atDiscountactivityString;//打折内容
    NSString *fullReductiontypeString=@"-1";// 满减
    NSString *fullReductioncativityString;// 满减内容
    
 
    for (NSDictionary *actionDic in dic[@"activities"] ) {
        if ([[NSString stringWithFormat:@"%@",actionDic[@"type"]] isEqualToString:@"2"] && [[NSString stringWithFormat:@"%@",actionDic[@"status"]] isEqualToString:@"1"]) {//
            atDiscounttypeString=[NSString stringWithFormat:@"%@",actionDic[@"type"]];
            if (atDiscountactivityString.length>0) {
                atDiscountactivityString=[NSString stringWithFormat:@"%@ %@",atDiscountactivityString,actionDic[@"name"]];
            }else{
                atDiscountactivityString=[NSString stringWithFormat:@"%@",actionDic[@"name"]];
                
            }
            
        }else if([[NSString stringWithFormat:@"%@",actionDic[@"type"]] isEqualToString:@"1"] &&   [[NSString stringWithFormat:@"%@",actionDic[@"status"]] isEqualToString:@"1"]){
            
            
           fullReductiontypeString=[NSString stringWithFormat:@"%@",actionDic[@"type"]];
            
            if (fullReductioncativityString.length>0) {
                 fullReductioncativityString=[NSString stringWithFormat:@"%@ %@",fullReductioncativityString,actionDic[@"name"]];
            }else{
                
                 fullReductioncativityString=[NSString stringWithFormat:@"%@",actionDic[@"name"]];
            }
            
        }
        
        
    }
//    NSString * atDiscounttypeString=@"-1";// 打折
//    NSString *atDiscountactivityString;//打折内容
//    NSString *fullReductiontypeString=@"-1";// 满减
//    NSString *fullReductioncativityString;/
    _acModel=[[activityModel alloc]init];
    _acModel.atDiscounttypeString=atDiscounttypeString;
    _acModel.atDiscountactivityString=atDiscountactivityString;
    _acModel.fullReductiontypeString=fullReductiontypeString;
    _acModel.fullReductioncativityString=fullReductioncativityString;
//    activityModel *model =[];
//    [activeAllArray addObject:model];
//    _storeActivityList =[NSArray arrayWithArray:activeAllArray];
   
    
    
    return self;
    
}
@end
