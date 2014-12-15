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
//        [self.tabBar insertSubview:v atIndex:0];
        self.tabBar.tintColor = [UIColor grayColor];
        
        

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self iniAllTabBarVC];
    
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(WIGHT-60, 0, 50, 35) Normal:nil Select:nil Title:@"信息"];
    [registButton addTarget:self action:@selector(ClickBt_pushregistVC) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:registButton];
    
//    
//            SlideNavigationController *firstNav = [[SlideNavigationController alloc]initWithRootViewController:self];
    
}

-(void)ClickBt_pushregistVC
{
    [[SlideNavigationController sharedInstance] toggleRightMenu];

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
    
    [self jshdf];
}


-(void)jshdf
{
    
    
    
//    TFfoodMarketViewController *leftMenu =[[TFfoodMarketViewController alloc]init];
    
    
   
//    [SlideNavigationController sharedInstance].rightMenu = leftMenu;
//    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    
    // Creating a custom bar button for right menu
//    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [button setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
//    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    [SlideNavigationController sharedInstance].rightBarButtonItem = rightBarButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Closed %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Opened %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Revealed %@", menu);
    }];
    

}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
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
