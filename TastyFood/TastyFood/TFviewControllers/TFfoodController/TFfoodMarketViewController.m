//
//  TFfoodMarketViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFfoodMarketViewController.h"
#import "ShopImage.h"
#import "XHRefreshControl.h"

NSString *const MJTableViewCellIdentifier = @"Cell";


@interface TFfoodMarketViewController ()<UITableViewDataSource,UITableViewDelegate,XHRefreshControlDelegate>
{
    UITableView *tableview;
    NSMutableArray *dataSource;
    NSInteger Current_SegmentIndex;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,assign)NSInteger Current_SegmentIndex;


@end

@implementation TFfoodMarketViewController
@synthesize dataSource;
@synthesize Current_SegmentIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"美家菜场";
       self.tabBarItem =  [self.tabBarItem initWithTitle:@"美家菜场" image:[UIImage imageNamed:@"tabbar_02.png"] selectedImage:[UIImage imageNamed:@"tabbar_02.png"]];
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSegment];

    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 40, WIGHT, self.view.frame.size.height-49-40-64) tag:2];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:MJTableViewCellIdentifier];
    
    // 2.集成刷新控件
    [self setupRefresh];

    
    
    // Do any additional setup after loading the view.
}

-(void)initSegment
{
    UIView *segmentbackgroundview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 40) :GrayColor_APP];
    
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"蔬菜",@"肉类",@"水产",@"豆制品",@"熟食",@"调味品",@"其他"]];
    segment.frame = CGRectMake(10, 5, WIGHT-20, 30);
    segment.tintColor = GreenColor_APP;
    segment.backgroundColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    [segment addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];  //添加委托方法

    [segmentbackgroundview addSubview:segment];
    [self.view addSubview:segmentbackgroundview];
    
}
#pragma mark ---------TableViewDataSource And TableViewDelegate
-(void)segmentAction:(UISegmentedControl*)segment
{
    self.Current_SegmentIndex = segment.selectedSegmentIndex;
    [self.tableview headerBeginRefreshing];
    
    
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.dataSource.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CelebrityCheckTableCell";
    [tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor blackColor];
        
    }
    
    [cell.contentView addSubview:[CellViews CellViewWithShoplist:self.dataSource[indexPath.row]]];
   
    UIButton *jionButton = (UIButton*)[cell.contentView viewWithTag:201];
    [jionButton bindData:@"sa" Value:indexPath];
    [jionButton addTarget:self action:@selector(jionchartAction:) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    return cell;
    
}

//加入购物车 步骤1
-(void)jionchartAction:(UIButton *)shopCarBtt{
    //得到产品信息
    UITableViewCell *cell = (UITableViewCell *)[shopCarBtt superview];
    CGRect cellRectss = [self.view convertRect:cell.frame fromView:self.tableview];
    CGRect cellRect = [self.tableview rectForRowAtIndexPath:[shopCarBtt getData:@"sa"]];
    UIButton *shopCarBt= [UIButton buttonWithType:UIButtonTypeCustom];
    [self addAnimatedWithFrame:CGRectMake(WIGHT-30,cellRect.origin.y+cellRectss.origin.y+20, 30, 30)];
    
}

- (void)addAnimatedWithFrame:(CGRect)frame {
    
    
    // 该部分动画 以self.view为参考系进行
    frame = [[UIApplication sharedApplication].keyWindow  convertRect:frame fromView:self.view];
    CGPoint endpoint = CGPointMake(frame.origin.x, self.view.window.bounds.size.height-49/2);
    CGPoint startpoint = CGPointMake(40, frame.origin.y+20);
    ShopImage *image1 =[[ShopImage alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [self.view.window addSubview:image1];
    [image1 addAnimatedWithFrame:startpoint :endpoint];
    
    int num = [GetDefaults(@"chopchartNum") intValue];
    SetDefaults(@"chopchartNum", [NSNumber numberWithInt:num+1]);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"checkshopchartBadge" object:nil];
    
}
//下载商品数据
-(void)loadshoplistdata
{
    
    
    [ASIHttpMangment ShoplistWithRequestURL:@"" pragram:@{@"category_ID":[NSNumber numberWithInt:1]} success:^(NSDictionary *resultObject) {
        if (self.dataSource&&self.dataSource.count>0) {
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:[resultObject objectForKey:@"shoplist"]];
            [self.tableview reloadData];
        }
        
    } fail:^(NSDictionary *errdic) {
        [SVProgressHUD showSuccessWithStatus:@"网络不稳定,请重试！"];
        [UIView animateWithDuration:2 animations:^{
            [SVProgressHUD dismiss];
        }];
        
    }];
}


#pragma mark --------------集成刷新控件--------------------


/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
    //    [_chatTableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
        [self.tableview  addFooterWithTarget:self action:@selector(footerRereshing)];
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing{
    
      // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableview reloadData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableview headerEndRefreshing];
    });
}
- (void)footerRereshing
{
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableview reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableview footerEndRefreshing];
    });
}






#pragma mark - 添加到购物车的动画效果
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
