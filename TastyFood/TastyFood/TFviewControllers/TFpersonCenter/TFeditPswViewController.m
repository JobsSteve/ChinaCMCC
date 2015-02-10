//
//  TFeditPswViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/14.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFeditPswViewController.h"

@interface TFeditPswViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *tableview;
    NSString *MobileNumstring;
    NSString *oldPSW;
    NSString *oldPSW2;
    NSString *NewPSW;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSString *MobileNumstring;
@property(nonatomic,strong)NSString *oldPSW;
@property(nonatomic,strong)NSString *oldPSW2;
@property(nonatomic,strong)NSString *NewPSW;
@end

@implementation TFeditPswViewController

@synthesize tableview;
@synthesize MobileNumstring;
@synthesize oldPSW2;
@synthesize oldPSW;
@synthesize NewPSW;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"修改密码";
        [self initnavigationItem];
        self.MobileNumstring = [[NSString alloc]init];
        self.oldPSW = [[NSString alloc]init];
        self.oldPSW2 = [[NSString alloc]init];
        self.NewPSW = [[NSString alloc]init];
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
    //NSArray *list2 = @[@"15201724098",@"123456",@"654321",@"654321"];
    cell.textLabel.text = list[indexPath.row];

    UITextField *field = [UITextField textFieldWithFrame:CGRectMake(0, 0, 160, 40) fieldTag:indexPath.row fieldFont:14 textColor:[UIColor grayColor] fieldtext:@""];
    field.textAlignment = NSTextAlignmentRight;
    field.borderStyle = UITextBorderStyleNone;
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    cell.accessoryView =field;
    field.delegate = self;
    
    return cell;
    
    
}
-(void)ClickBt_submit
{
    [self.view endEditing:YES];

    if ([self.MobileNumstring length]==0||[self.oldPSW length]==0||[self.oldPSW2 length]==0||[self.NewPSW length]==0) {
        return;
    }
    if (![self.NewPSW isEqual:self.oldPSW2]) {

        [SVProgressHUD showSuccessWithStatus:@"输入密码不一致,请重新输入"];
        [UIView animateWithDuration:3 animations:^{
            [SVProgressHUD dismiss];
        }];
        return;
    }
    
    [self request_Username:self.MobileNumstring OPwd:self.oldPSW NPwd:self.NewPSW];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag==0) {
        
        self.MobileNumstring = textField.text;
    }if (textField.tag==1) {
        
        self.oldPSW = textField.text;
    }if (textField.tag==2) {
        
        self.oldPSW2 = textField.text;
    }if (textField.tag==3) {
        
        self.NewPSW = textField.text;
    }
    
}

-(void)request_Username:(NSString *)username OPwd:(NSString *)oldpwd NPwd:(NSString *)newpwd{
    
    
    NSDictionary * postdic = @{@"loginMobile":username,@"oldPassword":oldpwd,@"newPassword":newpwd};
    [SVProgressHUD showWithStatus:@"密码修改中..."];
    
    
    [ASIHttpMangment AccountWithRequestURL:@"http://6meijia.com/profile/updatePassJson" pragram:postdic success:^(NSDictionary *resultObject) {
        NSLog(@"注册response:%@",resultObject);
        NSString *status = [[resultObject objectForKey:@"responsedata"] objectForKey:@"status"];
        
        if ([status isEqual:@"success"]) {
            [SVProgressHUD showSuccessWithStatus:@"修改成功"];
         }else{
            [SVProgressHUD showSuccessWithStatus:@"修改失败"];
        }
        [UIView animateWithDuration:4 animations:^{
            [SVProgressHUD dismiss];
        }];
        
    } fail:^(NSDictionary *errdic) {
        NSLog(@"注册失败");
        [SVProgressHUD showSuccessWithStatus:@"注册失败"];
        [UIView animateWithDuration:2 animations:^{
            [SVProgressHUD dismiss];
        }];
    }];
    //
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    
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
