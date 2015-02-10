//
//  TFmyPathViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/18.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFmyPathViewController.h"
#import "TFregionViewController.h"
@interface TFmyPathViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{
    UITableView *tableview;
    NSInteger selectIndexrow;
    NSDictionary *dataSource;
    NSArray *selectedScource;
    NSString *country_string;
    NSString *city_string;
    NSInteger selectIndex;//0:城市 1：区域
    
    BOOL isSelected;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,assign)NSInteger selectIndexrow;

@property(nonatomic,strong)NSDictionary *dataSource;
@property(nonatomic,strong)NSArray *selectedScource;

@property(nonatomic,strong)NSString *country_string;
@property(nonatomic,strong)NSString *city_string;

@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,assign)BOOL isSelected;

@end

@implementation TFmyPathViewController
@synthesize tableview;
@synthesize selectIndexrow;
@synthesize dataSource;
@synthesize selectedScource;
@synthesize country_string,city_string;
@synthesize selectIndex;
@synthesize isSelected;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.dataSource = @{@"北京":@[@"朝阳区",@"通州区",@"海淀区",@"丰台区"],@"上海":@[@"浦东新区",@"嘉定区",@"徐汇区",@"闸北区"]};
        
        self.selectIndexrow = -1;
        self.isSelected = NO;
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableview reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Pathbackimage.png"]];

    [self.view addSubview:[UIImageView imageViewWithFrame:self.view.bounds :@"Pathbackimage.png"]];

    //   [self.view addSubview: [UIImageView imageViewWithFrame:self.view.bounds :@"Pathbackimage.png"]];

    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT-40, self.view.frame.size.height-49) tag:4];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableview.separatorColor = [UIColor whiteColor];
    self.tableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableview];
    
    UIView *bottomView =[UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 64) :[UIColor clearColor]];
    
    UIView *headerView =[UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 64) :[UIColor clearColor]];
    
    self.tableview.tableHeaderView = headerView;

    self.tableview.tableFooterView = bottomView;
    
}
#pragma mark ---------TableViewDataSource And TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
        return 70;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *headerView =[UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 70) :[UIColor clearColor]];
    
    UIButton *picButton = [UIButton ButtonWithFrame:CGRectMake(20, 10, WIGHT-40-40, 35) Normal:nil Select:nil Title:@"挑菜去"];
    [picButton addTarget:self action:@selector(pathDismiss:) forControlEvents:UIControlEventTouchUpInside];
    picButton.layer.cornerRadius = 4;
    picButton.layer.borderColor = [UIColor whiteColor].CGColor;
    picButton.layer.borderWidth = 1;
    picButton.clipsToBounds = YES;
    [headerView addSubview:picButton];

   
    return headerView;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView =[UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 100) :[UIColor clearColor]];
    
    UIButton *picButton = [UIButton ButtonWithFrame:CGRectMake(20, 10, 70, 70) Normal:[UIImage imageNamed:@"Icon.png"] Select:[UIImage imageNamed:@"Icon.png"] Title:nil];
    picButton.layer.cornerRadius = 70/2;
    picButton.layer.borderColor = [UIColor whiteColor].CGColor;
    picButton.layer.borderWidth = 3;
    picButton.clipsToBounds = YES;
    [headerView addSubview:picButton];
    
    
    UILabel *namelabel = [UILabel LabelWithFrame:CGRectMake(100, 25, 180, 20) text:GetDefaults(Defaults_LoginName) color:[UIColor whiteColor] font:17];
    namelabel.font = [UIFont boldSystemFontOfSize:17];
    [headerView addSubview:namelabel];
    
    return headerView;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CelebrityCheckTableCell";
    [tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.backgroundColor = [UIColor clearColor];
        cell.detailTextLabel.textColor = [UIColor whiteColor];
    }

        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:@"location.png"];
        cell.textLabel.text = @"区域:";

    if (self.country_string.length>0) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",self.country_string,self.city_string];
    }
    
   
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSLocateView *locateView = [[TSLocateView alloc] initWithTitle:@"定位城市" delegate:self];
    if (self.isSelected) {
        return;
    }
    [locateView showInView:self.view.window];
    self.isSelected = YES;
  
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    TSLocateView *locateView = (TSLocateView *)actionSheet;
    TSLocation *location = locateView.locate;
    NSLog(@"country:%@ city:%@ lat:%f lon:%f",location.state, location.city, location.latitude, location.longitude);
    //You can uses location to your application.
    if(buttonIndex == 0) {
        NSLog(@"Cancel");
    }else {
        NSLog(@"Select");
        self.country_string = location.state;
        self.city_string = location.city;
        [self.tableview reloadData];
        
    }
    self.isSelected = NO;

}
-(void)pathDismiss:(UIButton*)btn
{
    //记下选择区域数据 @“上海 浦东新区”  分隔符:空格
    NSString *string =  [NSString stringWithFormat:@"%@ %@",self.country_string,self.city_string];
    SetDefaults(@"selectArea", string);
    //切换地区购物车商品清空
    GetDefaults(@"shopchartlist");
    
    
    
    
    [[self slidingPanelController] closePanel];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
