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
}
@property(nonatomic,strong)UITableView *tableview;

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

    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49) tag:2];
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
   
    
    return cell;
    
    
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
