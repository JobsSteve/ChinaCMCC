//
//  TFsuperfoodViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/25.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFsuperfoodViewController.h"
#import "superMenu.h"
@interface TFsuperfoodViewController ()<superMenuViewDelegate>

@end

@implementation TFsuperfoodViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"高端食材";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *imageView = [UIImageView imageViewWithFrame:self.view.bounds :@"superbackground.png"];
    [self.view addSubview:imageView];
    
    
    superMenu *superMenuview = [[superMenu alloc]initWithFrame:CGRectMake(0, 40, WIGHT, 200)];
    superMenuview.delegate=self;
    [self.view addSubview:superMenuview];
    
    // Do any additional setup after loading the view.
}
-(void)didselectChartSelectbuttonView:(NSInteger)indexButton
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
