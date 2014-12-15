//
//  TboxKit.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/13.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TboxKit.h"

@implementation TboxKit
@synthesize shopNumLabel;
@synthesize shopNumber;



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
      
      self.backgroundColor = [UIColor whiteColor];
      //商品初始化为1
      self.shopNumber = 1;
        
        [self ViewWithTBoxView];
    }
    return self;
}

-(void)ViewWithTBoxView
{
    
    UIButton *AddButton = [UIButton ButtonWithFrame:CGRectMake(0, 0, 25, 25) Normal:nil Select:nil Title:@"+"];
    [AddButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [AddButton addTarget:self action:@selector(addNumAction:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *RedButton = [UIButton ButtonWithFrame:CGRectMake(55, 0, 25, 25) Normal:nil Select:nil Title:@"－"];
    [RedButton addTarget:self action:@selector(redNumAction:) forControlEvents:UIControlEventTouchUpInside];
    [RedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    self.shopNumLabel = [UILabel LabelWithFrame:CGRectMake(25, 0, 30, 25) text:@"1" color:[UIColor grayColor] font:14];
    self.shopNumLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self addSubview:AddButton];
    [self addSubview:RedButton];
    [self addSubview:shopNumLabel];
    
    
}
-(void)addNumAction:(UIButton*)button{
    
    
    if ([self.shopNumLabel.text integerValue]>10) {
        return;
    }
    self.shopNumLabel.text = [NSString stringWithFormat:@"%ld",[self.shopNumLabel.text integerValue]+1];
    
}
-(void)redNumAction:(UIButton*)button{
    
    if ([self.shopNumLabel.text integerValue]==1) {
        return;
    }
    self.shopNumLabel.text = [NSString stringWithFormat:@"%ld",[self.shopNumLabel.text integerValue]-1];

}
@end
