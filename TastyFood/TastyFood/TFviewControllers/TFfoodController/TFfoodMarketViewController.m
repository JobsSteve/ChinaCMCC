//
//  TFfoodMarketViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFfoodMarketViewController.h"

@interface TFfoodMarketViewController ()

@end

@implementation TFfoodMarketViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"美家菜场";
       self.tabBarItem =  [self.tabBarItem initWithTitle:@"美家菜场" image:[UIImage imageNamed:@"tabbar_02.png"] selectedImage:[UIImage imageNamed:@"tabbar_02.png"]];
    }
    return self;
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
