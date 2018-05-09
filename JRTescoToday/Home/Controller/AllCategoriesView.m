//
//  AllCategoriesView.m
//  JRTescoToday
//
//  Created by 123 on 2017/11/29.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "AllCategoriesView.h"
#import "AllCategoriesModel.h"
#import "AllCategoriesmerchanModel.h"
#import "UIButton+WebCache.h"
@implementation AllCategoriesView
{
    int n;
    int m;
    int sum;
     int num;
    int t;
    NSMutableArray *zhuantaiArray;
      NSMutableArray *zhuantaiArray1;
    NSMutableArray *zhuantaiArray2;
    int h;
    NSMutableArray *array4;
    NSMutableArray *array5;
}
-(NSInteger)MakeUiVieWDict:(NSArray *)dict controller:(id)lecontroller
{
    h=0;
    /*
     四个容易混淆的属性:
     一. textAligment : 文字的水平方向的对齐方式
     1> 取值
     NSTextAlignmentLeft      = 0,    // 左对齐
     NSTextAlignmentCenter    = 1,    // 居中对齐
     NSTextAlignmentRight    = 2,    // 右对齐
     
     2> 哪些控件有这个属性 : 一般能够显示文字的控件都有这个属性
     * UITextField
     * UILabel
     * UITextView
     
     二. contentVerticalAlignment : 内容的垂直方向的对齐方式
     1> 取值
     UIControlContentVerticalAlignmentCenter  = 0, // 居中对齐
     UIControlContentVerticalAlignmentTop     = 1, // 顶部对齐
     UIControlContentVerticalAlignmentBottom  = 2, // 底部对齐
     
     2> 哪些控件有这个属性 : 继承自UIControl的控件或者UIControl本身
     * UIControl
     * UIButton
     * UITextField
     * ...
     
     三. contentHorizontalAlignment : 内容的水平方向的对齐方式
     1> 取值
     UIControlContentHorizontalAlignmentCenter = 0, // 居中对齐
     UIControlContentHorizontalAlignmentLeft   = 1, // 左对齐
     UIControlContentHorizontalAlignmentRight  = 2, // 右对齐
     
     2> 哪些控件有这个属性 : 继承自UIControl的控件或者UIControl本身
     * UIControl
     * UIButton
     * UITextField
     * ...
     
     四. contentMode : 内容模式(控制内容的对齐方式), 一般对UIImageView很有用
     1> 取值
     /**
     规律:
     1.Scale : 图片会拉伸
     2.Aspect : 图片会保持原来的宽高比
     */
    // 前3个情况, 图片都会拉伸
    // (默认)拉伸图片至填充整个UIImageView(图片的显示尺寸会跟UIImageView的尺寸一样)
   // UIViewContentModeScaleToFill,
    // 按照图片原来的宽高比进行伸缩, 伸缩至适应整个UIImageView(图片的内容不能超出UIImageView的尺寸范围)
   // UIViewContentModeScaleAspectFit,
    // 按照图片原来的宽高比进行伸缩, 伸缩至 图片的宽度和UIImageView的宽度一样 或者 图片的高度和UIImageView的高度一样
    //UIViewContentModeScaleAspectFill,
    
    // 后面的所有情况, 都会按照图片的原来尺寸显示, 不会进行拉伸
  //  UIViewContentModeRedraw,  // 当控件的尺寸改变了, 就会重绘一次(重新调用setNeedsDisplay, 调用drawRect:)
  //  UIViewContentModeCenter,
   // UIViewContentModeTop,
   // UIViewContentModeBottom,
   // UIViewContentModeLeft,
   // UIViewContentModeRight,
   // UIViewContentModeTopLeft,
   // UIViewContentModeTopRight,
   // UIViewContentModeBottomLeft,
  //  UIViewContentModeBottomRight,
    
   // 2> 哪些控件有这个属性 : 所有UI控件都有
    
   // 5. 如果有多个属性的作用冲突了, 只有1个属性有效(就近原则)
   //  */

    sum=0;
    num=0;
  
    zhuantaiArray=[[NSMutableArray alloc] init];
    zhuantaiArray1=[[NSMutableArray alloc] init];
    
    self.backgroundColor=[UIColor colorWithHexString:kAllViewBgColor];
    NSArray *array=@[@"美食",@"酒店娱乐",@"生活服务"];
    NSArray *arrayImage=@[@"meishi",@"JiuDian3",@"shenghuo"];
     NSArray *array1=@[@"甜点饮品",@"自助餐",@"小吃快餐",@"生日蛋糕",@"聚餐宴请",@"烧烤烤肉",@"火锅"];
        NSArray *array2=@[@"经济型酒店",@"主题酒店",@"度假酒店／度假村",@"公寓型酒店",@"客栈／青年旅社",@"足疗按摩",@"洗浴／汗蒸",@"KTV",@"酒吧",@"电玩／游戏厅",@"运动健身",@"网吧网咖"];
        NSArray *array3=@[@"美食",@"酒店娱乐",@"生活服务"];
    for (NSDictionary *dict1 in dict) {
        AllCategoriesModel *model=[[AllCategoriesModel alloc] initWithDict:dict1];
        [zhuantaiArray1 addObject:model];
        //[zhuantaiArray addObject:model.merchantCategoryList];
        
    }
    
    array4=[[NSMutableArray alloc] init];
    for (int i=0; i<dict.count; i++) {
       
       // [zhuantaiArray addObject:[NSString stringWithFormat:@"%d",i]];
        UIView *cateGories=[[UIView alloc] init];
        cateGories.layer.cornerRadius = 10;
        cateGories.backgroundColor=[UIColor whiteColor];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
//        btn.backgroundColor=[UIColor yellowColor];
//        [btn setImage:[UIImage imageNamed:arrayImage[i]] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment=1;
        btn.frame=CGRectMake(15, 5, kScreenSize.width/3, 30);

        [btn setTitleColor:[UIColor colorWithHexString:@"#ef6332"] forState:UIControlStateNormal];
        if (i%2!=0) {
            [btn setTitleColor:[UIColor colorWithHexString:@"#d3282b"] forState:UIControlStateNormal];
        }
        AllCategoriesModel *model=[[AllCategoriesModel alloc] init];
        model=  zhuantaiArray1[i];
        [btn setTitle:[NSString stringWithFormat:@" %@",model.tagsName]
            forState:UIControlStateNormal];
        [btn sd_setImageWithURL:[NSURL URLWithString:model.img] forState:UIControlStateNormal];

        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        btn.titleLabel.font=[UIFont systemFontOfSize:16];
        UILabel *titleLabel=[[UILabel alloc]init];
        titleLabel.text=model.tagsName;
        titleLabel.textColor=[UIColor colorWithHexString:@"#d3282b"];
        [btn addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(btn);
            make.left.equalTo(btn.mas_left).offset(40);
        }];
        
        
//        btn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);
        btn.imageEdgeInsets=UIEdgeInsetsMake(0,-50, 0, 0);
        [cateGories addSubview:btn];
        if (i!=0) {
            int h23=n/3;
            if (n%3==0) {
                sum=sum+44+40*h23;
            }else
            {
               sum=sum+44+40*h23+40;
            }
           
           
        }
        t=0;
        n=0;
        m=0;
          array4=[[NSMutableArray alloc] init];
        for (NSDictionary *dict2 in model.merchantCategoryList) {
            AllCategoriesmerchanModel *sre=[[AllCategoriesmerchanModel alloc] initWithDict:dict2];
            [array4 addObject:sre];
        }
        
        for (AllCategoriesmerchanModel *strTitle in array4) {

            if (m%3==0) {
                m=0;
                t++;
            }
            UIButton *makeCategories=[UIButton  buttonWithType:UIButtonTypeCustom];
           // makeCategories.backgroundColor=[UIColor redColor];
            int j=n/3;
            makeCategories.frame=CGRectMake((kScreenSize.width-30)/3*m, 44+40*j, (kScreenSize.width-30)/3, 40);
            [makeCategories setTitle:[NSString stringWithFormat:@"%@",strTitle.tagsName] forState:UIControlStateNormal];
            [makeCategories setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
            makeCategories.titleLabel.font=[UIFont systemFontOfSize:14];
            makeCategories.tag=i*1000+n;
            [makeCategories addTarget:self action:@selector(btnaaFenlet:) forControlEvents:UIControlEventTouchUpInside];
            [cateGories addSubview:makeCategories];

            UIView *line=[[UIView alloc] init];
            line.backgroundColor=[UIColor colorWithHexString:@"#e4e4e4"];
            line.frame=CGRectMake(0, 44+40*j, kScreenSize.width-30,1);
            [cateGories addSubview:line];

       ;
            NSLog(@"sssss%d",(int)n/3);

            for (int g=1; g<=2; g++) {
                UIView *line1=[[UIView alloc] init];
                line1.backgroundColor=[UIColor colorWithHexString:@"#e4e4e4"];
//                NSArray *array123=array4[i];
//                if (array123.count%3==0) {
                     line1.frame=CGRectMake((kScreenSize.width-30)/3*g, 44, 0.5,40*j+40);
//                }else
//                {
//                     line1.frame=CGRectMake((kScreenSize.width-30)/3*g, 44, 1,40*j+40);
//                }

                [cateGories addSubview:line1];
            }



            m++;
            n++;

        }
           int h2=n/3;
        if (n%3==0) {
           num=40*h2+44;
        }else
        {
             num=40*h2+40+44;
        }
     
        
      cateGories.frame=CGRectMake(15, 15+i*15+sum, kScreenSize.width-30, num);
   
        [self addSubview:cateGories];
        
        
            
            
      
    }
    
    
    return sum+num+15+dict.count*15;
}
-(void)btnaaFenlet:(UIButton *)btn
{
    AllCategoriesModel *model=[[AllCategoriesModel alloc] init];
    model=zhuantaiArray1[btn.tag/1000];
    AllCategoriesmerchanModel *sre=[[AllCategoriesmerchanModel alloc] init];
    zhuantaiArray2=[[NSMutableArray alloc] init];
    for (NSDictionary *dict2 in model.merchantCategoryList) {
        AllCategoriesmerchanModel *sre=[[AllCategoriesmerchanModel alloc] initWithDict:dict2];
        [zhuantaiArray2 addObject:sre];
    }
       sre=zhuantaiArray2[btn.tag%1000];
    //sre=zhuantaiArray[btn.tag/1000][btn.tag%1000];
    
    NSLog(@"wwww%@",sre.tagsName);
      [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",sre.tagsName]   forKey:@"Categoriesname"];
     [FNUserDefaults setObject:[NSString stringWithFormat:@"%@",sre.tagsId]   forKey:@"Categories"];
     [[NSNotificationCenter defaultCenter] postNotificationName:@"Categories" object:nil];
}
@end
