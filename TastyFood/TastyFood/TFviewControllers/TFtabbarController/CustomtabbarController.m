//
//  CustomtabbarController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/17.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "CustomtabbarController.h"
#import "MenuTabbarView.h"

#import "TFhomeViewController.h"
#import "TFfoodMarketViewController.h"
#import "TFloginViewController.h"
#import "TFshoppingcartViewController.h"
#import "TFpersonViewController.h"
#import "TFregionViewController.h"
#import "TFsuperfoodViewController.h"
@interface CustomtabbarController ()<MenuTabbarViewDelegate,UITabBarControllerDelegate>
{
    MenuTabbarView *Menutabbar;
    
}
@property(nonatomic,retain)MenuTabbarView *Menutabbar;

@end

@implementation CustomtabbarController
@synthesize Menutabbar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self iniAllTabBarVC];
    
    self.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor grayColor];
    
    
    UIView *view = [UIView ViewWithFrame:CGRectMake(0, self.view.frame.size.height-79, WIGHT, 79) :[UIColor clearColor]];
    [self.view addSubview:view];
    UIImageView *iamge = [UIImageView imageViewWithFrame:CGRectMake(0, 0, WIGHT, 79) :@"Toolbarback.png"];
    [view addSubview:iamge];
    
    
    
    self.Menutabbar = [[MenuTabbarView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49, WIGHT, 49)];
    [self.view addSubview:self.Menutabbar];
    self.Menutabbar.delegate =self;
    self.selectedIndex= 0;

    
    
    
}
-(void)getinfo:(int)index
{
    self.selectedIndex = index;
}

-(void)iniAllTabBarVC{
    
    
    TFhomeViewController *home_VC = [[TFhomeViewController alloc]init];
    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:home_VC];
    
    
    TFfoodMarketViewController *foodMarket_VC = [[TFfoodMarketViewController alloc]init];
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:foodMarket_VC];
    
    TFsuperfoodViewController *superfoodMarket_VC = [[TFsuperfoodViewController alloc]init];
    UINavigationController *thirdNav = [[UINavigationController alloc]initWithRootViewController:superfoodMarket_VC];
    
    
    TFpersonViewController *person_VC = [[TFpersonViewController alloc]init];
    UINavigationController *fourNav = [[UINavigationController alloc]initWithRootViewController:person_VC];
    
    
    
    TFshoppingcartViewController *shoppingcart_VC = [[TFshoppingcartViewController alloc]init];
    UINavigationController *fiveNav = [[UINavigationController alloc]initWithRootViewController:shoppingcart_VC];
    
    firstNav.navigationBar.translucent = NO;
    secondNav.navigationBar.translucent = NO;
    thirdNav.navigationBar.translucent = NO;
    fourNav.navigationBar.translucent = NO;
    fiveNav.navigationBar.translucent = NO;
    
    firstNav.navigationBar.tintColor = [UIColor whiteColor];
    secondNav.navigationBar.tintColor = [UIColor whiteColor];
    thirdNav.navigationBar.tintColor = [UIColor whiteColor];
    fourNav.navigationBar.tintColor = [UIColor whiteColor];
    fiveNav.navigationBar.tintColor = [UIColor whiteColor];

    
    NSArray *viewControls = @[firstNav,secondNav,thirdNav,fourNav,fiveNav];
    [self setViewControllers:viewControls animated:YES];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
#pragma mark MSSlidingPanelControllerDelegate protocol
/** @name MSSlidingPanelControllerDelegate protocol */

/**
 *  Tells the delegate that the specified side begins to bring out.
 *
 *  @param panelController The panel controller.
 *  @param side            The side.
 */
- (void)slidingPanelController:(MSSlidingPanelController *)panelController beginsToBringOutSide:(MSSPSideDisplayed)side
{
    
    
    
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

/**
 *  Tells the delegate that the specified side has been closed.
 *
 *  @param panelController The panel controller.
 *  @param side            The side.
 */
- (void)slidingPanelController:(MSSlidingPanelController *)panelController hasClosedSide:(MSSPSideDisplayed)side
{
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    TFregionViewController *VC =[[TFregionViewController alloc]init];
    [self.tabBarController.navigationController pushViewController:VC animated:NO];
}

/**
 *  Tells the delegate that the specified side has been opened.
 *
 *  @param panelController The panel controller.
 *  @param side            The side.
 */
- (void)slidingPanelController:(MSSlidingPanelController *)panelController hasOpenedSide:(MSSPSideDisplayed)side
{
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
