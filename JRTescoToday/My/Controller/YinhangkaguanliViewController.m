//
//  YinhangkaguanliViewController.m
//  JRTescoToday
//
//  Created by 123 on 2017/9/1.
//  Copyright © 2017年 Beijing today Tesco Agel Ecommerce Ltd. All rights reserved.
//

#import "YinhangkaguanliViewController.h"
#import "UIImageView+WebCache.h"
@interface YinhangkaguanliViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bankImage;
@property (weak, nonatomic) IBOutlet UILabel *bankCord;

@property (weak, nonatomic) IBOutlet UILabel *bankName;
@end

@implementation YinhangkaguanliViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.title=@"银行卡管理";
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    [self downLoad23];
}

-(void)downLoad23
{
    NSDictionary *paramDic = @{@"access_token":[FNUserDefaults objectForKey:@"usersid"]                                                     
                               };
    
    [HttpTool getWithBaseURL:kBaseURL  path:@"wallet/cards" params:paramDic success:^(id data) {
        
        _bankName.text=[NSString stringWithFormat:@"%@",data[0][@"bankName"]];
       [_bankImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data[0][@"bankIcon"]]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageProgressiveDownload | SDWebImageRefreshCached];
        [_bankImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data[0][@"bankIcon"]]] placeholderImage:nil options:SDWebImageProgressiveDownload];
        _bankCord.text=[NSString stringWithFormat:@"%@",data[0][@"cardNo"]];
//        NSLog(@"%@",data);
        
    } failure:^(NSError *error) {
    
    } alertInfo:^(NSString *alertInfo) {
        
    }];
}

@end
