//
//  TFeditPswViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/14.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFeditPswViewController.h"

@interface TFeditPswViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
}
@property(nonatomic,strong)UITableView *tableview;


@end

@implementation TFeditPswViewController
@synthesize tableview;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"修改密码";
        [self initnavigationItem];
    }
    return self;
}
-(void)initnavigationItem
{
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(WIGHT-60, 0, 50, 35) Normal:nil Select:nil Title:@"提交"];
    [registButton addTarget:self action:@selector(ClickBt_submit) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registButton];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49) tag:3];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    UIView *bottomView =[UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 100) :[UIColor clearColor]];

    
    self.tableview.tableFooterView = bottomView;

    // Do any additional setup after loading the view.
}
#pragma mark ---------TableViewDataSource And TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 4;
    
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

    
    
    NSArray *list = @[@"用户名/手机号:",@"原始密码:",@"修改密码:",@"确认密码:"];
    NSArray *list2 = @[@"15201724098",@"123456",@"654321",@"654321"];

    cell.textLabel.text = list[indexPath.row];

    UITextField *field = [UITextField textFieldWithFrame:CGRectMake(0, 0, 160, 40) fieldTag:indexPath.row fieldFont:14 textColor:[UIColor grayColor] fieldtext:list2[indexPath.row]];
    field.textAlignment = NSTextAlignmentRight;
    field.borderStyle = UITextBorderStyleNone;
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    cell.accessoryView =field;
    
    return cell;
    
    
}
-(void)ClickBt_submit
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
