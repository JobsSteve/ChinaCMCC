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
        self.titlesList       = @[@"首页",@"平价菜场",@"高端食材",@"个人",@""];
        self.iconsList_normal = @[@"tabbar_01.png",@"tabbar_02.png",@"tabbar_03.png",@"tabbar_04.png",@""];
        self.iconsList_selected = @[@"tabbar_01selct.png",@"tabbar_02selct.png",@"tabbar_03selct.png",@"tabbar_04selct.png",@""];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changebadgeNum) name:@"checkshopchartBadge" object:nil];
        
        [self addNotification];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {

    @autoreleasepool {
        
    for (int i=0; i<5; i++) {

        self.MenuButton = [UIButton ButtonWithFrame:CGRectMake(WIGHT/5*i, 2, WIGHT/5, 49) topNormalimage:[UIImage imageNamed:self.iconsList_normal[i]] topSlectimage:nil Title:self.titlesList[i] titleColor:[UIColor grayColor]];

        if (selectIndex==i) {
            self.MenuButton =[UIButton ButtonWithFrame:CGRectMake(WIGHT/5*i, 2, WIGHT/5, 49) topNormalimage:[UIImage imageNamed:self.iconsList_selected[selectIndex]] topSlectimage:nil Title:self.titlesList[selectIndex] titleColor:GreenColor_APP];
        }
        
        [self.MenuButton addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
        self.MenuButton.tag = i;
        [self addSubview:self.MenuButton];
    }

        
        
        UIImageView *iamg1e = [UIImageView imageViewWithFrame:CGRectMake(WIGHT-WIGHT/5-8, -32, WIGHT/5, 79-10) :@"tabbarchart.png"];
        [self addSubview:iamg1e];
        
        
        
        
        badgeView = [[JSBadgeView alloc] initWithParentView:iamg1e alignment:JSBadgeViewAlignmentCenterRight];
        badgeView.badgePositionAdjustment = CGPointMake(-15, -23);
        badgeView.badgeShadowColor = [UIColor whiteColor];
        badgeView.badgeBackgroundColor = YellowColor_APP;

       int num = [GetDefaults(@"chopchartNum") intValue];
        NSMutableArray *shopchatlist = [NSMutableArray arrayWithArray:GetDefaults(@"shopchartlist")];

        if (shopchatlist.count>0) {
            badgeView.badgeText = [NSString stringWithFormat:@"%lu", (unsigned long)shopchatlist.count];
            badgeView.hidden=NO;
        }else{
            badgeView.hidden=YES;

        }
    }

}
-(void)changebadgeNum
{
    
    NSMutableArray *shopchatlist = [NSMutableArray arrayWithArray:GetDefaults(@"shopchartlist")];
//
    badgeView.badgeText = [NSString stringWithFormat:@"%lu", (unsigned long)shopchatlist.count];
    if (shopchatlist.count==0) {
        badgeView.hidden =YES;
    }else
    {
        badgeView.hidden =NO;

    }
    
    
    
    

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



-(void)addNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTabbarIndex1) name:@"changetabbarindex1" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeTabbarIndex2) name:@"changetabbarindex2" object:nil];


}

-(void)changeTabbarIndex1
{
    
    UIButton *btn = [[UIButton alloc]init];
    btn.tag= 1;
    [self menuAction:btn];
}

-(void)changeTabbarIndex2
{
    
    UIButton *btn = [[UIButton alloc]init];
    btn.tag= 2;
    [self menuAction:btn];
}
@end
