//
//  ChartSelectbuttonView.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/18.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "ChartSelectbuttonView.h"

@implementation ChartSelectbuttonView
@synthesize selectIndex_Button;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    [self initbuttonview];

}
-(void)initbuttonview
{
//    UIView *backview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 40) :[UIColor clearColor]];
    NSArray *list = @[@"不打赏",@"赏两块",@"赏三块"];

    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton ButtonWithFrame:CGRectMake(i*WIGHT/3+10, 5, WIGHT/3-20, 35) Normal:nil Select:nil Title:list[i]];
        button.layer.cornerRadius = 4;
        button.backgroundColor = RGBAcolor(170, 170, 170, 1);
        if (selectIndex_Button==i) {
            button.backgroundColor = GreenColor_APP;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        button.tag = i;
        [button addTarget:self action:@selector(buttonaction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
    
}
-(void)reloadMenuView
{
    for(UIView *view in [self subviews]){
        [view removeFromSuperview];
    }
    [self setNeedsDisplay];//重新绘制
    
    
}
-(void)buttonaction:(UIButton*)btn
{
    self.selectIndex_Button = btn.tag;
   
    [self reloadMenuView];
    [self.delegate didselectChartSelectbuttonView:self.selectIndex_Button];

}

@end
