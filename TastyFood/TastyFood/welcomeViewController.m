//
//  welcomeViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/14.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "welcomeViewController.h"
#import "TFMainTabbarController.h"
@interface welcomeViewController ()

@end

@implementation welcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton ButtonWithFrame:CGRectMake(100, 100, 50, 50) Normal:nil Select:nil Title:@"asflkha"];
    [button addTarget:self action:@selector(sfkljask) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}
-(void)sfkljask
{
    TFMainTabbarController *TabbarVC = [[TFMainTabbarController alloc]init];

    [self.navigationController pushViewController:TabbarVC animated:NO];
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
