//
//  TFshoppingcartViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFshoppingcartViewController.h"

@interface TFshoppingcartViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *tableview;
}
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation TFshoppingcartViewController
@synthesize tableview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"购物车";
        self.tabBarItem =  [self.tabBarItem initWithTitle:@"购物车" image:[UIImage imageNamed:@"tabbar_04.png"] selectedImage:[UIImage imageNamed:@"tabbar_04.png"]];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];


    [self initnavigationItem];
    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49) tag:2];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
}

-(void)initnavigationItem
{
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(WIGHT-90, 0, 80, 35) Normal:nil Select:nil Title:@"提交订单"];
    [registButton addTarget:self action:@selector(ClickBt_submitorderVC:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registButton];
    
}
-(void)ClickBt_submitorderVC:(UIButton*)btn
{
    
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
    return 10;
    
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
        
        NSArray *list = @[@"不赏赐",@"赏两块",@"赏三块"];
        for (int i=0; i<3; i++) {
            UIButton *button = [UIButton ButtonWithFrame:CGRectMake(15+i*100, 35, 90, 35) Normal:nil Select:nil Title:list[i]];
            button.layer.cornerRadius = 3;
            button.backgroundColor = GreenColor_APP;
            [footView addSubview:button];
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
            
            UIButton *datebutton = [UIButton ButtonWithFrame:CGRectMake(60, 0, 40, 40) Normal:nil Select:nil Title:@"上午"];
            [datebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            datebutton.titleLabel.font = [UIFont systemFontOfSize:13];
            [datebutton addTarget:self action:@selector(datebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *timebutton = [UIButton ButtonWithFrame:CGRectMake(240, 0, 60, 40) Normal:nil Select:nil Title:@"10:00"];
            [timebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            timebutton.titleLabel.font = [UIFont systemFontOfSize:13];

            [datebutton addTarget:self action:@selector(timebuttonAction:) forControlEvents:UIControlEventTouchUpInside];

            
            [cell.contentView addSubview:datebutton];
            [cell.contentView addSubview:timebutton];
            
        }
        if (indexPath.row==2) {
            cell.textLabel.text =  @"服务地址";
            cell.detailTextLabel.text = @"镇江花园路103号501";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        }
        if (indexPath.row==3) {
            cell.textLabel.text =  @"备注";
            
            UITextView *textview = [UITextView textViewWithFrame:CGRectMake(90, 5, 200, 60) viewTag:1 viewFont:13 textColor:[UIColor grayColor]];
            [cell.contentView addSubview:textview];
        }

        
    }
    if (indexPath.section==1) {
           [cell.contentView addSubview:[CellViews CellViewWithShopchartlistpart:nil]];
        
        UITextField *pronumfield = (UITextField*)[cell.contentView viewWithTag:1];
        pronumfield.delegate =  self;
        
        
 
    }
    
    
    return cell;
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
-(void)datebuttonAction:(UIButton*)button
{
    
}
-(void)timebuttonAction:(UIButton*)button
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
