//
//  MenuTabbarView.m
//  FFAdemo
//
//  Created by love_ping891122 on 14/12/8.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "MenuTabbarView.h"

@implementation MenuTabbarView
@synthesize selectIndex;
@synthesize iconsList_normal;
@synthesize iconsList_selected;
@synthesize titlesList;
@synthesize MenuButton;
@synthesize badgeView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Toolbarback.png"]];
        self.selectIndex      = 0;
        self.titlesList       = @[@"首页",@"美家菜场",@" 我",@""];
        self.iconsList_normal = @[@"tabbar_01.png",@"tabbar_02.png",@"tabbar_03.png",@""];
        self.iconsList_selected = @[@"tabbar_01.png",@"tabbar_02.png",@"tabbar_03.png",@""];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changebadgeNum) name:@"checkshopchartBadge" object:nil];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {

    @autoreleasepool {
        
    for (int i=0; i<4; i++) {

        self.MenuButton = [UIButton ButtonWithFrame:CGRectMake(WIGHT/4*i, 2, WIGHT/4, 49) topNormalimage:[UIImage imageNamed:self.iconsList_normal[i]] topSlectimage:nil Title:self.titlesList[i] titleColor:[UIColor grayColor]];

        if (selectIndex==i) {
            self.MenuButton =[UIButton ButtonWithFrame:CGRectMake(WIGHT/4*i, 2, WIGHT/4, 49) topNormalimage:[UIImage imageNamed:self.iconsList_selected[selectIndex]] topSlectimage:nil Title:self.titlesList[selectIndex] titleColor:RGBAcolor(30, 140, 200, 1)];
        }
        
        [self.MenuButton addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
        self.MenuButton.tag = i;
        [self addSubview:self.MenuButton];
    }

        
        
        UIImageView *iamg1e = [UIImageView imageViewWithFrame:CGRectMake(WIGHT-WIGHT/4-12, -32, WIGHT/4, 79) :@"tabbarchart.png"];
        [self addSubview:iamg1e];
        
        
        badgeView = [[JSBadgeView alloc] initWithParentView:iamg1e alignment:JSBadgeViewAlignmentCenterRight];
        badgeView.badgeText = [NSString stringWithFormat:@"%d", 9];
        badgeView.badgePositionAdjustment = CGPointMake(-15, -23);
        badgeView.badgeShadowColor = [UIColor whiteColor];
//        badgeView.badgeStrokeWidth = 2;
//
        badgeView.badgeBackgroundColor = YellowColor_APP;
//        badgeView.badgeStrokeColor = YellowColor_APP;
//        badgeView.badgeStrokeWidth = 15;
        
        
    }

}
-(void)changebadgeNum
{
    badgeView.badgeText = [NSString stringWithFormat:@"%d", 11];

}
-(void)reloadMenuView
{
    for(UIView *view in [self subviews]){
        [view removeFromSuperview];
    }
    [self setNeedsDisplay];//重新绘制
    
    
}
-(void)menuAction:(UIButton*)button
{
    NSLog(@"%ld",(long)button.tag);
    self.selectIndex =button.tag;
    for(UIView *view in [self subviews]){
        [view removeFromSuperview];
    }
    [self reloadMenuView];
    [self.delegate getinfo:button.tag];
    
    
}


@end
