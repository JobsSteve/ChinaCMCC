//
//  TFhtmlViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/16.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFhtmlViewController.h"

@interface TFhtmlViewController ()

@end

@implementation TFhtmlViewController
@synthesize HtmlWebView;
@synthesize htmlurlString;
@synthesize htmltitleString;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.title = htmltitleString;
    
    
    HtmlWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIGHT, self.view.bounds.size.height)];
    HtmlWebView.delegate = self;
    [self.view addSubview:HtmlWebView];
    
    
    [HtmlWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:htmlurlString]]];
    
    
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
