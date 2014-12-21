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
@interface TFhomeViewController ()<ImagePlayerViewDelegate,UIScrollViewDelegate,MSSlidingPanelControllerDelegate>
{
    UIScrollView *BottomScrollview;
    ImagePlayerView *imagePlayerView;
    NSArray *imagelist;
}

@property(nonatomic,strong)UIScrollView *BottomScrollview;

@property(nonatomic,strong)ImagePlayerView *imagePlayerView;
@property(nonatomic,strong)NSArray *imagelist;

@end

@implementation TFhomeViewController
@synthesize imagePlayerView;
@synthesize imagelist;
@synthesize BottomScrollview;

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
    self.view.backgroundColor = GrayColor_APP;
    [self initnavigationItem];
    [self initContentview];
    [self initBanner];
    [self inithomeMenuButton];
    [self inithomeProductsButton];
    
    
  
    
}



-(void)initContentview
{
    self.BottomScrollview = [UIScrollView ScrollViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49) contentSize:CGSizeMake(WIGHT, 600) tag:1];
    self.BottomScrollview.delegate = self;
    [self.view addSubview:self.BottomScrollview];
}

//banner 高度150
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

    TFhtmlViewController *VC = [[TFhtmlViewController alloc]init];
    VC.htmltitleString =  @"广告";
    VC.htmlurlString = @"http://www.baidu.com";
    [self.navigationController pushViewController:VC animated:YES];
    
}
//banner＝150 ＋间距10   y = 160 开始  height＝200
-(void)inithomeMenuButton
{
   
    UIView *Menu_Buttomview = [UIView ViewWithFrame:CGRectMake(0, 150, WIGHT, 220) :RGBAcolor(245, 245, 245,1)];
//    [Menu_Buttomview addSubview:[UIView lineViewWithx:0 y:0 wight:WIGHT :[UIColor grayColor]]];

    
    UIButton *button =[UIButton ButtonWithFrame:CGRectMake(10, 10, WIGHT/2-20, 200) Normal:[UIImage imageNamed:@"menu_1.png"] Select:[UIImage imageNamed:@"menu_1.png"] Title:nil];
    UIButton *button1 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2, 10, WIGHT/4-10, 60) Normal:[UIImage imageNamed:@"menu_2.png"] Select:[UIImage imageNamed:@"menu_2.png"] Title:nil];
    UIButton *button2 =[UIButton ButtonWithFrame:CGRectMake(WIGHT*3/4, 10, WIGHT/4-10, 60) Normal:[UIImage imageNamed:@"menu_3.png"] Select:[UIImage imageNamed:@"menu_3.png"] Title:nil];
    UIButton *button3 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2, 10+60+10, WIGHT/4-10, 60) Normal:[UIImage imageNamed:@"menu_4.png"] Select:[UIImage imageNamed:@"menu_4.png"] Title:nil];
    UIButton *button4 =[UIButton ButtonWithFrame:CGRectMake(WIGHT*3/4, 10+60+10, WIGHT/4-10, 60) Normal:[UIImage imageNamed:@"menu_5.png"] Select:[UIImage imageNamed:@"menu_5.png"] Title:nil];
    UIButton *button5 =[UIButton ButtonWithFrame:CGRectMake(WIGHT/2, 10+60*2+10*2, WIGHT/4-10, 60) Normal:[UIImage imageNamed:@"menu_6.png"] Select:[UIImage imageNamed:@"menu_6.png"] Title:nil];
    UIButton *button6 =[UIButton ButtonWithFrame:CGRectMake(WIGHT*3/4, 10+60*2+10*2, WIGHT/4-10, 60) Normal:[UIImage imageNamed:@"menu_7.png"] Select:[UIImage imageNamed:@"menu_7.png"] Title:nil];
    
    /*
    UILabel *label = [UILabel RightLabelWithFrame:CGRectMake(button.frame.size.width-60, button.frame.size.height-25, 50, 30) text:@"蔬菜" color:RGBAcolor(70, 150, 0, 1) font:16];
    UILabel *label1 = [UILabel RightLabelWithFrame:CGRectMake(button1.frame.size.width-60, button1.frame.size.height-25, 60, 30) text:@"肉/禽类" color:RGBAcolor(180, 40, 60, 1) font:12];
    UILabel *label2 = [UILabel RightLabelWithFrame:CGRectMake(button2.frame.size.width-70, button2.frame.size.height-25, 70, 30) text:@"鱼/水产品" color:RGBAcolor(40, 180, 2200, 1) font:12];
    UILabel *label3 = [UILabel RightLabelWithFrame:CGRectMake(button3.frame.size.width-70, button3.frame.size.height-25, 70, 30) text:@"蛋/豆制品" color:RGBAcolor(170, 80, 40, 1) font:12];
    UILabel *label4 = [UILabel RightLabelWithFrame:CGRectMake(button4.frame.size.width-60, button4.frame.size.height-25, 60, 30) text:@"熟食" color:RGBAcolor(150, 30, 0, 1) font:12];
    UILabel *label5 = [UILabel RightLabelWithFrame:CGRectMake(button5.frame.size.width-90, button5.frame.size.height-25, 90, 30) text:@"米/油/调味品" color:RGBAcolor(80, 30, 0, 1) font:12];
    UILabel *label6 = [UILabel RightLabelWithFrame:CGRectMake(button6.frame.size.width-60, button6.frame.size.height-25, 60, 30) text:@"其他" color:RGBAcolor(255, 255, 255, 1) font:12];

     */
    UILabel *label = [UILabel RightLabelWithFrame:CGRectMake(button.frame.size.width-60, button.frame.size.height-25, 50, 30) text:@"蔬菜" color:RGBAcolor(70, 150, 0, 1) font:16];
    UILabel *label1 = [UILabel RightLabelWithFrame:CGRectMake(button1.frame.size.width-60, button1.frame.size.height-25, 60, 30) text:@"肉/禽类" color:[UIColor whiteColor] font:12];
    UILabel *label2 = [UILabel RightLabelWithFrame:CGRectMake(button2.frame.size.width-70, button2.frame.size.height-25, 70, 30) text:@"鱼/水产品" color:RGBAcolor(40, 180, 2200, 1) font:12];
    UILabel *label3 = [UILabel RightLabelWithFrame:CGRectMake(button3.frame.size.width-70, button3.frame.size.height-25, 70, 30) text:@"蛋/豆制品" color:RGBAcolor(40, 180, 2200, 1) font:12];
    UILabel *label4 = [UILabel RightLabelWithFrame:CGRectMake(button4.frame.size.width-60, button4.frame.size.height-25, 60, 30) text:@"熟食" color:[UIColor blackColor] font:12];
    UILabel *label5 = [UILabel RightLabelWithFrame:CGRectMake(button5.frame.size.width-90, button5.frame.size.height-25, 90, 30) text:@"米/油/调味品" color:RGBAcolor(80, 30, 0, 1) font:12];
    UILabel *label6 = [UILabel RightLabelWithFrame:CGRectMake(button6.frame.size.width-60, button6.frame.size.height-25, 60, 30) text:@"其他" color:RGBAcolor(255, 255, 255, 1) font:12];
    NSArray *list = @[label,label1,label2,label3,label4,label5,label6];

    
    NSArray *buttonlist =@[button,button1,button2,button3,button4,button5,button6];
    int i=0;
    for (UIButton *btn in buttonlist) {
        [btn addSubview:list[i]];

        [btn addTarget:self action:@selector(pushthis) forControlEvents:UIControlEventTouchUpInside];
        [Menu_Buttomview addSubview:btn];
        i++;
    }

    [self.BottomScrollview addSubview:Menu_Buttomview];;

}
// 360 + 10 , y =370开始
-(void)inithomeProductsButton
{
    UIView *Product_Buttomview = [UIView ViewWithFrame:CGRectMake(0, 370, WIGHT, 200) :[UIColor whiteColor]];
    [Product_Buttomview addSubview:[UIView lineViewWithx:0 y:0 wight:WIGHT :RGBAcolor(210, 210, 210, 1)]];

    [Product_Buttomview addSubview:[UIImageView imageViewWithFrame:CGRectMake(10, 0, 80, 30) :@"hometitle_image.png" ]];
    
    
    
    for (int i=0; i<2; i++) {
        for (int j=0; j<3; j++) {
            NSArray *imagename_list = (i==0?@[@"product_1.png",@"product_2.png",@"product_3.png"]:@[@"product_4.png",@"product_5.png",@"product_6.png"]);
             // [NSString stringWithFormat:@"product_%d.png",i*j+j];
            //imagename_list[j]
            UIButton *button =[UIButton ButtonWithFrame:CGRectMake(10+j*(WIGHT-10*2)/3, 40+i*80, (WIGHT-25*2)/3, 80) Normal:[UIImage imageNamed:@"product_2.png"] Select:[UIImage imageNamed:@"product_2.png"] Title:nil];
            [Product_Buttomview addSubview:button];

        }
    }
    [self.BottomScrollview addSubview:Product_Buttomview];
    
    UIView *line =[UIView lineViewWithx:WIGHT/3 y:40 height:160 :GrayColor_APP];
    UIView *line2 =[UIView lineViewWithx:WIGHT*2/3 y:40 height:160 :GrayColor_APP];
    UIView *line3 =[UIView lineViewWithx:10 y:120 wight:300 :GrayColor_APP];

    [Product_Buttomview addSubview:line];
    [Product_Buttomview addSubview:line2];
    [Product_Buttomview addSubview:line3];


    
}







-(void)pushthis
{
    TFloginViewController *VC = [[TFloginViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
}

-(void)initnavigationItem
{
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(0, 0, 40, 35) Normal:nil Select:nil Title:@"我"];
    [registButton addTarget:[self slidingPanelController] action:@selector(openLeftPanel) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registButton];
    
}
-(void)ClickBt_submitorderVC:(UIButton*)btn
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
