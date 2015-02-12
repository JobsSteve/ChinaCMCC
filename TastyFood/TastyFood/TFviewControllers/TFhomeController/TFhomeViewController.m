//
//  TFhomeViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFhomeViewController.h"
#import "TFloginViewController.h"
#import "TFhtmlViewController.h"
#import "TFsingleCategoryViewController.h"
#import "TFfoodMarketViewController.h"
@interface TFhomeViewController ()<ImagePlayerViewDelegate,UIScrollViewDelegate,MSSlidingPanelControllerDelegate>
{
    UIScrollView *BottomScrollview;
    ImagePlayerView *imagePlayerView;
    
    NSArray *dataSourceArray;
    NSArray *imagelist;
}

@property(nonatomic,strong)UIScrollView *BottomScrollview;

@property(nonatomic,strong)ImagePlayerView *imagePlayerView;
@property(nonatomic,strong)NSArray *imagelist;
@property(nonatomic,strong)NSArray *dataSourceArray;

@end

@implementation TFhomeViewController
@synthesize imagePlayerView;
@synthesize imagelist;
@synthesize BottomScrollview;
@synthesize dataSourceArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"美家鲜生";

        self.tabBarItem =  [self.tabBarItem initWithTitle:@"美家鲜生" image:[UIImage imageNamed:@"tabbar_01.png"] selectedImage:[UIImage imageNamed:@"tabbar_01.png"]];
        [self getbannerPic];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GrayColor_APP;
    [self initnavigationItem];
    [self initContentview];
//    [self initBanner];
    [self inithomeMenuButton];
    [self initbottomMenuButton];
    
    
  
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}


-(void)initContentview
{
    self.BottomScrollview = [UIScrollView ScrollViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49) contentSize:CGSizeMake(WIGHT, 940) tag:1];
    self.BottomScrollview.delegate = self;
    [self.view addSubview:self.BottomScrollview];
}

//banner 高度150
-(void)initBanner
{
    
    NSString *string_r = @"http://www.6meijia.com";
    NSMutableArray *temparray = [NSMutableArray arrayWithCapacity:1];
    for (NSDictionary *dic in self.dataSourceArray) {
    [temparray addObject: [NSURL URLWithString: [string_r stringByAppendingString:dic[@"imageurl"]]]];
    }
    self.imagePlayerView = [[ImagePlayerView alloc]initWithFrame:CGRectMake(0, 0, WIGHT, 150)];
    self.imagelist  = (NSArray*)temparray;
    [self.imagePlayerView initWithCount:self.imagelist.count delegate:self];
    self.imagePlayerView.scrollInterval = 5.0f;
    self.imagePlayerView.hidePageControl = NO;
    self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomRight;
    [self.BottomScrollview addSubview:self.imagePlayerView];
}

#pragma mark - ImagePlayerViewDelegate
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
     [imageView setImageWithURL:[self.imagelist objectAtIndex:index]];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"点击第%d张图片", (int)index);
//
//    TFhtmlViewController *VC = [[TFhtmlViewController alloc]init];
//    VC.htmltitleString =  @"广告";
//    VC.htmlurlString = @"http://www.baidu.com";
//    [self.navigationController pushViewController:VC animated:YES];
    
}
-(void)inithomeMenuButton
{
    
    UIView *Menu_Buttomview = [UIView ViewWithFrame:CGRectMake(0, 150, WIGHT, 370) :RGBAcolor(245, 245, 245,1)];
    UIButton *b_ti = [UIButton ButtonWithFrame:CGRectMake(10, 5, WIGHT-20, 35) Normal:nil Select:nil Title:@"平价菜场"];
    b_ti.backgroundColor= RGBAcolor(40, 180, 180, 1);
    [Menu_Buttomview addSubview:b_ti];
    
    
    UIButton *button =[UIButton ButtonWithFrame:CGRectMake(10, 10+40, WIGHT/2, 180) Normal:[UIImage imageNamed:@"index_veg.png"] Select:[UIImage imageNamed:@"index_veg.png"] Title:nil];
    
    UIButton *button1 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2+20, 10+40, WIGHT/2-30, 80) Normal:[UIImage imageNamed:@"index_meat.png"] Select:[UIImage imageNamed:@"index_meat.png"] Title:nil];
    UIButton *button2 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2+20, 90+20+40, WIGHT/2-30, 80) Normal:[UIImage imageNamed:@"index_shrimp.png"] Select:[UIImage imageNamed:@"index_shrimp.png"] Title:nil];
    
    
    UIButton *button3 =[UIButton ButtonWithFrame:CGRectMake(10, 210+40, WIGHT/2, 80) Normal:[UIImage imageNamed:@"index_egg.png"] Select:[UIImage imageNamed:@"index_egg.png"] Title:nil];
    
   UIButton *button4 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2+20, 210+40, WIGHT/2-30, 80) Normal:[UIImage imageNamed:@"index_rice.png"] Select:[UIImage imageNamed:@"index_rice.png"] Title:nil];
    
   
    
    
    
    UILabel *label = [UILabel leftLabelWithFrame:CGRectMake(10, 230, 50, 20) text:@"蔬菜" color:[UIColor blackColor] font:12];
    UILabel *label1 = [UILabel leftLabelWithFrame:CGRectMake(WIGHT/2+20, 130, 80, 20) text:@"肉/禽类" color:[UIColor blackColor] font:12];
    UILabel *label2 = [UILabel leftLabelWithFrame:CGRectMake(WIGHT/2+20, 230, 100, 20) text:@"鱼/水产品" color:[UIColor blackColor] font:12];
    UILabel *label3 = [UILabel leftLabelWithFrame:CGRectMake(10, 330, 100, 20) text:@"蛋/豆制品" color:[UIColor blackColor] font:12];
    
    UILabel *label4 = [UILabel leftLabelWithFrame:CGRectMake(WIGHT/2+20, 330, 80, 20) text:@"米/油/调味品" color:[UIColor blackColor] font:12];

    
    
    NSArray *list = @[label,label1,label2,label3,label4];
    
    
    NSArray *buttonlist =@[button,button1,button2,button3,button4];
    NSArray *labellist =@[label,label1,label2,label3,label4];
    
    int i=0;
    for (UIButton *btn in buttonlist) {
        UILabel *label_temp =(UILabel*) [labellist objectAtIndex:i];
        [btn bindData:@"category_name" Value:[NSNumber numberWithInteger:i]];
        [btn addTarget:self action:@selector(pushtocategory:) forControlEvents:UIControlEventTouchUpInside];
        [Menu_Buttomview addSubview:btn];
        [Menu_Buttomview addSubview:list[i]];
        i++;
    }
    
    [self.BottomScrollview addSubview:Menu_Buttomview];;
    
}

-(void)initbottomMenuButton
{
    
    UIView *Menu_Buttomview2 = [UIView ViewWithFrame:CGRectMake(0, 540, WIGHT, 400) :RGBAcolor(245, 245, 245,1)];
    UIButton *b_ti = [UIButton ButtonWithFrame:CGRectMake(10, 5, WIGHT-20, 35) Normal:nil Select:nil Title:@"高端食材"];
    b_ti.backgroundColor= RGBAcolor(40, 180, 180, 1);
    [Menu_Buttomview2 addSubview:b_ti];
    
    
    UIButton *button =[UIButton ButtonWithFrame:CGRectMake(10, 10+40, WIGHT/2, 180) Normal:[UIImage imageNamed:@"index_fruits.png"] Select:[UIImage imageNamed:@"index_fruits.png"] Title:nil];
    
    UIButton *button1 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2+20, 10+40, WIGHT/2-30, 80) Normal:[UIImage imageNamed:@"index_Organic.png"] Select:[UIImage imageNamed:@"index_Organic.png"] Title:nil];
    UIButton *button2 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2+20, 90+20+40, WIGHT/2-30, 80) Normal:[UIImage imageNamed:@"index_import.png"] Select:[UIImage imageNamed:@"index_import.png"] Title:nil];
    
    
    UIButton *button3 =[UIButton ButtonWithFrame:CGRectMake(10, 210+40, WIGHT/2, 80) Normal:[UIImage imageNamed:@"index_seafood.png"] Select:[UIImage imageNamed:@"index_seafood.png"] Title:nil];
    UIButton *button4 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2+20, 210+40, WIGHT/2-30, 80) Normal:[UIImage imageNamed:@"index_drink.png"] Select:[UIImage imageNamed:@"index_drink.png"] Title:nil];
    
    
    
    
    UILabel *label = [UILabel leftLabelWithFrame:CGRectMake(10, 230, 50, 20) text:@"全球水果" color:[UIColor blackColor] font:12];
    UILabel *label1 = [UILabel leftLabelWithFrame:CGRectMake(WIGHT/2+20, 130, 80, 20) text:@"有机食品" color:[UIColor blackColor] font:12];
    UILabel *label2 = [UILabel leftLabelWithFrame:CGRectMake(WIGHT/2+20, 230, 100, 20) text:@"进口美食" color:[UIColor blackColor] font:12];
    UILabel *label3 = [UILabel leftLabelWithFrame:CGRectMake(10, 330, 100, 20) text:@"精选海鲜" color:[UIColor blackColor] font:12];
    UILabel *label4 = [UILabel leftLabelWithFrame:CGRectMake(WIGHT/2+20, 330, 80, 20) text:@"中外名酒" color:[UIColor blackColor] font:12];
    NSArray *list = @[label,label1,label2,label3,label4];
    
    
    NSArray *buttonlist =@[button,button1,button2,button3,button4];
    NSArray *labellist =@[label,label1,label2,label3,label4];
    
    int i=0;
    for (UIButton *btn in buttonlist) {
        UILabel *label_temp =(UILabel*) [labellist objectAtIndex:i];
        [btn bindData:@"category_name" Value:label_temp.text];
        [btn addTarget:self action:@selector(pushtogaoduanvc:) forControlEvents:UIControlEventTouchUpInside];
        [Menu_Buttomview2 addSubview:btn];
        [Menu_Buttomview2 addSubview:list[i]];
        i++;
    }
    
    [self.BottomScrollview addSubview:Menu_Buttomview2];;
    
}




-(void)pushtocategory:(UIButton*)btn
{
    SetDefaults(@"currentSegment", [btn getData:@"category_name"]);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changetabbarindex1" object:nil];
}

-(void)pushtogaoduanvc:(UIButton*)btn
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"changetabbarindex2" object:nil];
}

-(void)initnavigationItem
{
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(0, 0, 35, 35) Normal:[UIImage imageNamed:@"location.png"] Select:[UIImage imageNamed:@"location.png"] Title:nil];
    [registButton addTarget:[self slidingPanelController] action:@selector(openLeftPanel) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registButton];
    
}
-(void)getbannerPic
{
    [SVProgressHUD showWithStatus:@"..."];
    [ASIHttpMangment getbannerinfoWithRequestURL: @"http://6meijia.com/getActivityMobile" pragram:nil success:^(NSDictionary *resultObject) {
        NSLog(@"banner list:%@",[resultObject objectForKey:@"responsedata"]);
        
        
        self.dataSourceArray =[resultObject objectForKey:@"responsedata"];
        [SVProgressHUD showSuccessWithStatus:@"success"];
        [self initBanner];
        
    } fail:^(NSDictionary *errdic) {
        NSLog(@"login fail!");
        [SVProgressHUD showSuccessWithStatus:@"fail"];
        [UIView animateWithDuration:2 animations:^{
            [SVProgressHUD dismiss];
        }];
        
    }];
    
    

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
