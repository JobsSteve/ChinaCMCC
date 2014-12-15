//
//  TFpersonViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFpersonViewController.h"
#import "TFloginViewController.h"
#import "TFeditPswViewController.h"
#import "TFeditAddressViewController.h"
#import "TFmyOrderViewController.h"
@interface TFpersonViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
}
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation TFpersonViewController
@synthesize tableview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我";
        self.tabBarItem =  [self.tabBarItem initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_03.png"] selectedImage:[UIImage imageNamed:@"tabbar_03.png"]];

    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@",GetDefaults(Defaults_LoginName));
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (GetDefaults(Defaults_LoginName)==nil) {
        TFloginViewController *VC = [[TFloginViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49) tag:1];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    UIView *bottomView =[UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 100) :[UIColor clearColor]];
    
    
    
    UIButton *logout_bt=[UIButton ButtonWithFrame:CGRectMake(30, 50, WIGHT-30*2, 35) Normal:[UIImage imageNamed:@"loginbtn_image.png"] Select:[UIImage imageNamed:@"loginbtn_image.png"] Title:@"注销登录"];
    logout_bt.backgroundColor = RGBAcolor(255, 157, 7, 1);
    [logout_bt addTarget:self action:@selector(ClickBt_Logout:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:logout_bt];
    
    self.tableview.tableFooterView = bottomView;
   
    
}
-(void)ClickBt_Logout:(UIButton*)button
{
    
}
#pragma mark ---------TableViewDataSource And TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 3;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
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
    cell.imageView.image = [UIImage imageNamed:@"tabbar_04.png"];
    if (indexPath.section==0) {
        cell.textLabel.text = @"13717677776";
    }
    if (indexPath.section==1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSArray *list = @[@"常用地址",@"历史订单",@"修改密码"];
        cell.textLabel.text = list[indexPath.row];
    }
  
    
    return cell;
    
    
}
-(void)ClickBt_submitorderVC:(UIButton*)btn
{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *VC ;
    if (indexPath.section==1&&indexPath.row==0) {
        VC = [[TFeditAddressViewController alloc]init];
        
    }
    if (indexPath.section==1&&indexPath.row==1) {
        VC = [[TFmyOrderViewController alloc]init];
        
    }
    if (indexPath.section==1&&indexPath.row==2) {
       VC = [[TFeditPswViewController alloc]init];

    }
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
