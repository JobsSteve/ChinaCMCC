//
//  TFpersonViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFpersonViewController.h"
#import "TFloginViewController.h"
@interface TFpersonViewController ()

@end

@implementation TFpersonViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我";
        self.tabBarItem =  [self.tabBarItem initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_03.png"] selectedImage:[UIImage imageNamed:@"tabbar_03.png"]];

    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@",GetDefaults(Defaults_LoginName));
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (GetDefaults(Defaults_LoginName)==nil) {
        TFloginViewController *VC = [[TFloginViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
   
    
    // Do any additional setup after loading the view.
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
