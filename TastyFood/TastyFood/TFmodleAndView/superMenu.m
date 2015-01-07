//
//  superMenu.m
//  TastyFood
//
//  Created by love_ping891122 on 15/1/7.
//  Copyright (c) 2015年 love_ping891122. All rights reserved.
//

#import "superMenu.h"

@implementation superMenu
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
    // Drawing code
    [self initbuttons];
}
-(void)reloadMenuView
{
    for(UIView *view in [self subviews]){
        [view removeFromSuperview];
    }
    [self setNeedsDisplay];//重新绘制
    
    
}
-(void)initbuttons
{
    NSArray *list_title = @[@"全球水果",@"有机食品",@"进口食品",@"精选海鲜",@"中外名酒"];
    for (int i=0; i<5; i++) {
        UIButton *button = [UIButton ButtonWithFrame:CGRectMake(WIGHT/2-150/2, i*35, 150, 30) Normal:nil Select:nil Title:list_title[i]];
        button.backgroundColor = RGBAcolor(232, 232, 232, 1);
        [button setTitleColor:RGBAcolor(100, 100, 100, 1) forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonaction:) forControlEvents:UIControlEventTouchUpInside];
        if (self.selectIndex_Button==i) {
            button.backgroundColor = GreenColor_APP;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [self addSubview:button];
        
    }
    
    
}
-(void)buttonaction:(UIButton*)btn
{
    self.selectIndex_Button = btn.tag;
    
    [self reloadMenuView];
    [self.delegate didselectChartSelectbuttonView:self.selectIndex_Button];
    
}


@end
