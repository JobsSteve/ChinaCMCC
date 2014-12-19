//
//  TFMainTabbarController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFMainTabbarController.h"


#import "TFhomeViewController.h"
#import "TFfoodMarketViewController.h"
#import "TFloginViewController.h"
#import "TFshoppingcartViewController.h"
#import "TFpersonViewController.h"
#import "MSSlidingPanelController.h"
#import "MSViewControllerSlidingPanel.h"

@interface TFMainTabbarController ()<MenuTabbarViewDelegate>
{
    MenuTabbarView *Menutabbar;
    
}
@property(nonatomic,retain)MenuTabbarView *Menutabbar;

@end

@implementation TFMainTabbarController
@synthesize Menutabbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect frame = CGRectMake(WIGHT-WIGHT/4, -23, 80, 70);
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:frame];
        imageview.image = [UIImage imageNamed:@"shapchart.png"];
        [self.tabBar insertSubview:imageview atIndex:5];
        self.tabBar.tintColor = GreenColor_APP ;

//
//        self.tabBar.backgroundImage = [UIImage imageNamed:@"Toolbarbac1k.png"];

        
//        [self.tabBar setClipsToBounds:YES];
//        self.tabBar.frame =CGRectMake(0, self.view.bounds.size.height-79, WIGHT, 79);
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6)
        {
            [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"Toolbarbac1k.png"]];
        }
        
        
//        self.tabBar.alpha =0;


    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    [self iniAllTabBarVC];
    
}

-(void)iniAllTabBarVC
{
    

    
    
        TFhomeViewController *home_VC = [[TFhomeViewController alloc]init];
        UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:home_VC];


        TFfoodMarketViewController *foodMarket_VC = [[TFfoodMarketViewController alloc]init];
        UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:foodMarket_VC];
    
        
        TFpersonViewController *person_VC = [[TFpersonViewController alloc]init];
        UINavigationController *thirdNav = [[UINavigationController alloc]initWithRootViewController:person_VC];
        
        
        TFshoppingcartViewController *shoppingcart_VC = [[TFshoppingcartViewController alloc]init];
        UINavigationController *fourNav = [[UINavigationController alloc]initWithRootViewController:shoppingcart_VC];
        
        firstNav.navigationBar.translucent = NO;
        secondNav.navigationBar.translucent = NO;
        thirdNav.navigationBar.translucent = NO;
        fourNav.navigationBar.translucent = NO;
    
        firstNav.navigationBar.tintColor = [UIColor whiteColor];
        secondNav.navigationBar.tintColor = [UIColor whiteColor];
        thirdNav.navigationBar.tintColor = [UIColor whiteColor];
        fourNav.navigationBar.tintColor = [UIColor whiteColor];
    
        NSArray *viewControls = @[firstNav,secondNav,thirdNav,fourNav];
        [self setViewControllers:viewControls animated:YES];
    
}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
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
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

/**
 *  Tells the delegate that the specified side has been closed.
 *
 *  @param panelController The panel controller.
 *  @param side            The side.
 */
- (void)slidingPanelController:(MSSlidingPanelController *)panelController hasClosedSide:(MSSPSideDisplayed)side
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
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
