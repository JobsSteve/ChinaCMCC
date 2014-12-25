//
//  TFfoodMarketViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFfoodMarketViewController.h"

@interface TFfoodMarketViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
    NSArray *dataSource;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *dataSource;

@end

@implementation TFfoodMarketViewController
@synthesize dataSource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"美家菜场";
       self.tabBarItem =  [self.tabBarItem initWithTitle:@"美家菜场" image:[UIImage imageNamed:@"tabbar_02.png"] selectedImage:[UIImage imageNamed:@"tabbar_02.png"]];
        self.dataSource = @[@"1212",@"4344",@"556",@"1212",@"4344",@"556",@"1212",@"4344",@"556"];
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
    
    // Do any additional setup after loading the view.
}

-(void)initSegment
{
    UIView *segmentbackgroundview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 40) :GrayColor_APP];
    
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"蔬菜",@"水产",@"肉类",@"干货",@"其他"]];
    segment.frame = CGRectMake(10, 5, WIGHT-20, 30);
    segment.tintColor = GreenColor_APP;
    segment.backgroundColor = [UIColor whiteColor];
    segment.selectedSegmentIndex = 0;
    [segmentbackgroundview addSubview:segment];
    [self.view addSubview:segmentbackgroundview];
    
}
#pragma mark ---------TableViewDataSource And TableViewDelegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 10;
    
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
    
    [cell.contentView addSubview:[CellViews CellViewWithShoplist:nil]];
   
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
    
    NSLog(@"%lf",cellRectss.origin.y);

    CGRect cellRect = [self.tableview rectForRowAtIndexPath:[shopCarBtt getData:@"sa"]];
    
    
    NSLog(@"%lf",cellRect.origin.y);
    
    NSLog(@"%lf",cellRect.origin.y+cellRectss.origin.y);
    
    
    UIButton *shopCarBt= [UIButton buttonWithType:UIButtonTypeCustom];


    [self addAnimatedWithFrame:CGRectMake(260,cellRect.origin.y+cellRectss.origin.y+20, 30, 30)];
    
    
}
#pragma mark - 添加到购物车的动画效果
// huangyibiao
- (void)addAnimatedWithFrame:(CGRect)frame {
    
    
    // 该部分动画 以self.view为参考系进行
    frame = [[UIApplication sharedApplication].keyWindow  convertRect:frame fromView:self.view];
    
    
    
    UIButton *move = [[UIButton alloc] initWithFrame:frame];
    [move setImage:[UIImage imageNamed:@"shapchart.png"] forState:UIControlStateNormal];
    [move setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    move.contentMode = UIViewContentModeScaleToFill;
    [[UIApplication sharedApplication].keyWindow addSubview:move];
    // 加入购物车动画效果
    [UIView animateWithDuration:1.2 animations:^{
        move.frame = CGRectMake(frame.origin.x, self.view.window.bounds.size.height-49,
                                frame.size.width, frame.size.height);
    } completion:^(BOOL finished) {
        [move removeFromSuperview];
        
        int num = [GetDefaults(@"chopchartNum") intValue];
        SetDefaults(@"chopchartNum", [NSNumber numberWithInt:num+1]);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"checkshopchartBadge" object:nil];
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
