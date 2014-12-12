//
//  TFhomeViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFhomeViewController.h"
#import "TFloginViewController.h"
@interface TFhomeViewController ()<ImagePlayerViewDelegate>
{
    ImagePlayerView *imagePlayerView;
    NSArray *imagelist;
}
@property(nonatomic,strong)ImagePlayerView *imagePlayerView;
@property(nonatomic,strong)NSArray *imagelist;

@end

@implementation TFhomeViewController
@synthesize imagePlayerView;
@synthesize imagelist;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"首页";
        self.tabBarItem =  [self.tabBarItem initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_01.png"] selectedImage:[UIImage imageNamed:@"tabbar_01.png"]];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initBanner];
    [self inithomeMenuButton];
    
}

-(void)initBanner
{
    self.imagePlayerView = [[ImagePlayerView alloc]initWithFrame:CGRectMake(0, 0, WIGHT, 150)];
    self.imagelist  = @[[NSURL URLWithString:@"http://www.ghzw.cn/wzsq/UploadFiles_9194/201109/20110915154150869.bmp"],
                       [NSURL URLWithString:@"http://sudasuta.com/wp-content/uploads/2013/10/10143181686_375e063f2c_z.jpg"],
                       [NSURL URLWithString:@"http://www.yancheng.gov.cn/ztzl/zgycddhsdgy/xwdt/201109/W020110902584601289616.jpg"],
                       [NSURL URLWithString:@"http://fzone.oushinet.com/bbs/data/attachment/forum/201208/15/074140zsb6ko6hfhzrb40q.jpg"]];
    [self.imagePlayerView initWithCount:self.imagelist.count delegate:self];
    self.imagePlayerView.scrollInterval = 5.0f;
    self.imagePlayerView.hidePageControl = NO;
    self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomRight;
    [self.view addSubview:self.imagePlayerView];
}

#pragma mark - ImagePlayerViewDelegate
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
     [imageView setImageWithURL:[self.imagelist objectAtIndex:index]];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"点击第%d张图片", (int)index);
}
-(void)inithomeMenuButton
{
   
    
    UIButton *button =[UIButton ButtonWithFrame:CGRectMake(10, 160, 140, 200) Normal:[UIImage imageNamed:@"menu_1.png"] Select:[UIImage imageNamed:@"menu_1.png"] Title:nil];
    UIButton *button1 =[UIButton ButtonWithFrame:CGRectMake(160, 160, 70, 60) Normal:[UIImage imageNamed:@"menu_2.png"] Select:[UIImage imageNamed:@"menu_2.png"] Title:nil];
    UIButton *button2 =[UIButton ButtonWithFrame:CGRectMake(240, 160, 70, 60) Normal:[UIImage imageNamed:@"menu_3.png"] Select:[UIImage imageNamed:@"menu_3.png"] Title:nil];
    UIButton *button3 =[UIButton ButtonWithFrame:CGRectMake(160, 160+60+10, 70, 60) Normal:[UIImage imageNamed:@"menu_4.png"] Select:[UIImage imageNamed:@"menu_4.png"] Title:nil];
    UIButton *button4 =[UIButton ButtonWithFrame:CGRectMake(240, 160+60+10, 70, 60) Normal:[UIImage imageNamed:@"menu_5.png"] Select:[UIImage imageNamed:@"menu_5.png"] Title:nil];
    UIButton *button5 =[UIButton ButtonWithFrame:CGRectMake(160, 160+60*2+10*2, 70, 60) Normal:[UIImage imageNamed:@"menu_6.png"] Select:[UIImage imageNamed:@"menu_6.png"] Title:nil];
    UIButton *button6 =[UIButton ButtonWithFrame:CGRectMake(240, 160+60*2+10*2, 70, 60) Normal:[UIImage imageNamed:@"menu_7.png"] Select:[UIImage imageNamed:@"menu_7.png"] Title:nil];
    
    
    
    
    [self.view addSubview:button];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    [self.view addSubview:button5];
    [self.view addSubview:button6];

    [button addTarget:self action:@selector(pushthis) forControlEvents:UIControlEventTouchUpInside];

}







-(void)pushthis
{
    TFloginViewController *VC = [[TFloginViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
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
