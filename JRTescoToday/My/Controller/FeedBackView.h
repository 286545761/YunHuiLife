//
//  FeedBackView.h
//  DHInvestment
//
//  Created by Andy on 15/9/5.
//  Copyright (c) 2015年 DuohaoTechnolog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedBackView : UIView

@property (strong, nonatomic) IBOutlet UITextField *mailText;

@property (strong, nonatomic) IBOutlet UITextView *ideaText;

@property (strong, nonatomic) IBOutlet UILabel *numLabel;

@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageaa;
@property (weak, nonatomic) IBOutlet UILabel *jiaqian;
@property (weak, nonatomic) IBOutlet UILabel *name;
@end
