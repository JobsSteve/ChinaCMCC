//
//  TFshoppingcartViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFshoppingcartViewController.h"
#import "ChartSelectbuttonView.h"
#import "TFeditAddressViewController.h"
@interface TFshoppingcartViewController ()<UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,DatePickerViewDelegate>
{
    UITableView *tableview;
    DatePickerView *datePickerView;
    UITextView *textview;
    NSString *sendTime_value;

    AFPopupView *successPopview;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)DatePickerView *datePickerView;
@property(nonatomic,strong)UITextView *textview;

@property(nonatomic,strong)NSString *sendTime_value;
@property(nonatomic,strong)AFPopupView *successPopview;


@end

@implementation TFshoppingcartViewController
@synthesize tableview;
@synthesize datePickerView;
@synthesize sendTime_value;
@synthesize textview;
@synthesize successPopview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"购物车";
        self.tabBarItem =  [self.tabBarItem initWithTitle:@"购物车" image:[UIImage imageNamed:@"tabbar_04.png"] selectedImage:[UIImage imageNamed:@"tabbar_04.png"]];

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


    [self initnavigationItem];
    [self initsubview];
    [self initTableview];
    
    [self initdatepicker];
    [self initpopview];
}
//初始化弹出视图
-(void)initpopview{
    UIImageView *imageview = [UIImageView imageViewWithFrame:CGRectMake(0, 0, WIGHT, HEIGHT) :@"ordersuccess.png"];
    self.successPopview =  [AFPopupView popupWithView:imageview];

}
-(void)initsubview{
    
    self.textview = [UITextView textViewWithFrame:CGRectMake(90, 5, 200, 60) viewTag:1 viewFont:13 textColor:[UIColor grayColor]];
    self.textview.returnKeyType = UIReturnKeyDone;
    self.textview.delegate = self;
}
-(void)initTableview
{
    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49-20) tag:2];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
}

-(void)initdatepicker
{
    self.datePickerView = [[DatePickerView alloc]initWithFrame:CGRectMake(0,200, WIGHT, 190)];
    [self.datePickerView initShowpickerview:@[@"明天",@"后天"]  : @[@"10:00",@"11:00",@"12:00",@"13:00",@"14:100",@"15:00"]];
    self.datePickerView.delegate = self;
    
}
-(void)initnavigationItem
{
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(WIGHT-90, 0, 80, 35) Normal:nil Select:nil Title:@"提交订单"];
    [registButton addTarget:self action:@selector(ClickBt_submitorderVC:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registButton];
    
}
//提交订单
-(void)ClickBt_submitorderVC:(UIButton*)btn
{


    [self.successPopview show];

    [self performSelector:@selector(dismisspopview) withObject:nil afterDelay:2];
    SetDefaults(@"chopchartNum", [NSNumber numberWithInt:0]);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"checkshopchartBadge" object:nil];

}
//提示页面消失
-(void)dismisspopview
{
    [self.successPopview hide];
}
#pragma mark ---------TableViewDataSource And TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 4;
    }
    return  [GetDefaults(@"chopchartNum") intValue];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==3) {
            return 70;
        }
        return 45;
    }
    return 80;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
       return  @"用户信息";
    }
    return @"订单信息";
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 80;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if (section==0) {
        UIView *footView = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 80) :[UIColor clearColor]];
        
        UILabel *label = [UILabel LabelWithFrame:CGRectMake(10, 0, WIGHT-20, 30) text:@" 亲,美家小哥用心为您挑选食材，打个赏吧!" color:[UIColor whiteColor] font:15];
        label.backgroundColor = YellowColor_APP;
        label.layer.cornerRadius = 3;
        [footView addSubview:label];
        
        
        ChartSelectbuttonView *view = [[ChartSelectbuttonView alloc]initWithFrame:CGRectMake(0, 35, WIGHT, 35)];
        
        [footView addSubview:view];
        
        NSArray *list = @[@"不赏赐",@"赏两块",@"赏三块"];
        for (int i=0; i<3; i++) {
            UIButton *button = [UIButton ButtonWithFrame:CGRectMake(15+i*100, 35, 90, 35) Normal:nil Select:nil Title:list[i]];
            button.layer.cornerRadius = 3;
            button.backgroundColor = GreenColor_APP;
        }
        
        return footView;
        
    }
    return nil;
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

    NSArray *imagelist = @[@"tabbar_01.png",@"tabbar_01.png",@"tabbar_01.png",@"tabbar_01.png"];
    if (indexPath.section==0) {
        cell.imageView.image = [UIImage imageNamed:imagelist[indexPath.row]];
        if (indexPath.row==0) {
            cell.textLabel.text =  @"手机号";
            cell.detailTextLabel.text = @"15201724099";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        if (indexPath.row==1) {
            cell.textLabel.text =  @"配送时间";
            if (self.sendTime_value&&[self.sendTime_value length]>0) {
                cell.detailTextLabel.text =self.sendTime_value;
            }
        }
        if (indexPath.row==2) {
            cell.textLabel.text =  @"服务地址";
            cell.detailTextLabel.text = @"镇江花园路103号501";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        if (indexPath.row==3) {
            cell.textLabel.text =  @"备注";
            [cell.contentView addSubview:textview];
        }

        
    }
    if (indexPath.section==1) {
           [cell.contentView addSubview:[CellViews CellViewWithShopchartlistpart:nil]];
        
        UITextField *pronumfield = (UITextField*)[cell.contentView viewWithTag:1];
        pronumfield.delegate =  self;
        pronumfield.returnKeyType= UIReturnKeyDone;
        pronumfield.keyboardType = UIKeyboardTypeNumberPad;
        
        UIButton *btn =(UIButton*)[cell.contentView viewWithTag:203];
        [btn addTarget:self action:@selector(deleteshopAction:) forControlEvents:UIControlEventTouchUpInside];
        
 
    }
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==1) {
          [self.datePickerView ShowPickView];
        }
        if (indexPath.row==0||indexPath.row==2) {
            TFeditAddressViewController *VC = [[TFeditAddressViewController alloc]init];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];

}
-(void)deleteshopAction:(UIButton*)button
{
    int num =  [GetDefaults(@"chopchartNum") intValue]-1;
    SetDefaults(@"chopchartNum", [NSNumber numberWithInt:num]);
    [self.tableview reloadData];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"checkshopchartBadge" object:nil];

}
#pragma mark - Touch事件
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textview resignFirstResponder];
}
#pragma mark - UITextFieldDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{
    [self.textview resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   return  [self.textview resignFirstResponder];

}
#pragma mark -- picker delegate
-(void)didselectPickerView:(NSString*)string
{
    self.sendTime_value = string;
    [self.tableview reloadData];
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
