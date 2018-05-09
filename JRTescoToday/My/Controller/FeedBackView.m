//
//  FeedBackView.m
//  DHInvestment
//
//  Created by Andy on 15/9/5.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import "FeedBackView.h"

@implementation FeedBackView

- (instancetype)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"FeedBackView" owner:nil options:nil][0];
        _sendButton.backgroundColor=[UIColor colorWithRed:0.27f green:0.80f blue:1.00f alpha:1.00f];
        self.backgroundColor = [UIColor colorWithHexString:kAllViewBgColor];
        
    }
    return self;
}

@end

 
