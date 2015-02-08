//
//  TFmyOrderViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/14.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFmyOrderViewController.h"

@interface TFmyOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
    NSMutableArray *dataSourceArray;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataSourceArray;

@end

@implementation TFmyOrderViewController
@synthesize tableview;
@synthesize dataSourceArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我的订单";
        self.dataSourceArray = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49) tag:5];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    UIView *bottomView =[UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 100) :[UIColor clearColor]];
    
    
    self.tableview.tableFooterView = bottomView;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self getOrderlistRequest];
}
#pragma mark ---------TableViewDataSource And TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourceArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[[[self.dataSourceArray objectAtIndex:section] objectForKey:@"freshFoodOrder"]objectForKey:@"freshFoodOrderDetails"] count];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 80) :GrayColor_APP];
    
   NSString *ID = [NSString stringWithFormat:@"订单编号:%@",[[self.dataSourceArray objectAtIndex:section] objectForKey:@"id"]];
    
    UILabel *product_sn = [UILabel LabelWithFrame:CGRectMake(20, 10, 150, 20) text:ID color:YellowColor_APP font:14];
    
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(220, 10, 80, 20) text:@"总计¥100.00 " color:[UIColor blackColor] font:14];
    [headview addSubview:product_sn];
//    [headview addSubview:product_price];
    
    return headview;
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
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    }
   
    
  NSDictionary *dic =  [[[[self.dataSourceArray objectAtIndex:indexPath.section] objectForKey:@"freshFoodOrder"] objectForKey:@"freshFoodOrderDetails"] objectAtIndex:indexPath.row];
    
    [cell.contentView addSubview:[CellViews CellViewWithmyOrderlist:dic]];
    return cell;
    
    
}


-(void)getOrderlistRequest
{
    
    [SVProgressHUD showWithStatus:@"loading..."];
    
    if (GetDefaults(@"userinformation")==nil) {
        return;
    }
    NSInteger customerID = [[[GetDefaults(@"userinformation") objectForKey:@"account"] objectForKey:@"id"] integerValue];
    NSDictionary * postdic = @{@"customerId":[NSNumber numberWithInteger:customerID]};
    
    
    [ASIHttpMangment ShoplistWithRequestURL: @"http://6meijia.com/request/myRequestJson" pragram:postdic success:^(NSDictionary *resultObject) {
        NSLog(@"response:%@",resultObject);
        
      
        
        
        [SVProgressHUD showSuccessWithStatus:@"success"];
        [UIView animateWithDuration:2 animations:^{
            [SVProgressHUD dismiss];
        }];
        if ([[[resultObject objectForKey:@"responsedata"] objectForKey:@"result"] count]>0) {
            if (self.dataSourceArray&&self.dataSourceArray.count>0) {
                [self.dataSourceArray removeAllObjects];
            }
            
            [self.dataSourceArray addObjectsFromArray:[[resultObject objectForKey:@"responsedata"] objectForKey:@"result"]];
            [self.tableview reloadData];
        }
        
    } fail:^(NSDictionary *errdic) {
        [SVProgressHUD showSuccessWithStatus:@"网络不稳定,请重试！"];
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
