
//  PLContentViewController.m
//  XFAppliance
//
//  Created by hduokeji on 16/5/3.
//  Copyright © 2016年 Beijing XiFan Technology Development Co.,Ltd. All rights reserved.
//

#import "PLContentViewController.h"
#import "CommentTableViewCell.h"
#import "BusinessPLModel.h"
//#import "DBImageView.h"
//#import "CommonFunc.h"
#import "UIImageView+WebCache.h"
@interface PLContentViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_contentTableView;
    CommentTableViewCell *_cell;
     NSMutableDictionary *paramDic;
    BusinessPLModel *business;
    NSMutableArray *_items;
     UIImageView *heat3;
    UIImageView *imageView3;
    CGSize labelSize;
    NSMutableArray *_items1;
    UIScrollView *scrollview;
}
@end

@implementation PLContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    _contentTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, kScreenSize.height) style:UITableViewStylePlain];
    self.title=@"评论详情";
    _contentTableView.delegate=self;
    _contentTableView.dataSource=self;
    _items=[[NSMutableArray alloc] init];
    _items1=[[NSMutableArray alloc] init];
    _contentTableView.backgroundColor=[UIColor blueColor];
   _contentTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:_contentTableView];
   
    [self DownLoad];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
  
    _cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(_cell == nil)
    {
        _cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentTableViewCell" owner:self options:nil] lastObject];
        heat3=[[UIImageView alloc] initWithFrame:(CGRect){ 20,20, 50, 50
        }];
            }
    business=_items[indexPath.row];
   // NSString *str=   [CommonFunc textFromBase64String:business.user_name];
   
   // _cell.nameTitle.text=str;
    _cell.time.text=business.com_date;
// NSString *strContent=   [CommonFunc textFromBase64String:business.com_content];
    //_cell.content.text=strContent;
   ///labelSize = [_cell.content.text sizeWithFont:_cell.content.font constrainedToSize:CGSizeMake(SCREEN_WIDTH-20, 10000) lineBreakMode:NSLineBreakByCharWrapping];
    //_cell.content.frame = CGRectMake(10,0, SCREEN_WIDTH-20, labelSize.height+10);
    _cell.content.numberOfLines=0;
  
    if (![business.user_img isEqualToString:@""]) {
        //[heat3 setImageWithPath:business.user_img];
        
    }
    else {
        
        UIImage *image=[UIImage  imageNamed:@"组-46"];
        [heat3 setImage:image];
        
    }
    
    if (business.com_img_url.count>0) {
        scrollview=[[UIScrollView alloc] init];
        scrollview.frame=CGRectMake(10, labelSize.height+100, SCREEN_SIZE.width-20, 347);
        scrollview.contentSize=CGSizeMake(264*business.com_img_url.count, 347);
        [_cell.contentView addSubview:scrollview];
        for (int i=0; i<business.com_img_url.count;  i++) {
          
            imageView3 = [[UIImageView alloc] initWithFrame:(CGRect){ 15+i*(254+10), 0,254, 347 }];
            NSLog(@"%f",labelSize.height);
            [_items1 addObject:imageView3];
            [imageView3 sd_setImageWithURL:[NSURL URLWithString:business.com_img_url[i]]];
          
            [scrollview addSubview:imageView3];
        }
        
    }
   [_cell addSubview:heat3];
    _cell.selectionStyle = UITableViewCellAccessoryNone;
    return _cell;
}
// 设置行高(默认行高是44px)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (business.com_img_url.count>0) {
       return 110+labelSize.height+347;
    }
    else{
           return 180+labelSize.height;
    }

}

#pragma mark 设置每个组中有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}
-(void)DownLoad
{
    
        NSString *currentDateStr = [NSString stringGetCurrentDateStr];
      //  paramDic = [NSMutableDictionary dictionaryWithDictionary:@{@"uuid":[XFUserDefaults objectForKey:UU_ID],@"city_code":[XFUserDefaults  objectForKey:@"cityid"],@"m_id":_m_id,@"pageNo":@"0"}];
    
    
    NSString *uid = [NSString getUIDWihtCurrentDateStr:currentDateStr dic:paramDic];
    [paramDic setObject:currentDateStr forKey:@"times"];
    [paramDic setObject:uid forKey:@"uid"];


}
@end

