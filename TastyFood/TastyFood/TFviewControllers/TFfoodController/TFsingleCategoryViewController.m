//
//  TFsingleCategoryViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/24.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFsingleCategoryViewController.h"

@interface TFsingleCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
    NSArray *dataSource;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *dataSource;

@end

@implementation TFsingleCategoryViewController
@synthesize tableview;
@synthesize dataSource;
@synthesize category_Title;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.title = self.category_Title;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    

//    [self initSegment];
    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49-64) tag:2];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    // Do any additional setup after loading the view.
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
