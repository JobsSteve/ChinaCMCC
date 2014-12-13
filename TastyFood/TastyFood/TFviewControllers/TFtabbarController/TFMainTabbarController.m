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
@interface TFMainTabbarController ()

@end

@implementation TFMainTabbarController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect frame = CGRectMake(WIGHT-WIGHT/4, -20, 80, 70);
        UIView *v = [[UIView alloc] initWithFrame:frame];
        v.backgroundColor = [UIColor redColor];
        [self.tabBar insertSubview:v atIndex:0];
        self.tabBar.tintColor = [UIColor grayColor];
        
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
